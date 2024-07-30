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
import java.io.PrintWriter;

import com.tech.blog.dao.PostDao;
import com.tech.blog.entities.Post;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;


@MultipartConfig
@WebServlet("/Addpostservlet")
public class AddPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		int cid = Integer.parseInt(request.getParameter("cid")) ;
		String pTitle = request.getParameter("pTitle") ;
		String pContent = request.getParameter("pContent") ;
		String pCode = request.getParameter("pCode") ;
		Part part = request.getPart("pic") ;
		
		// getting user id 
		HttpSession session = request.getSession()  ;
		PrintWriter out = response.getWriter() ;
		
		
		User user = (User) session.getAttribute("currentUser") ;
		
		int userId = user.getId() ;
		
		
		Post post = new Post(pTitle,pContent,pCode,part.getSubmittedFileName(),cid,userId) ;
		
		PostDao pdao = new PostDao(ConnectionProvider.getConnection()) ;
		
		if(pdao.savePost(post)) {
			
			// not working for now...
			String path =  request.getServletContext().getRealPath("/")+ "blog_pics" +File.separator + part.getSubmittedFileName() ;
			Helper.saveFile(part.getInputStream(), path) ;
			
			out.println("done") ;
		
		}
		else {
			out.println("error"); 
		}
 		
		
	}

}
