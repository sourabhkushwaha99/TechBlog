package com.tech.blog.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;


import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;


@MultipartConfig
@WebServlet("/Editservlet")
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		fetch data 
		
		String userName = request.getParameter("user_name") ;
		String userEmail = request.getParameter("user_email") ;
		String userPassword = request.getParameter("user_password") ;
		String userAbout = request.getParameter("user_about") ;
		
		Part part = request.getPart("image") ;
		String imageName = part.getSubmittedFileName() ;
		
	
		
		
		HttpSession session = request.getSession() ;
		
		
	
		
		User user = (User) session.getAttribute("currentUser") ;
		
		user.setName(userName);
		user.setEmail(userEmail);
		user.setPassword(userPassword);
		user.setAbout(userAbout);
		String oldFile = user.getProfile() ;
		user.setProfile(imageName);
		
		
		
		//update database 
		
		UserDao dao = new UserDao(ConnectionProvider.getConnection()) ;
		
		boolean ans = dao.updateUser(user) ;
		
		
		
		if(ans == true) {
			
			
		//	String path =  request.getServletContext().getRealPath("/")+ "pics" + File.separator + user.getProfile() ;
			
			
			String path =  "/Users/sourabhkushwaha/eclipse-workspace/TechBlog/src/main/webapp/pics" + File.separator + user.getProfile() ;

			System.out.println(request.getServletContext().getRealPath("/"));
//			String oldFilePath =  request.getServletContext().getRealPath("/")+ "pics" +File.separator + oldFile ;
			
//			if(!oldFile.equals("default.png")){
//			Helper.deleteFile(oldFilePath) ;
//			}
			
			
		
			  boolean x = 	Helper.saveFile(part.getInputStream(), path) ;
			  
			  if(x) {
				  
				  Message msg = new Message("Profile Details Updated...","success","alert-success") ;
					
					session.setAttribute("msg", msg);
				  
		  }
					else {
				  
				  
				  Message msg = new Message("Something Went Wrong","error","alert-danger") ;
				
					session.setAttribute("msg", msg);
			  }
			
			
		}
		
		Message msg = new Message("Profile Details Updated...","success","alert-success") ;
		
		session.setAttribute("msg", msg);
		
	response.sendRedirect("profile.jsp") ;
  		
	}

}
