<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register Page</title>

<!-- css -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">


<link rel="stylesheet" href="css/mystyle.css" type="text/css" />

<style>
.banner-background {
clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 94%, 70% 100%, 23% 96%, 0 100%, 0 0);
		);
}


.form-control::placeholder { /* Chrome, Firefox, Opera, Safari 10.1+ */
            color: white;
            /* Firefox */
}

.form-control:focus{
border-color: #14A44D; 
            box-shadow: 0 0 4px #14A44D; 
            outline: none;
}

#gender{
accent-color: #14A44D;
}

#exampleCheck1{
accent-color: #14A44D;
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

</style>
</head>
<body class="black-color">


	<!--  navbar -->

	<%@include file="normal_navbar.jsp"%>



	<main class="primary-background p-5 banner-background">

		<div class="container">

			<div class="col-md-6 offset-md-3">

				<div class="card">

					<div class="card-header text-center primary-background text-white">
						<span class="fa fa-3x fa-user-circle"></span> <br>
						<p>Register Here</p>
					</div>


					<div class="card-body bg-dark text-light">

						<form id="reg-form" action="Registerservlet" method="POST">
						
						<div class="form-group">
								<label for="user_name">User Name</label> <input
									type="text" name="user_name" class="form-control bg-dark text-light" id="user_name"
									aria-describedby="emailHelp" placeholder="Enter name">
								
							</div>
						
						
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" name="user_email" class="form-control bg-dark text-light" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email">
								<small id="emailHelp" class="form-text ">We'll
									never share your email with anyone else.</small>
							</div>
							
							
							
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" name="user_password" class="form-control bg-dark text-light" id="exampleInputPassword1"
									placeholder="Password">
							</div>
							
							<div class="form-group">
								<label for="gender">Select Gender</label> 
									<br>
									<input type="radio"   id="gender" name="gender" value="male"> Male
									<input type="radio"  id="gender" name="gender" value="female"> Female
									
							</div>
							
							
							<div class="form-group">
								<textarea name="about" class="form-control bg-dark text-light"  rows="5" placeholder="Enter something about yourself" ></textarea>
							
							</div>
							
							
							
							<div class="form-check">
								<input type="checkbox" class="form-check-input" name="check"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1">Agree terms and conditions</label>
							</div>
							<br>
							
							<div class="container text-center text-light" id="loader" style="display: none;">
							 <span class="fa fa-refresh fa-4x fa-spin "></span>
							 <h4>please wait...</h4>
							</div>
							
							<button id="submit-btn" type="submit" class="btn btn-success  text-white">Register</button>
						</form>


					</div>


					
				</div>


			</div>

		</div>



	</main>
	
	
	
	
	
	
<!-- Footer -->
	<footer class="footer" style="margin-top: 200px;">
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
 
  <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

 
   <script>
   
   	$(document).ready(function(){
   		console.log("loaded...") ;
   		
   		$('#reg-form').on('submit', function(event){
   			
   			event.preventDefault() ;
   			
   			let form = new FormData(this);
   			
   			$("#submit-btn").hide() ;
   			$("#loader").show() ;
   			
   			
   			$.ajax({
   				url : "Registerservlet",
   				type : 'POST',
   				data : form ,
   				success : function(data,textStatus,jqXHR){
   					console.log(data) ;
   					$("#submit-btn").show() ;
   		   			$("#loader").hide() ;
   		   			
   		   			if(data.trim() === 'done'){
   		   			swal("Registered Successfully... Redirecting to Login Page")
   		   		   	.then((value) => {
   		   		   	  window.location="login.jsp" ;
   		   		   	});
   		   			}
   		   			else{
   		   				swal(data) ;
   		   			}
   		   		
   		   	
   		   		
   		   		
   				},
   				error : function(jqXHR,textStatus,errorThrown){
   					console.log(jqXHR) ;
   					$("#submit-btn").show() ;
   		   			$("#loader").hide() ;
   					swal("Please Check the Box !") ;
   		   		   
   					
   				},
   				processData : false ,
   				contentType : false
   				
   			});
   			
   		}); 
   		
   		
   	});
   
   </script>

</body>
</html>