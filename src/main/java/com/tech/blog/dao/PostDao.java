package com.tech.blog.dao;

import java.sql.* ;
import java.util.ArrayList;
import java.util.List;

import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;

public class PostDao {
	
	Connection con ;

	public PostDao(Connection con) {
		super();
		this.con = con;
	}
	
	public ArrayList<Category> getAllCategories(){
		ArrayList<Category> list = new ArrayList<>();
		
		try {
			
			String q = "select * from categories" ;
			
			Statement st = this.con.createStatement() ;
			
			ResultSet rs = st.executeQuery(q); 
			
			while(rs.next()) {
				int cid = rs.getInt("cid") ;
				String name = rs.getString("name");
				String description = rs.getString("description") ;
				
				Category c  = new Category(cid,name,description) ;
				list.add(c);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return list ;
	}
	
	public boolean savePost(Post post) {
		boolean f = false;
		
		try {
			
			String q = "insert into posts(pTitle,pContent,pCode,pPic,catId,userId) values(?,?,?,?,?,?)" ;
			
			PreparedStatement pst = con.prepareStatement(q) ;
			
			pst.setString(1, post.getpTitle());
			pst.setString(2, post.getpContent());
			pst.setString(3, post.getpCode());
			pst.setString(4, post.getpPic());
			pst.setInt(5, post.getCatId());
			pst.setInt(6, post.getUserId());
			
			pst.executeUpdate() ;
			f = true ;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		return f ;
	}

	
	// get all the posts 
	public List<Post> getAllPosts(){
		 List<Post> list = new ArrayList<>() ;
		 // fetch all posts
		 
		 try {
			 
			 PreparedStatement pst = con.prepareStatement("select * from posts order by pid desc") ;
			 
			 
			 ResultSet rs = pst.executeQuery() ;
			 
			 while(rs.next()) {
				 int pid = rs.getInt("pid") ;
				 String pTitle = rs.getString("pTitle") ;
				 String pContent = rs.getString("pContent") ;
				 String pCode = rs.getString("pCode") ;
				 String pPic = rs.getString("pPic") ;
				 Timestamp pDate = rs.getTimestamp("pDate") ;
				 int catId = rs.getInt("catId") ;
				 int userId = rs.getInt("userId"); 
				 
				 Post post = new Post(pid,pTitle,pContent,pCode,pPic,pDate,catId,userId) ;
				 list.add(post) ;
			 }
					 
			 
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		 
		 
		 return list ;
	}
	
	public List<Post> getPostByCatId(int catId){
		List<Post> list = new ArrayList<>() ;
		 // fetch all posts by id
		
		 
		 try {
			 
			 PreparedStatement pst = con.prepareStatement("select * from posts where catId=?") ;
			 
			 pst.setInt(1, catId);
			 ResultSet rs = pst.executeQuery() ;
			 
			 while(rs.next()) {
				 int pid = rs.getInt("pid") ;
				 String pTitle = rs.getString("pTitle") ;
				 String pContent = rs.getString("pContent") ;
				 String pCode = rs.getString("pCode") ;
				 String pPic = rs.getString("pPic") ;
				 Timestamp pDate = rs.getTimestamp("pDate") ;
				 int userId = rs.getInt("userId"); 
				 
				 Post post = new Post(pid,pTitle,pContent,pCode,pPic,pDate,catId,userId) ;
				 list.add(post) ;
			 }
					 
			 
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		 
		 
		 return list ;
	}


	public Post getPostByPostId(int postId) {
		Post p = null ;
		
		
		try {
			
			String q = "select * from posts where pid=?" ;
			
			PreparedStatement pst = con.prepareStatement(q) ;
			pst.setInt(1, postId);
			
			ResultSet rs = pst.executeQuery() ;
			
			if(rs.next()) {
				
				 int pid = rs.getInt("pid") ;
				 String pTitle = rs.getString("pTitle") ;
				 String pContent = rs.getString("pContent") ;
				 String pCode = rs.getString("pCode") ;
				 String pPic = rs.getString("pPic") ;
				 Timestamp pDate = rs.getTimestamp("pDate") ;
				 int userId = rs.getInt("userId"); 
				 int catId = rs.getInt("catId") ;
				 
				 p = new Post(pid,pTitle,pContent,pCode,pPic,pDate,catId,userId) ;
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return p ;
	}


}
