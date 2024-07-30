
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page import="java.util.*"%>
  <%@page import="java.text.DateFormat" %>

 <script type="text/javascript" src="js/myjs.js"></script> 
 
 
<%-- 
<div class="row">

<% 
	User user = (User)session.getAttribute("currentUser") ;

	Thread.sleep(500) ;

	PostDao d = new PostDao(ConnectionProvider.getConnection()) ;

int cid = Integer.parseInt(request.getParameter("cid")) ;
	List<Post> posts = d.getAllPosts() ;
	
 	if(cid==0){

	 posts = d.getAllPosts() ;
	
	}
	else{
		posts = d.getPostByCatId(cid) ;
	}
	 
 	
 	if(posts.size()==0){
 		out.println("<h3 class='display-3 text-center text-light' >No Posts in this Category...</h3>") ;
 		return ; // this will stop the execution of below code and return from here itself 
 	}
	
	
	for(Post p : posts)
	
	{
		%>
		<div class="col-md-6 mt-3">
		<div class="card">
								
								<!-- 	not working for now -->
		<img class="card-img-top" src="blog_pics/<%= p.getpPic()== null ? p.getpPic() : "blog.jpg"  %>" alt="post image" >
			<div class="card-body">
			
			<b><%= p.getpTitle() %></b>
			<p><%= p.getpContent() %></p>
			<pre><%= p.getpCode() %></pre>
		
			</div>
			
			<div class="card-footer text-center primary-background  d-flex justify-content-around" >
			
			<% LikeDao ld = new LikeDao(ConnectionProvider.getConnection()) ; %>
			
			<a href="#!"  class="btn  btn-sm btn-outline-light" ><i class="fa fa-thumbs-o-up" ></i><span> <%= ld.countLikeOnPost(p.getPid()) %></span></a>
			<a href="#!" class="btn  btn-sm btn-outline-light" ><i class="fa fa-commenting-o" ></i><span>&nbsp;5</span></a>
			<a href="show_blog_page.jsp?post_id=<%= p.getPid() %>" class="btn  btn-outline-light btn-sm " >Read More...</a>
			</div>
		
		</div>
		
		</div>
		
		
		
		<%
		
	}

%>

</div>
 --%>
 
 			
			<% 
	User user = (User)session.getAttribute("currentUser") ;

	

	PostDao d = new PostDao(ConnectionProvider.getConnection()) ;

		int cid = Integer.parseInt(request.getParameter("cid")) ;
	List<Post> posts = d.getAllPosts() ;
	
 	if(cid==0){

	 posts = d.getAllPosts() ;
	
	}
	else{
		posts = d.getPostByCatId(cid) ;
	}
	 
 	
 	if(posts.size()==0){
 		out.println("<h3 class='display-3 text-center text-light' >No Posts in this Category...</h3>") ;
 		return ; // this will stop the execution of below code and return from here itself 
 	}
 	
 	
 			UserDao udao = new UserDao(ConnectionProvider.getConnection()) ;
	
	for(Post p : posts)
		
		
		
	
	{
		%>

			
	
        
        
        	<br>
        	<br>
        	<br>
        	<hr class="my-4 bg-light" style="width:70%;margin:auto;">
        	<br>
        	<br>
        	<br>
		   <div class="card my-4" style="width: 70%;margin:auto;background:#e9ecef;">
		   <div class="card-header bg-dark d-flex justify-content-between" >
		   <div  >
		  	<h5 class="text-success  ">
		  	
                <i class="fa fa-user"></i>&nbsp;&nbsp;<%= udao.getUserByUserId(p.getUserId()).getName()%>
                
            </h5>
             
            </div>
            
            
             <i class="blockquote-footer text-sm"> Posted On: <%= DateFormat.getDateInstance().format(p.getpDate()) %></i>
		  </div>
		  
		   
		
		  
		  <div class="card-body" style="min-height:500px;">
		  
		  
		  <% 
		  
		  if(p.getCatId()==1)
		  {
			  %> 
			  <img class="card-img-top" src="blog_pics/java.png" alt="Post Image" style="max-height:512px;">
			  <%
			  
		  }
		  else if(p.getCatId()==2)
		  {
			  %> 
			  <img class="card-img-top" src="blog_pics/c-.png" alt="Post Image" style="max-height:512px;">
			  <%
			  
		  }
		  else if(p.getCatId()==3)
		  {
			  %> 
			  <img class="card-img-top" src="blog_pics/jsp-file-format.png" alt="Post Image" style="max-height:512px;">
			  <%
			  
		  }
		  else if(p.getCatId()==4)
		  {
			  
			  %> 
			  <img class="card-img-top" src="blog_pics/py.png" alt="Post Image" style="max-height:512px;">
			  <%
			  
		  }
		  else if(p.getCatId()==6)
		  {
			  %> 
			  <img class="card-img-top" src="blog_pics/server.png" alt="Post Image" style="max-height:512px;">
			  <%
		  }
		  else if(p.getCatId()==7)
		  {
			  %> 
			  <img class="card-img-top" src="blog_pics/data-collection.png" alt="Post Image" style="max-height:512px;">
			  <%
			  
		  }
		  else if(p.getCatId()==8)
		  {
			  %> 
			  <img class="card-img-top" src="blog_pics/images.png" alt="Post Image" style="max-height:512px;">
			  <%
		  }
		  else if(p.getCatId()==9){
			  
			  %> 
			  <img class="card-img-top" src="blog_pics/springboot.png" alt="Post Image" style="max-height:512px;">
			  <%
			  
		  }
		  %>
		    
		    
		    
		    
		  
		    <h3 class="card-title my-4"><%= p.getpTitle() %></h3>
		    <p class="card-text text-truncate"><%= p.getpContent() %></p>
		   
		  </div>
		  
		  <div class="card-footer d-flex justify-content-around">
		   <% LikeDao ld = new LikeDao(ConnectionProvider.getConnection()) ; %>
		  
		  
		  	 <a  onclick="doLike(<%= p.getPid() %>,<%= user.getId() %>)" class="  btn <%= ld.isLikedByUser(p.getPid(), user.getId()) ? "btn-primary" : "btn-outline-primary" %>" id="like-button-<%= user.getId() %>" ><i class="fa fa-thumbs-o-up" ></i><span id="like-counter-<%= p.getPid() %>" class="like-counter">&nbsp;<%= ld.countLikeOnPost(p.getPid()) %></span></a>
		  	
		  	
		  	
		  	<a href="show_blog_page.jsp?post_id=<%= p.getPid() %>" class="btn  btn-success btn " >Read More <i class="fa fa-arrow-right"></i></a>
		  </div>
		  
		</div>
        
        
    <%
    }
    %>
