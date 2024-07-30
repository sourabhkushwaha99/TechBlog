package com.tech.blog.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

@MultipartConfig
@WebServlet("/Registerservlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		 

		 response.setContentType("text/html");

         PrintWriter out = response.getWriter();
         
         
      
         
        // fetch form data 
         
         
         String check = request.getParameter("check") ;
         
         if(check == null) {
        	 out.println("Please Check the Box") ;
         }
         else {
        	 String name = request.getParameter("user_name");
        	 String email = request.getParameter("user_email") ;
        	 
        	 String password = request.getParameter("user_password") ;
        	 
        	 String gender = request.getParameter("gender");
        	 String about  = request.getParameter("about");
        	 
        	 // create user object..
        	 
        	 User user = new User(name,email,password,gender,about) ;
        	 
        	 
        	 
        	 
        	 // create UserDao object..
        	 
        	 UserDao dao = new UserDao(ConnectionProvider.getConnection()) ;
        	 
        	 
        	 
        	 if( dao.saveUser(user)) {
        		 out.println("done") ;
//        		 response.sendRedirect("index.jsp") ;
        	 }
        	 
        	 else {
        		 out.println("error") ;
        	 }
        	 
         }
         
         
         
        
		
		
		
		
		
	
		
	}

}
