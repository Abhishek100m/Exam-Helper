/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.abhi.tech.dao;

import com.abhi.tech.Entities.Category;
import com.abhi.tech.Entities.Post;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author mahakaal
 */
public class PostDao {

    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }

    public ArrayList<Category> getAllCategoies() {
        ArrayList<Category> objlist = new ArrayList<>();
        try {
            String query = "select * from categories";
            Statement st = this.con.createStatement();
            ResultSet set = st.executeQuery(query);
            while (set.next()) {
                int cid = set.getInt("cid");
                String name = set.getString("name");
                String description = set.getString("description");
                Category c = new Category(cid, name, description);
                objlist.add(c);
                System.out.println("Success");
            }
        } catch (Exception e) {
            System.out.println("FAILED ");
            e.printStackTrace();
        }

        return objlist;
    }
    
    
    public boolean savePost(Post p){
        boolean flag = false;
        try {
            System.out.println("Hii , from PostDao method ");
            String query = "insert into posts(pTitle,pContent,pCode,pPic,catId,userId)values(?,?,?,?,?,?)";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, p.getpTitle());
            pstmt.setString(2, p.getpContent());
            pstmt.setString(3, p.getpCode());
            pstmt.setString(4, p.getpPic());
            pstmt.setInt(5, p.getCatId());
            pstmt.setInt(6, p.getUserId());
            pstmt.executeUpdate();
             
            
            
            System.out.println("Success in postdao ");
            flag=true;
            
            
        } catch (Exception e) {
         e.printStackTrace();
        }
        
        
        
        return flag;
    }
    
     ////// Get All the Post 
    public List<Post>getAllPosts(){
        List<Post> listOfPost = new ArrayList<>();
       // fetching all posts 
      try {
            PreparedStatement pstmt = con.prepareStatement("Select * from posts");
            ResultSet rset = pstmt.executeQuery();
            while(rset.next()){
                int pid= rset.getInt("pid");
                String pTitle = rset.getString("pTitle");
                String pContent = rset.getString("pContent");
                String pCode = rset.getString("pCode");
                String pPic = rset.getString("pPic");
                Timestamp time = rset.getTimestamp("pDate");
                int catId = rset.getInt("catId");
                int userId= rset.getInt("userId");
                Post post = new Post(pid, pTitle, pContent, pCode, pPic, time, catId, userId);
                listOfPost.add(post);
            }
        } catch (Exception e) {
        e.printStackTrace();
        }
     
        return listOfPost;
    }
    
    // Here from this Function will give posts with the help of Category id 
    public List<Post> getPostByCatId(int categoryId){
             List<Post> postById = new ArrayList<>();
            //fetching by category id 
            try {
                String query = "Select * from posts where catId=? ";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1,categoryId);
            ResultSet rset = pstmt.executeQuery();
            while(rset.next()){
                int pid= rset.getInt("pid");
                String pTitle = rset.getString("pTitle");
                String pContent = rset.getString("pContent");
                String pCode = rset.getString("pCode");
                String pPic = rset.getString("pPic");
                Timestamp time = rset.getTimestamp("pDate");
                int userId= rset.getInt("userId");
                Post post = new Post(pid, pTitle, pContent, pCode, pPic, time,categoryId,userId);
                postById.add(post);
            }
        } catch (Exception e) {
        e.printStackTrace();
        }
        return postById;
    }
    
    public Post getPostByPostId(int postId){
        Post post = null;
        try {
            String query = "select * from posts where pId=?";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setInt(1, postId);
            ResultSet set = pstmt.executeQuery();
            if(set.next()){
             int pid= set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp time = set.getTimestamp("pDate");
                int userId= set.getInt("userId");
                int categoryId = set.getInt("catId");
              post = new Post(pid, pTitle, pContent, pCode, pPic, time,categoryId,userId);
             
            }
        } catch (Exception e) {
        e.printStackTrace();
        }
        return post;
    }
}
