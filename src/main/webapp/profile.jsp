<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.entities.Message"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="java.util.*"%>
<%@page errorPage="error_page.jsp"%>
 <%@page import="java.text.DateFormat" %>

<%
User user = (User) session.getAttribute("currentUser");

if (user == null)
	response.sendRedirect("login.jsp");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Profile</title>

<!-- css -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">


<link rel="stylesheet" href="css/mystyle.css" type="text/css" />

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<style>
.banner-background {
	clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 88%, 66% 100%, 31% 89%, 0 100%, 0 0
		);
}

.form-control:focus {
	border-color: #14A44D;
	box-shadow: 0 0 4px #14A44D;
	outline: none;
}

.footer {
	background-color: #343a40; /* Dark color */
	color: #ffffff; /* White text */
	padding: 40px 0;
}

.footer a {
	color: #28a745; /* Success color */
}

.footer a:hover {
	color: #218838; /* Slightly darker success color for hover effect */
}

#tech-blog {
	color: #6bdd89;
}
</style>

</head>
<body class="black-color">

	<!-- 			navbar   -->



	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand text-success " href="profile.jsp"><span
			class="fa fa-desktop"></span> Tech Blog</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="profile.jsp"> <span class="	fa fa-home"></span> Home <span class="sr-only">(current)</span></a></li>



				<li class="nav-item active"><a class="nav-link" href="#"
					data-toggle="modal" data-target="#do-post-modal"><span
						class="fa fa-plus"></span> New Post</a></li>



			</ul>

			<ul class="navbar-nav mr-right">

				<li class="nav-item active"><a class="nav-link" href="#!"
					data-toggle="modal" data-target="#profile-modal"><span
						class="fa fa-user-circle"></span> <%=user.getName()%> </a></li>

				<li class="nav-item active"><a class="nav-link"
					href="Logoutservlet"><span class="fa fa-sign-out"></span>
						Logout</a></li>

			</ul>

		</div>
	</nav>



	<!-- navbar ends -->


	<%
	Message m = (Message) session.getAttribute("msg");

	if (m != null) {
	%>

	<div id="alert" class="alert <%=m.getCssClass()%> text-center"
		role="alert">
		<%=m.getContent()%>
	</div>

	<%
	session.removeAttribute("msg");
	}
	%>



		<!-- header page  -->

	<div class="container-fluid">

		<div class="jumbotron ">
		
  
  <% 		
 				if(user.getGender().equals("male")) {
 					%>  
 					
 					<img  src="pics/man.png" alt="Profile Image"
							style="border-radius: 50%; max-width: 100px; display: block;
  margin-left: auto;
  margin-right: auto;"> 
 					
 					<% 
 				}
 				
 				else{
 					%>
 					<img  src="pics/human.png" alt="Profile Image"
							style="border-radius: 50%; max-width: 100px; display: block;
  margin-left: auto;
  margin-right: auto;"> 
 					
 					<% 
 					
 				}
 				
 				%>
  
  
  
			<br>
			<h1 class="display-5 text-center mt-2 text-success"><%=user.getName()%></h1>
			<p class="lead text-center"><%=user.getAbout()%></p>
			<hr class="my-4 bg-success">
			<div class="container  d-flex justify-content-around">
			<footer class="blockquote-footer"> Joined On : <%=   DateFormat.getDateInstance().format(user.getDateTime())%></footer>
			<span class=" text-secondary" >(User Id:  <%= user.getId() %> )</span>
		</div>
		</div>

	</div>

		<!-- end header page -->



			
			<!-- category navbar  -->
			
			<br>
			<br>
			<div class="container">
			
						<ul class="nav nav-tabs " style="margin:auto;">
			  <li class="nav-item mr-2">
			    <a onclick="getPosts(0,this)" class="text-success c-link  nav-link active" href="#">All Posts</a>
			  </li>
			  
			  <%
						PostDao d = new PostDao(ConnectionProvider.getConnection());
						ArrayList<Category> list1 = d.getAllCategories();

						for (Category cc : list1) {
						%>
			  
			  <li class="nav-item mx-4">
			    <a onclick="getPosts(<%=cc.getCid()%>,this)" class="c-link text-success nav-link" href="#"><%=cc.getName()%></a>
			  </li>
			  
			  <%
						}
						%>
			 
			</ul>
			
			
			</div>
			
			
			
			
			<!-- end category navbar -->
			
			
			
			
			<!-- post section -->
			
			
			<br>
			<br>
			<div class="container">
			
			
			<div class="container text-light text-center" id="loader">
						<i class="fa fa-refresh fa-4x fa-spin"> </i>
						<h3 class="mt-2">Loading...</h3>
					</div>
					
					
					
			<div class="container " id="post-container"></div>
			
			
			
			
			
			
			</div>
			
			
			
			
			<!-- end post section -->





	<!-- main body of the page -->


	<main>
		<!-- <div class="container">
			<div class="row mt-5">
 -->
				<!-- first col -->
				<%-- <div class="col-md-4">
					<!-- categories -->

					<div class="list-group">
						<a href="#" onclick="getPosts(0,this)"
							class=" c-link list-group-item list-group-item-action active primary-background">
							All Posts </a>
						<%
						PostDao d = new PostDao(ConnectionProvider.getConnection());
						ArrayList<Category> list1 = d.getAllCategories();

						for (Category cc : list1) {
						%>

						<a href="#" onclick="getPosts(<%=cc.getCid()%>,this)"
							class="c-link list-group-item list-group-item-action"><%=cc.getName()%></a>

						<%
						}
						%>



					</div>

				</div> --%>

				<!-- second col -->
			<!-- 	<div class="col-md-8">
					posts

					<div class="container text-center" id="loader">
						<i class="fa fa-refresh fa-4x fa-spin"> </i>
						<h3 class="mt-2">Loading...</h3>
					</div>

					<div class="container-fluid" id="post-container"></div>

				</div>

			</div>

		</div> -->


	</main>




	<!-- end of main body of the page -->



	<!-- profile modal -->




	<!-- Modal -->
	<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header bg-dark text-white">
					<h5 class="modal-title text-success" id="exampleModalLabel">TechBlog</h5>
					<button type="button" class="close text-danger"
						data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" style="background: #cefad0;">

					<div class="container text-center">

	
 				<% 
 				
 				if(user.getGender().equals("male")) {
 					%>  
 					
 					<img  src="pics/man.png" alt="Profile Image"
							style="border-radius: 50%; max-width: 100px;margin:auto;"> 
 					
 					<% 
 				}
 				
 				else{
 					%>
 					<img  src="pics/human.png" alt="Profile Image"
							style="border-radius: 50%; max-width: 100px;margin:auto;"> 
 					
 					<% 
 					
 				}
 				
 				%>


						 
							
				


	
						<h5 class="modal-title" id="exampleModalLabel">
							<%=user.getName()%>
						</h5>
						<br>


						<!-- details -->

						<div id="profile-details">

							<table class="table table-sm" style="border: black;">

								<tbody>
									<tr class="table-success">
										<th scope="row">ID :</th>
										<td><%=user.getId()%></td>

									</tr>
									<tr class="table-success">
										<th scope="row">Email :</th>
										<td><%=user.getEmail()%></td>

									</tr>
									<tr class="table-success">
										<th scope="row">Gender :</th>
										<td><%=user.getGender()%></td>

									</tr>

									<tr class="table-success">
										<th scope="row">Status :</th>
										<td><%=user.getAbout()%></td>

									</tr>

									<tr class="table-success">
										<th scope="row">Registered On :</th>
										<td><%=user.getDateTime().toString()%></td>

									</tr>
								</tbody>
							</table>

						</div>


						<!-- profile edit -->


						<div id="profile-edit" style="display: none;">

							<h3 class="mt-2 text-danger">Please Edit Carefully</h3>

							<form action="Editservlet" method="POST"
								enctype="multipart/form-data">

								<table class="table">

									<tr class="table-success">

										<th>ID :</th>
										<td><%=user.getId()%></td>

									</tr>


									<tr class="table-success">

										<th>Name :</th>
										<td><input type="text" name="user_name"
											class="form-control" value="<%=user.getName()%>"></td>

									</tr>




									<tr class="table-success">

										<th>Email :</th>
										<td><input type="email" name="user_email"
											class="form-control" value="<%=user.getEmail()%>"></td>

									</tr>

									<tr class="table-success">
										<th>Password :</th>
										<td><input type="password" name="user_password"
											class="form-control" value="<%=user.getPassword()%>"></td>

									</tr>


									<tr class="table-success">

										<th>Gender :</th>
										<td><%=user.getGender().toUpperCase()%></td>

									</tr>


									<tr class="table-success">

										<th>Status :</th>
										<td><textarea rows="3" class="form-control"
												name="user_about">
						 	<%=user.getAbout()%>
						 	</textarea></td>

									</tr>


									<!-- <tr class="table-success">

										<th>New Profile Pic :</th>
										<td><input type="file" name="image"></td>

									</tr>
 -->
								</table>

								<div class="container">
									<button type="submit" class="btn btn-success text-white">
										Save</button>
								</div>

							</form>

						</div>



					</div>

				</div>
				<div class="modal-footer bg-dark">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button id="edit-profile-button" type="button"
						class="btn btn-success">Edit</button>
				</div>
			</div>
		</div>
	</div>




	<!-- end of profile modal -->




	<!-- Post Modal -->


	<!-- Button trigger modal -->


	<!-- Modal -->
	<div class="modal fade" id="do-post-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header bg-dark text-white">
					<h5 class="modal-title" id="exampleModalLabel">Provide the
						post details...</h5>
					<button type="button" class="close text-danger"
						data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">



					<form id="add-post-form" action="Addpostservlet" method="POST">

						<div class="form-group">
							<select class="form-control" name="cid">
								<option selected disabled>---Select Category---</option>

								<%
								PostDao postd = new PostDao(ConnectionProvider.getConnection());

								ArrayList<Category> list = postd.getAllCategories();

								for (Category c : list) {
								%>

								<option value="<%=c.getCid()%>"><%=c.getName()%></option>


								<%
								}
								%>

							</select>
						</div>

						<div class="form-group">
							<input type="text" name="pTitle" class="form-control"
								placeholder="Enter Post Title">
						</div>

						<div class="form-group">
							<textarea rows="4" name="pContent" class="form-control"
								placeholder="Enter Your Content"></textarea>
						</div>

						<div class="form-group">
							<textarea rows="4" name="pCode" class="form-control"
								placeholder="Enter Your Program (if any)"></textarea>
						</div>

						<!-- <div class="form-group">
							<label>Select Your Pic...</label> <br> <input type="file"
								name="pic">
						</div> -->

						<div class="container text-center">
							<button class="btn btn-success text-white" type="submit">Post</button>
						</div>

					</form>


				</div>

			</div>
		</div>
	</div>





	<!-- End Post Modal -->



	<!-- Footer -->
	<footer class="footer" style="margin-top: 500px;">
		<div class="container">
			<div class="row">
				<div class="col-md-4">
					<h5>About Sourabh Kushwaha</h5>
					<p>Sourabh Kushwaha is the creator of TechBlog, a platform
						dedicated to sharing the latest in technology and innovation.</p>
				</div>
				<div class="col-md-4">
					<h5>Coding Links</h5>
					<ul class="list-unstyled">
						<li><a target="_blank"
							href="https://leetcode.com/u/sourabhkush99/">Leetcode</a></li>
						<li><a target="_blank"
							href="https://www.geeksforgeeks.org/user/sourabhkush99/">Geeks
								For Geeks</a></li>
						<li><a target="_blank"
							href="https://www.hackerrank.com/profile/sourabhkush99">HackerRank</a></li>
						<li><a target="_blank"
							href="https://www.codechef.com/users/sourabh0306">CodeChef</a></li>
					</ul>
				</div>
				<div class="col-md-4">
					<h5>Contact</h5>

					<ul class="list-unstyled">
						<li><a href="mailto:sourabhkush99@gmail.com">sourabhkush99@gmail.com</a></li>
						<li><a href="tel:+917701989984">+91-7701989984</a></li>
					</ul>
					<p>Follow me on:</p>
					<a href="www.linkedin.com/in/sourabh-kushwaha-633387201"
						target="_blank" style="color: #0077B5;"><i
						class="fa fa-linkedin fa-lg mx-2 "></i></a> <a
						href="https://github.com/sourabhkushwaha99" target="_blank"><i
						class="fa fa-github fa-lg mx-2 text-light"></i></a> <a
						href="https://www.instagram.com/kushwahasourabh/" target="_blank"
						style="color: #C13584;"><i class="fa fa-instagram fa-lg mx-2"></i></a>

				</div>
			</div>
			<div class="row">
				<div class="col-12 text-center">
					<p>&copy; 2024 TechBlog. All Rights Reserved.</p>
				</div>
			</div>
		</div>
	</footer>

	<!-- Footer ends -->






	<!-- javaScript -->
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"
		integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
		integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"
		integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+"
		crossorigin="anonymous"></script>
	<script type="text/javascript" src="js/myjs.js"></script>




	<script>
        $(document).ready(function(){
        	let editStatus = false ;
        	
            $("#edit-profile-button").click(function(){
                
            	
            	if(editStatus == false){
            		$("#profile-details").hide();
                    $("#profile-edit").show();
                    
                    editStatus = true ;
                    $(this).text("Back") ;
            	}
            	else{
            		$("#profile-details").show();
                    $("#profile-edit").hide();
                    
                    editStatus = false ;
            		$(this).text("Edit") ;
            	}
            	
               
            });
        });
        
        
        
        
        // Wait for the DOM to fully load
        document.addEventListener("DOMContentLoaded", function() {
            // Find the alert element
            var alertElement = document.getElementById("alert");
            if (alertElement) {
                // Set a timeout to remove the alert after 3 seconds (3000 milliseconds)
                setTimeout(function() {
                    alertElement.style.display = 'none';
                }, 2000);
            }
        });
    </script>


	<!-- add post javascript -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"
		integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>

	<script>
      		// this code run on page loading...
      		$(document).ready(function(){
      			
      			
      			
      			$("#add-post-form").on("submit", function(event){
      				// this code run on form submission
      				
      				//console.log("clicked on post")
      				event.preventDefault() ;// this will stop the normal behaviour of form i.e. synchronous behaviour
      				
      				let form = new FormData(this) ;
      				
      				// now requesting to server 
      		 	$.ajax({
      				url : "Addpostservlet",
      				type : "POST",
      				data : form,
      				success : function(data, textStatus, jqXHR){
      					// success...
      					//console.log(data) ;
						if(data.trim() == 'done'){
	      					swal("Good job!", "Saved Successfully", "success");
						}else{
	      					swal("Error!!", "Something went wrong try again...", "error");
						}
      				},
      				error : function(jqXHR, textStatus, errorThrown){
      					swal("Error!!", "Something went wrong try again...", "error");
      				},
      				processData : false ,
      				contentType : false
      					
      				}) 
      				
      				
      			});
      			
      			
      		}) ;
      		
      		
      		
      		</script>




	<!-- loading post using ajax  -->

	<script>
 			 	
 			
 				
 			      function getPosts(catId,temp) {
 		               $("#loader").show() ;
 		               $("#post-container").hide() ;
						$(".c-link").removeClass('active') ;
						$(".c-link").removeClass('primary-background') ;

 		                $.ajax({
 		                    url: "load_posts.jsp",
 		                    data: {cid: catId},
 		                    success: function (data, textStatus, jqXHR) {
 		                        console.log(data);
 		                        $("#loader").hide();
 		                        $("#post-container").show();
 		                        $('#post-container').html(data)
 		                       $(temp).addClass('active');
 		                       $(temp).addClass('primary-background');

 		                    }
 		                })

 		            }

 					
 				
 				

 	            $(document).ready(function (e) {
					
 	            	let allPostsRef = $(".c-link")[0] ;
 	            	getPosts(0,allPostsRef )


 	            })
 					
 				
 				</script>


</body>
</html>