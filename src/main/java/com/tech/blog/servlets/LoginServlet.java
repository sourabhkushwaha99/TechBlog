package com.tech.blog.servlets;

import jakarta.servlet.ServletException;


import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import com.tech.blog.entities.Message; 
import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userEmail = request.getParameter("email") ;
		String userPassword = request.getParameter("password") ;
		
		UserDao dao = new UserDao(ConnectionProvider.getConnection()) ;
		
		User u = dao.getUserByEmailAndPassword(userEmail, userPassword) ;
		
		PrintWriter out = response.getWriter() ;
		
		if(u == null) {
			
			Message msg = new Message("Invalid Details ! Try Again","error","alert-danger") ;
			HttpSession session = request.getSession() ;
			session.setAttribute("msg", msg);
			
			
			response.sendRedirect("login.jsp");
			
		}else {
			
			HttpSession session = request.getSession() ;
			
			session.setAttribute("currentUser", u);
			
			response.sendRedirect("profile.jsp"); 
			
		}
		
	}

}
