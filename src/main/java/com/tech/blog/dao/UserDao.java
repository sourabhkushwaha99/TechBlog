package com.tech.blog.dao;

import java.sql.* ;

import com.tech.blog.entities.User;

public class UserDao {
	
	private Connection con ;
	
	public UserDao(Connection con) {
		this.con = con ;
	}
	
	
	// method to insert user in database 
	
	public boolean saveUser(User user) {
		
		boolean f = false ;
		
		try {
			String query = "insert into user(name,email,password,gender,about) values(?,?,?,?,?)" ;
			
			
			PreparedStatement pst = con.prepareStatement(query) ;
			
			pst.setString(1, user.getName());
			pst.setString(2, user.getEmail());
			pst.setString(3, user.getPassword());
			pst.setString(4, user.getGender());
			pst.setString(5, user.getAbout());
			
			pst.executeUpdate() ;
			
			f = true ;
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return f ;
		
	}
	
	
	// get user by email and password 
	
	public User getUserByEmailAndPassword(String email, String password) {
		User user = null ;
		
		
		try {
			
			String query = "select * from user where email=? and password=?" ;
			
			PreparedStatement pst = con.prepareStatement(query) ;
			
			pst.setString(1, email);
			pst.setString(2, password);
			
		 ResultSet rs = pst.executeQuery() ;
		 
		 if(rs.next()) {
			 
			 user = new User() ;
			 
			 String name = rs.getString("name") ;
			 user.setName(name);
			 
			 user.setId(rs.getInt("id"));
			 
			 user.setEmail(rs.getString("email"));
			 
			 user.setPassword(rs.getString("password"));
			 
			 user.setAbout(rs.getString("about"));
			 
			 user.setGender(rs.getString("gender"));
			 
			 user.setDateTime(rs.getTimestamp("rdate"));
			 
			 user.setProfile(rs.getString("profile")) ;
			 
		 }else {
			 
		 }
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return user ;
	}
	
	
	public boolean updateUser(User user) {
		
		boolean f = false; 
		
		try {
			
			String query = "update user set name=?, email=?, password=?, about=?, profile=? where id=?" ;
			
			PreparedStatement pst = con.prepareStatement(query) ;
			
			pst.setString(1, user.getName());
			
			pst.setString(2, user.getEmail());
			
			pst.setString(3, user.getPassword());
			
			pst.setString(4, user.getAbout());
			
			pst.setString(5, user.getProfile());
			
			pst.setInt(6, user.getId());
			
			pst.executeUpdate() ;
			
			f = true ;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f; 
		
	}

	
	public User getUserByUserId(int postId) {
		
		User user = null ;
		
		try {
			
			String q = "select * from user where id=?" ;
			
			PreparedStatement pst = this.con.prepareStatement(q) ;
			
			pst.setInt(1, postId);
			
			ResultSet rs = pst.executeQuery() ;
			
			if(rs.next()) {
				
				user = new User() ;
				 
				 String name = rs.getString("name") ;
				 user.setName(name);
				 
				 user.setId(rs.getInt("id"));
				 
				 user.setEmail(rs.getString("email"));
				 
				 user.setPassword(rs.getString("password"));
				 
				 user.setAbout(rs.getString("about"));
				 
				 user.setGender(rs.getString("gender"));
				 
				 user.setDateTime(rs.getTimestamp("rdate"));
				 
				 user.setProfile(rs.getString("profile")) ;
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return user ;
	}
}
