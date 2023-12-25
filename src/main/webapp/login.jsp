<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<!-- SweetAlert CSS -->
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
<style type="text/css">
.back-img {
	background: url("assets/logo/bg2.jpg");
	background-repeat: no-repeat;
	height: 800px;
	background-position: center;
	background-size: cover;
}
</style>


<meta charset="ISO-8859-1">
<title>Login | E-Notes Application</title>



<!-- Favicon -->
<link rel="icon" type="image/x-icon" href="assets/logo/logo.png">

<!-- Bootstrap CSS and JS Links and FontAwsone CDN and CSS Links -->
<%@ include file="all_component/allcss.jsp"%>
</head>
<body>

	<!-- Common navbar.jsp  -->
	<%@ include file="all_component/navbar.jsp"%>
	<div class="container-fluid back-img">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-5">
					<div class="card-header text-center">
						<a class="navbar-brand text-primary" href="register.jsp"> <img
							src="assets/logo/logo.png" width="30" height="30"
							class="d-inline-block align-top" alt=""> E-Notes <br>
							New Member..Create Account
						</a>
					</div>
					<input type="hidden" id="status"
						value="<%=request.getAttribute("status")%>">

					<%
					String regErrorMsg = (String) session.getAttribute("login-failed");
					if (regErrorMsg != null) {
					%>
					<div class="alert alert-danger" role="alert">
						<%=regErrorMsg%>
					</div>
					<%
					session.removeAttribute("login-failed");
					}
					%>
					
					<%
					String logErrorMsg = (String) session.getAttribute("login-error");
					if (logErrorMsg != null) {
					%>
					<div class="alert alert-danger" role="alert">
						<%=logErrorMsg%>
					</div>
					<%
					session.removeAttribute("login-error");
					}
					%>
					
					
					
					<%
					String logoutMsg = (String) session.getAttribute("logoutMsg");
					if (logoutMsg != null) {
					%>
					<div class="alert alert-success" role="alert">
						<%=logoutMsg%>
					</div>
					<%
					session.removeAttribute("logoutMsg");
					}
					%>
					
					<div class="card-body">

						<form action="LoginServlet" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" name="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Enter email">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" name="password" class="form-control"
									id="exampleInputPassword1" placeholder="Enter Password">
							</div>
							<button type="submit"
								class="btn btn-primary badge-pill btn-block">
								<i class="fa fa-user m-1" aria-hidden="true"></i>Login
							</button>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>


	<%@ include file="all_component/footer.jsp"%>
	
	
	

	<!-- SweetAlert JS -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

	<script type="text/javascript">
		var status = document.getElementById("status").value;
		if (status == "mailmsg") {
			swal("Error","Please Enter your Registered Mail Id", "error");
		}
		if (status == "passmsg") {
			swal("Error","Please Enter your Password", "error");
		}
	</script>

</body>
</html>