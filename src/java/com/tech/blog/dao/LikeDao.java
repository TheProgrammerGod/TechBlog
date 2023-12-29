/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.dao;

/**
 *
 * @author KIIT
 */
import java.sql.*;
public class LikeDao {
    Connection con;

    public LikeDao(Connection con) {
        this.con = con;
    }
    
    //method to insert a like into the DB
    public boolean insertLike(int postId, int userId){
        boolean flag = false;
        try{
            String query = "insert into likes(postId,userId) values(?,?)";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, postId);
            pstmt.setInt(2, userId);
            pstmt.executeUpdate();
            flag = true;
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return flag;
    }
    
    //method to count the number of likes of a particular blog
    public int countLikeOnPost(int postId){
        int count = 0;
        
        try{
            String query = "Select count(*) from likes where postId=?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, postId);
            ResultSet set = pstmt.executeQuery();
            if(set.next()){
                count = set.getInt(1);
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
        
        return count;
    }
    
    //method to check if a post is liked by a user
    public boolean isLikedBy(int userId, int postId){
        boolean flag = false;
        
        try{
            PreparedStatement pstmt = con.prepareStatement("select id from likes where postId = ? and userId = ?");
            pstmt.setInt(1, postId);
            pstmt.setInt(2, userId);
            ResultSet set = pstmt.executeQuery();
            if(set.next())
               flag = true;
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
        return flag;
    }
    
    //method to dislike a post by a user
    public boolean dislikePost(int userId, int postId){
        boolean flag = false;
        
        try{
            PreparedStatement pstmt = con.prepareStatement("delete from likes where postId = ? and userId = ?");
            pstmt.setInt(1, postId);
            pstmt.setInt(2, userId);
            pstmt.executeUpdate();
            flag = true;
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
        return flag;
    }
}
