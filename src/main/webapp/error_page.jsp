<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@page isErrorPage="true" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sorry! something went wrong...</title>

<!-- css -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">


<link rel="stylesheet" href="css/mystyle.css" type="text/css" />

 <style>
 .banner-background{
clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 88%, 66% 100%, 31% 89%, 0 100%, 0 0);
 }
 

 </style>


</head>
<body>

<div class="container text-center">
 	<img src="img/computer.png" class="img-fluid" >
 	<h3 class="display-3">Sorry ! Something went wrong</h3>
 	
 	<%= exception %>
 	
 	<a href="index.jsp" class="btn primary-background text-white btn-lg mt-3" >Home</a>

</div>



</body>
</html>