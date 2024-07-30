<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="java.sql.*"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>



<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- css -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">


<link rel="stylesheet" href="css/mystyle.css" type="text/css" />

<style>
.banner-background {
	clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 88%, 66% 100%, 31% 89%, 0 100%, 0 0
		);
}
</style>

<style>
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

#jumbotron{
background-image: url("img/3d-render-low-poly-plexus-design-network-communications_1048-14542.avif");
 
}
</style>

</head>
<body class="black-color">

	<!--  navbar -->

	<%@include file="normal_navbar.jsp"%>


	<div class="container-fluid m-0 p-0 ">
		<div id="jumbotron" class="jumbotron black-color text-white banner-background">
			<div class="container">
				<h3 class="display-3">
					Welcome to <span class="text-success">TechBlog</span>
				</h3>

				<p>At TechBlog, we're passionate about exploring the
					ever-evolving world of technology. Whether you're a seasoned
					professional, an enthusiastic hobbyist, or just starting your tech
					journey, our goal is to provide you with insightful, informative,
					and engaging content that keeps you ahead of the curve.</p>
				<p>Dive into a diverse range of topics. Our expert contributors
					share their knowledge and experience to help you navigate the
					complexities of the tech landscape, offering practical tips,
					industry trends, and thought-provoking analyses.</p>
				<br>
				<button class="btn btn-success btn-lg">
					<span class="	fa fa-user"></span> Join Community
				</button>
				<!-- <a href="login.jsp" class="btn btn-outline-success btn-lg"><span class="fa fa-user-circle-o fa-spin"></span> Login</a> -->

			</div>

			<br> <br>

			<hr class="hr bg-light" />

		</div>

	</div>


	<!-- category navbar -->

 <br>
 <br>
 <br>
	<div class="container mb-5 text-center text-light">
	 <h2>Follow these steps</h2>
<hr class="hr bg-light" />


	</div>
	<br>





	<!-- ends category navbar -->



<!-- 
	<div class="container">




		post 1
		<div class="card my-5 bg-dark">
			<div class="card-header">
				<h2 class="text-white">
					<i class="fa fa-user"></i> &nbsp; &nbsp;Sourabh Kushwaha
				</h2>

			</div>

			<div class="row g-0">
				<div class="col-md-4">

					<img
						src="https://play-lh.googleusercontent.com/gSvS4Npz1pg8C4OFlZtxdPgbOwFgB5xyEh9VhCLCtvYvgqKAY-dPVTMyiDELjwCeQg"
						class="img-fluid rounded-start" alt="...">
				</div>
				<div class="col-md-8">
					<div class="card-body">
						<h2 class="card-title text-white">Java Tutorial</h2>
						<p class="card-text text-white ">Java is a programming
							language and a platform. Java is a high level, robust,
							object-oriented and secure programming language. Java was
							developed by Sun Microsystems (which is now the subsidiary of
							Oracle) in the year 1995. James Gosling is known as the father of
							Java. Before Java, its name was Oak. Since Oak was already a
							registered company, so James Gosling and his team changed the
							name from Oak to Java.</p>


						<a href="login.jsp" class="btn btn-outline-success btn-md">Read More <i
							class="fa fa-arrow-right"></i></a>

					</div>
				</div>
			</div>
		</div>




		post 2
		<div class="card my-5 bg-dark">
			<div class="card-header">
				<h2 class="text-white">
					<i class="fa fa-user"></i> &nbsp; &nbsp;Shubham
				</h2>

			</div>

			<div class="row g-0">
				<div class="col-md-4">

					<img
						src="https://cdn.hostadvice.com/2023/04/final-what-is-a-java-servlet-a-comprehensive-guide-hostadvice-0.jpeg"
						class="img-fluid rounded-start" alt="...">
				</div>
				<div class="col-md-8">
					<div class="card-body">
						<h2 class="card-title text-white">Servlets</h2>
						<p class="card-text text-white ">Today, we all are aware of
							the need to create dynamic web pages i.e. the ones that can
							change the site contents according to the time or can generate
							the content according to the request received from the client. If
							you like coding in Java, then you will be happy to know that
							using Java there also exists a way to generate dynamic web pages
							and that way is Java Servlet. But before we move forward with our
							topic let’s first understand the need for server-side extensions.
						</p>


						<a href="login.jsp" class="btn btn-outline-success btn-md">Read More <i
							class="fa fa-arrow-right"></i></a>

					</div>
				</div>
			</div>
		</div>



		post 3
		<div class="card my-5 bg-dark">
			<div class="card-header">
				<h2 class="text-white">
					<i class="fa fa-user"></i> &nbsp; &nbsp;Rohit Kumar
				</h2>

			</div>

			<div class="row g-0">
				<div class="col-md-4">

					<img
						src="https://ioflood.com/blog/wp-content/uploads/2023/09/Collage-of-Python-programming-aspects-syntax-libraries-Python-symbols-logo-300x300.jpg.webp"
						class="img-fluid rounded-start" alt="...">
				</div>
				<div class="col-md-8">
					<div class="card-body">
						<h2 class="card-title text-white">Learn Python Programming</h2>
						<p class="card-text text-white ">Python is a high-level,
							general-purpose, and very popular programming language. Python
							programming language (latest Python 3) is being used in web
							development, and Machine Learning applications, along with all
							cutting-edge technology in Software Industry. Python language is
							being used by almost all tech-giant companies like – Google,
							Amazon, Facebook, Instagram, Dropbox, Uber… etc.</p>


						<a href="login.jsp" class="btn btn-outline-success btn-md">Read More <i
							class="fa fa-arrow-right"></i></a>

					</div>
				</div>
			</div>
		</div>




		post 4
		<div class="card my-5 bg-dark">
			<div class="card-header">
				<h2 class="text-white">
					<i class="fa fa-user"></i> &nbsp; &nbsp;John Patt
				</h2>

			</div>

			<div class="row g-0">
				<div class="col-md-4">

					<img
						src="https://tecadmin.net/wp-content/uploads/2023/09/microservices.png"
						class="img-fluid rounded-start" alt="...">
				</div>
				<div class="col-md-8">
					<div class="card-body">
						<h2 class="card-title text-white">What is Micro Service?</h2>
						<p class="card-text text-white ">Micro Service is an
							architecture that allows the developers to develop and deploy
							services independently. Each service running has its own process
							and this achieves the lightweight model to support business
							applications.</p>


						<a href="login.jsp" class="btn btn-outline-success btn-md">Read More <i
							class="fa fa-arrow-right"></i></a>

					</div>
				</div>
			</div>
		</div>



		post 5
		<div class="card my-5 bg-dark">
			<div class="card-header">
				<h2 class="text-white">
					<i class="fa fa-user"></i> &nbsp; &nbsp;Sakshi Gupta
				</h2>

			</div>

			<div class="row g-0">
				<div class="col-md-4">

					<img
						src="https://res.cloudinary.com/springboard-images/image/upload/c_limit,q_auto,f_auto,dpr_auto,fl_lossy/v1696866554/website-redesign/lifestyle-photography/Data%20Learning%20Path%20Image.webp"
						class="img-fluid rounded-start" alt="...">
				</div>
				<div class="col-md-8">
					<div class="card-body">
						<h2 class="card-title text-white">What Is Data Analytics?</h2>
						<p class="card-text text-white ">Data analytics is the future
							of today’s digital world. You probably have heard this statement
							a lot but might not know the full extent of what it means. If you
							wish to switch your career to data analytics or want to
							understand the scope of this field, it’s the right time to do so.
							In fact, the U.S. Bureau of Labor Statistics predicts a
							significant boost in data science and analytics jobs as the
							industry is estimated to grow about 26% by 2026.</p>


						<a href="login.jsp" class="btn btn-outline-success btn-md">Read More <i
							class="fa fa-arrow-right"></i></a>

					</div>
				</div>
			</div>
		</div>




	</div>
 -->


		<!-- png icons -->
		
		
		<div class="container" >
		
		<div class="container">
		<a class="d-flex justify-content-center" href="register.jsp" >	<img src="img/signup (1).png" style="max-width:15%;" /> </a>
			
		</div>
		
		<br> 
		<br>
		<br>
		
		<div class="container d-flex justify-content-center ">
			<img src="img/down-arrow.png" style="max-width:15%;" /> 
			
		</div>
		
		<br>
		<br>
		<br>
		<div class="container ">
		<a class="d-flex justify-content-center" href="login.jsp" >	<img src="img/user-login (2).png" style="max-width:15%;" /> </a>
			
		</div>
		
		<br>
		<br>
		<br>
		<div class="container d-flex justify-content-center ">
			<img src="img/down-arrow.png" style="max-width:15%;"/> 
			
		</div>
		
		<br>
		<br>
		<br>
		<div class="container d-flex justify-content-center">
			<img src="img/post (1).png" style="max-width:15%;"/> 
			
		</div>
		
		
		
		</div>
		
		
		
		
		<!-- end png icons -->








	


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
	<!--  <script type="text/javascript" src="js/myjs.js"></script>
 -->



</body>
</html>