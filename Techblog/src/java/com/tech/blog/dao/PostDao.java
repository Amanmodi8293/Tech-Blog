package com.tech.blog.dao;

import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PostDao {

    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }

    public ArrayList<Category> getCategory() {

        ArrayList<Category> list = new ArrayList<>();

        try {

            String query = "SELECT * FROM categories;";

            Statement st = this.con.createStatement();
            ResultSet rs = st.executeQuery(query);

            while (rs.next()) {
                int cid = rs.getInt("cid");
                String name = rs.getString("name");
                String description = rs.getString("description");
                Category c = new Category(cid, name, description);
                list.add(c);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public boolean savePost(Post p) {
        boolean f = false;

        try {

            String query = "INSERT INTO POSTS (pTitle, pContent, pCode, pPic, cId, userId) VALUES (?,?,?,?,?,?);";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, p.getpTitle());
            pstmt.setString(2, p.getpContent());
            pstmt.setString(3, p.getpCode());
            pstmt.setString(4, p.getpPic());
            pstmt.setInt(5, p.getcId());
            pstmt.setInt(6, p.getUserId());
            pstmt.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

//  Get all the posts
    public List<Post> getAllPosts() {
        List<Post> list = new ArrayList<>();

//      Fetch all the Posts
        try {
            String query = "SELECT * FROM posts ORDER BY pid DESC;";

            PreparedStatement pstmt = con.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                int pid = rs.getInt("pid");
                String pTitle = rs.getString("pTitle");
                String pContent = rs.getString("pContent");
                String pCode = rs.getString("pCode");
                String pPic = rs.getString("pPic");
                Timestamp pDate = rs.getTimestamp("pDate");
                int cId = rs.getInt("cId");
                int userId = rs.getInt("userId");
                Post p = new Post(pid, pTitle, pContent, pCode, pPic, pDate, cId, userId);
                list.add(p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public List<Post> getPostByCatId(int catId) {
        List<Post> list = new ArrayList<>();

//      Fetch all the Posts
        try {
            String query = "SELECT * FROM posts WHERE cId = ?;";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, catId);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                int pid = rs.getInt("pid");
                String pTitle = rs.getString("pTitle");
                String pContent = rs.getString("pContent");
                String pCode = rs.getString("pCode");
                String pPic = rs.getString("pPic");
                Timestamp pDate = rs.getTimestamp("pDate");
                int cId = rs.getInt("cId");
                int userId = rs.getInt("userId");
                Post p = new Post(pid, pTitle, pContent, pCode, pPic, pDate, cId, userId);
                list.add(p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public Post getPostByPostId(int postId) {
        Post p = null;
//      Fetch all the Posts
        try {
            String query = "SELECT * FROM posts WHERE pid = ?;";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, postId);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                int pid = rs.getInt("pid");
                String pTitle = rs.getString("pTitle");
                String pContent = rs.getString("pContent");
                String pCode = rs.getString("pCode");
                String pPic = rs.getString("pPic");
                Timestamp pDate = rs.getTimestamp("pDate");
                int cId = rs.getInt("cId");
                int userId = rs.getInt("userId");
                 p = new Post(pid, pTitle, pContent, pCode, pPic, pDate, cId, userId);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return p;
    }
}
