package com.tech.blog.dao;

import com.tech.blog.entities.User;
import java.sql.*;

public class UserDao {

    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }

//    Method to insert user to database
    public boolean saveUser(User user) {
        boolean f = false;
        try {

//            User --> Database
            String query = "INSERT INTO user (name, email, password, gender) values (?, ?, ?, ?);";

            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getGender());

            pstmt.executeUpdate();

            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

//    Get user by useremail and userpassword
    public User getUserByEmailAndPassword(String email, String password) {
        User user = null;

        try {

            String query = "SELECT * FROM user WHERE email = ? and password = ? ;";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, password);

            ResultSet set = pstmt.executeQuery();

            if (set.next()) {
                user = new User();
//                Data from database
                String name = set.getString("name");
//                Set to user object
                user.setName(name);
                user.setId(set.getInt("id"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));
                user.setRegister_date(set.getTimestamp("register_date"));
                user.setProfile(set.getString("profile"));
            } else {
                user = null;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

//    Update profile details in database
    public boolean updateUser(User user) {
        boolean f = false;

        try {

            String query = "UPDATE USER SET name = ?, email = ?, password = ?, gender = ?, profile = ? WHERE id = ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getGender());
            pstmt.setString(5, user.getProfile());
            pstmt.setInt(6, user.getId());

            pstmt.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    public User getUserByUserId(int userId) {
        User p = null;
//      Fetch all the Posts
        try {
            String query = "SELECT * FROM user WHERE id = ?;";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, userId);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String password = rs.getString("password");
                String gender = rs.getString("gender");
                Timestamp date = rs.getTimestamp("register_date");
                p = new User(id, name, password, email, gender, date);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return p;
    }

}
