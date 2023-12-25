<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%
UserDetails userDet = (UserDetails) session.getAttribute("userDetails");

if (userDet == null) {
	response.sendRedirect("login.jsp");
	session.setAttribute("login-error", "Please login before adding notes...");
}
%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.back-img {
	background: url("assets/logo/bg3.jpg");
	background-repeat: no-repeat;
	height: 800px;
	background-position: center;
	background-size: cover;
}
</style>
<meta charset="ISO-8859-1">
<title>UserPage | E-Notes Application</title>

<!-- Favicon -->
<link rel="icon" type="image/x-icon" href="assets/logo/logo.png">

<!-- Bootstrap CSS and JS Links and FontAwsone CDN and CSS Links -->
<%@ include file="all_component/allcss.jsp"%>
</head>
<body>
	<!-- Common navbar.jsp  -->
	<%@ include file="all_component/navbar.jsp"%>

	<div class="container-fluid back-img">
		<!--
		<div class="sub-container text-left">
		<h3 class="text-danger">Start your Notes here...</h3>
		<a href="addNotes.jsp" class="btn btn-outline-danger">Add Notes</a>
		</div>
		 -->
	</div>



	<%@ include file="all_component/footer.jsp"%>


</body>
</html>