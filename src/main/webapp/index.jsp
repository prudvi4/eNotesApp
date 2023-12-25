
<%@page import="java.sql.Connection"%>
<%@page import="com.enotes.dbconnection.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.back-img {
	background: url("assets/logo/bg1.jpg");
	background-repeat: no-repeat;
	height: 800px;
	background-position: center;
	background-size: cover;
}

.sub-container a{
	color: #A8201A;
	font-family: 'Roboto', sans-serif;
}
.sub-container p{
	color: #A8201A;
	margin-top:10px;
	font-family: 'Roboto', sans-serif;
}
</style>

<meta charset="ISO-8859-1">
<title>Home Page | E-Notes Application</title>

<!-- Favicon -->
<link rel="icon" type="image/x-icon" href="assets/logo/logo.png">

<!-- Bootstrap CSS and JS Links and FontAwsone CDN and CSS Links -->
<%@ include file="all_component/allcss.jsp"%>



</head>
<body>



	<!-- Common navbar.jsp  -->
	<%@ include file="all_component/navbar.jsp"%>


	<div class="container-fluid back-img">
		<div class="sub-container text-right">
			<a class="navbar-brand mt-3 custom-head" href="index.jsp"> <img
				src="assets/logo/logo.png" width="30" height="30"
				class="d-inline-block align-top" alt=""> E-Notes Application
			</a>
			
			<p>An E-Notes Application using JAVA+JSP+JDBC+MYSQL+SERVLETS.</p>
			<p>Where you can add notes and edit notes.</p>
			<p>Please create an account and login to do these things.</p>
			<p>Thank You..!!</p>
			
			
			

		</div>
	</div>

	<%@ include file="all_component/footer.jsp"%>



</body>
</html>