
<%@page import="com.enotes.user.UserDetails"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-custom navbar-custom">
	<a class="navbar-brand" href="index.jsp"> <img
		src="assets/logo/logo.png" width="30" height="30"
		class="d-inline-block align-top" alt=""> E-Notes
	</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="home.jsp"><i
					class="fa fa-home m-1" aria-hidden="true"></i>Home <span
					class="sr-only">(current)</span> </a></li>
			<li class="nav-item active"><a class="nav-link" href="addNotes.jsp"><i
					class="fa fa-plus-circle m-1" aria-hidden="true"></i>Add E-Note <span
					class="sr-only">(current)</span> </a></li>
			<li class="nav-item active"><a class="nav-link" href="showNotes.jsp"><i
					class="fa fa-pencil-square m-1" aria-hidden="true"></i>Show Saved E-Note
					<span class="sr-only">(current)</span> </a></li>

		</ul>

		<%
		UserDetails user = (UserDetails) session.getAttribute("userDetails");

		if (user != null) {
		%>
		<div class="btn-group">
			<button type="button" class="btn btn-primary dropdown-toggle mr-3"
				data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				<i class="fa fa-user-circle m-1" aria-hidden="true"></i><%=user.getName()%>
			</button>
			<div class="dropdown-menu">
				<a class="dropdown-item" href="#" data-toggle="modal"
					data-target="#exampleModal"><i class="fa fa-users m-1"
					aria-hidden="true"></i>Profile</a> <a class="dropdown-item" href="#"><i
					class="fa fa-eye m-1" aria-hidden="true"></i>Change Password</a> <a
					class="dropdown-item" href="#"><i
					class="fa fa-question-circle m-1" aria-hidden="true"></i>Support</a>
				<div class="dropdown-divider"></div>
				<a class="dropdown-item" href="#"><i class="fa fa-comments m-1"
					aria-hidden="true"></i>FeedBack Form</a>
			</div>
		</div>


		<a type="button" class="btn btn-warning" href="LogoutServlet"><i
			class="fa fa-sign-in m-1" aria-hidden="true"></i>Logout</a>

		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header text-center">
						<h5 class="modal-title text-info" id="exampleModalLabel">Profile
							Details</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="container text-center">
							<img src="assets/logo/logo.png" width="30" height="30"
								class="d-inline-block align-top" alt="">
							<h5 class="text-primary"> <%= user.getName() %>  Profile</h5>
							<table class="table">
								<tbody>

									<tr>
										<th>User Id</th>
										<td><%=user.getId()%></td>
									</tr>

									<tr>
										<th>Full Name</th>
										<td><%=user.getName()%></td>
									</tr>

									<tr>
										<th>Email Id</th>
										<td><%=user.getEmail()%></td>
									</tr>

								</tbody>
							</table>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>	
					</div>
				</div>
			</div>
		</div>



		<%
		} else {
		%>
		<a type="button" class="btn btn-primary mr-3" href="login.jsp"><i
			class="fa fa-sign-in m-1" aria-hidden="true"></i>Login</a> <a
			type="button" class="btn btn-warning" href="register.jsp"><i
			class="fa fa-user m-1" aria-hidden="true"></i>Register</a>
		<%
		}
		%>



	</div>


</nav>

