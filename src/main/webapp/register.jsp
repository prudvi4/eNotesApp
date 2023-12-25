<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<style type="text/css">
.back-img {
	background: url("assets/logo/bg.jpg");
	background-repeat: no-repeat;
	height: 800px;
	background-position: center;
	background-size: cover;
}
</style>


<meta charset="ISO-8859-1">
<title>Create Account | E-Notes Application</title>



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
						<a class="navbar-brand text-warning" href="login.jsp"> <img
							src="assets/logo/logo.png" width="30" height="30"
							class="d-inline-block align-top" alt=""> E-Notes <br>
							Already have an Account
						</a>
					</div>

					<%
					String regMsg = (String) session.getAttribute("reg-success");
					if (regMsg != null) {
					%>
					<div class="alert alert-success" role="alert"> <%= regMsg %></div>
					<%
					session.removeAttribute("reg-success");
					}
					%>
					
					

					<%
					String regErrorMsg = (String) session.getAttribute("failed-msg");
					if (regErrorMsg != null) {
					%>
					<div class="alert alert-warning" role="alert"> <%= regErrorMsg %> </div>
					<%
					session.removeAttribute("failed-msg");
					}
					%>




					<div class="card-body">

						<form action="RegisterServlet" method="post">
							<div class="form-group">
								<div class="form-group">
									<label for="exampleInputPassword1">Full Name</label> <input
										type="text" name="name" class="form-control"
										id="exampleInputPassword1" placeholder="Enter FullName">
								</div>
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
							<div class="form-group">
								<label for="exampleInputPassword1">Repeat Password</label> <input
									type="password" name="repassword" class="form-control"
									id="exampleInputPassword1" placeholder="Repeat your Password">
							</div>
							<button type="submit"
								class="btn btn-warning badge-pill btn-block">
								<i class="fa fa-user m-1" aria-hidden="true"></i>Register
							</button>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="all_component/footer.jsp"%>




</body>
</html>