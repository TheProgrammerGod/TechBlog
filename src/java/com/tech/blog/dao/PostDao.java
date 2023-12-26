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
import java.util.List;
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
    
    //method to get all posts from DB
    public List<Post> getAllPosts(){
        List<Post> posts = new ArrayList<>();
        
        try{
            String query = "select * from post order by id desc";
            Statement stmt = con.createStatement();
            ResultSet set = stmt.executeQuery(query);
            while(set.next()){
                Post post = new Post();
                post.setId(set.getInt("id"));
                post.setTitle(set.getString("title"));
                post.setContent(set.getString("content"));
                post.setCode(set.getString("code"));
                post.setImage(set.getString("image"));
                post.setDate(set.getTimestamp("date"));
                post.setCatId(set.getInt("catId"));
                post.setUserId(set.getInt("userId"));
                posts.add(post);
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
        return posts;
    }
    
    
    //method to get all posts of one category from DB
    public List<Post> getPostsByCategory(int catId){
        List<Post> posts = new ArrayList<>();
        
        try{
            String query = "select * from post where catId=?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, catId);
            ResultSet set = pstmt.executeQuery();
            while(set.next()){
                Post post = new Post();
                post.setId(set.getInt("id"));
                post.setTitle(set.getString("title"));
                post.setContent(set.getString("content"));
                post.setCode(set.getString("code"));
                post.setImage(set.getString("image"));
                post.setDate(set.getTimestamp("date"));
                post.setCatId(catId);
                post.setUserId(set.getInt("userId"));
                posts.add(post);
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
        return posts;
    }
    
    //method to get a single post from DB
    public Post getPostById(int postId){
        Post post = null;
        try{
            String query = "Select * from post where id= ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, postId);
            ResultSet set = pstmt.executeQuery();
            while(set.next()){
                post = new Post();
                post.setId(set.getInt("id"));
                post.setTitle(set.getString("title"));
                post.setContent(set.getString("content"));
                post.setCode(set.getString("code"));
                post.setImage(set.getString("image"));
                post.setDate(set.getTimestamp("date"));
                post.setCatId(set.getInt("catId"));
                post.setUserId(set.getInt("userId"));
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return post;
    }
}
