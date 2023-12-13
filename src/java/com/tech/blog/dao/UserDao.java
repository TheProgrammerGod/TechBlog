/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.dao;

/**
 *
 * @author KIIT
 */
import com.tech.blog.entities.User;
import java.sql.*;
public class UserDao {
    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }
    
    //method to insert user data into DB
    public boolean saveUser(User user){
        boolean flag = false;
        try {
            String query = "insert into user(name,email,gender,password) values(?,?,?,?) ";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getGender());
            pstmt.setString(4, user.getPassword());
            pstmt.executeUpdate();
            flag = true;
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return flag;
    }
    
    
    //method to fetch user data from DB
    public User getUser(String email, String password){
        User user = null;
        
        try{
            String query = "select * from user where email=? and password=?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            
            ResultSet set = pstmt.executeQuery();
            
            if(set.next()){
                user = new User();
                
                user.setEmail(set.getString("email"));
                user.setId(set.getInt("id"));
                user.setName(set.getString("name"));
                user.setGender(set.getString("gender"));
                user.setPassword(set.getString("password"));
                user.setDateTime(set.getTimestamp("rdate"));
                user.setProfile(set.getString("profile"));
                
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
        return user;
    }
    
    //method to update user data into DB
    public boolean updateUser(User user){
        boolean flag = false;
        try{
            String query = "update user set name=?, email=?, gender=?, password=?, profile=? where id=?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getGender());
            pstmt.setString(4, user.getPassword());
            pstmt.setString(5, user.getProfile());
            pstmt.setInt(6, user.getId());
            
            pstmt.executeUpdate();
            flag = true;
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return flag;
    }
}
