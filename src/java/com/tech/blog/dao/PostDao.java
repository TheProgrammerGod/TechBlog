/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.dao;

/**
 *
 * @author KIIT
 */
import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;
import java.sql.*;
import java.util.ArrayList;
public class PostDao {
    private Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }
    
    //method to get all the categories present in DB
    public ArrayList<Category> getCategories(){
        ArrayList<Category> categories = new ArrayList<>();
        try{
            String query = "Select * from category";
            Statement stmt = con.createStatement();
            ResultSet set = stmt.executeQuery(query);
            while(set.next()){
                Category category = new Category(set.getInt("id"),set.getString("name"),set.getString("description"));
                categories.add(category);
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return categories;
    }
    
    //method to save a post in DB
    public boolean savePost(Post post){
        boolean flag = false;
        try{
            String query = "insert into post(title,content,code,catId,image,userId) values(?,?,?,?,?,?)";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1,post.getTitle());
            pstmt.setString(2,post.getContent());
            pstmt.setString(3, post.getCode());
            pstmt.setInt(4, post.getCatId());
            pstmt.setString(5,post.getImage());
            pstmt.setInt(6,post.getUserId());
            
            pstmt.executeUpdate();
            flag = true;
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return flag;
    }
    
}
