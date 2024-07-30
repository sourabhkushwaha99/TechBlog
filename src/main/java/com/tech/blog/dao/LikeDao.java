package com.tech.blog.dao;
import java.sql.* ;

public class LikeDao {
	
	Connection con ;
	
	public LikeDao(Connection con) {
		super();
		this.con = con;
	}

	public boolean insertLike(int pid,int uid) {
		
		boolean f = false ;
		
		try {
			
			String q = "insert into likeButton(pid,uid) values(?,?)" ;
			
			PreparedStatement pst = this.con.prepareStatement(q) ;
			
			pst.setInt(1, pid);
			pst.setInt(2, uid);
			
			pst.executeUpdate() ;
			
			f = true ;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f ;
	}
	
	public int countLikeOnPost(int pid) {
		
		int count = 0 ;
		
		try { 
			
			String q= "select count(*) from likeButton where pid=?" ;
			
			PreparedStatement pst = con.prepareStatement(q) ;
			
			pst.setInt(1, pid); 
			
			ResultSet rs = pst.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt("count(*)") ;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		return count ;
		
	}

	
	public boolean isLikedByUser(int pid, int uid) {
		boolean f = false ;
		
		try {
			
			PreparedStatement pst = con.prepareStatement("select * from likeButton where pid=? and uid= ? ") ;
			
			pst.setInt(1, pid);
			pst.setInt(2, uid);
			
			ResultSet rs = pst.executeQuery() ;
			
			if(rs.next()) f = true ;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return f ;
	}


	public boolean deleteLike(int pid, int uid) {
		boolean f = false ;
		
		try {
			
			PreparedStatement pst = con.prepareStatement("delete  from likeButton where pid=? and uid= ? ") ;
			
			pst.setInt(1, pid);
			pst.setInt(2, uid);
			
			
			pst.executeUpdate() ;
			 f = true ;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return f ;
	}


}
