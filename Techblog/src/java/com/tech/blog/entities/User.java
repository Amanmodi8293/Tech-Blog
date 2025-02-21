package com.tech.blog.entities;
import java.sql.*;

public class User {
    private int id;
    private String name;
    private String password;
    private String email;
    private String gender;
    private Timestamp register_date;
    private String profile;
    
//    Constructor

    public User(int id, String name, String password, String email, String gender, Timestamp register_date) {
        this.id = id;
        this.name = name;
        this.password = password;
        this.email = email;
        this.gender = gender;
        this.register_date = register_date;
    }

    public User() {
     
    }

    public User(String name, String password, String email, String gender) {
        this.name = name;
        this.password = password;
        this.email = email;
        this.gender = gender;
    }
    
//    Getter and Setter

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Timestamp getRegister_date() {
        return register_date;
    }

    public void setRegister_date(Timestamp register_date) {
        this.register_date = register_date;
    }

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }
    
    
}
