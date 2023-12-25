<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%
UserDetails userDet = (UserDetails) session.getAttribute("userDetails");

if (userDet == null) {
	response.sendRedirect("login.jsp");
	session.setAttribute("login-error","Please login before adding notes...");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Notes | E-Notes Application</title>

<!-- Favicon -->
<link rel="icon" type="image/x-icon" href="assets/logo/logo.png">

<!-- Bootstrap CSS and JS Links and FontAwsone CDN and CSS Links -->
<%@ include file="all_component/allcss.jsp"%>



</head>
<body>



	<!-- Common navbar.jsp  -->
	<%@ include file="all_component/navbar.jsp"%>

	<div class="container p-4">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body">
						<p class="text-center fs-3">Add your Notes</p>
						<div class="container-fluid">
							<div class="row">
								<div class="col-md-12">
									<form action="AddNotesServlet" method="post">
										<div class="form-group">

											<%
											UserDetails userDetails = (UserDetails) session.getAttribute("userDetails");
											if (userDetails != null) {
											%>
											<input type="hidden" value="<%=userDetails.getId()%>"
												name="uid">
											<%
											}
											%>




											<label for="exampleFormControlInput1">Enter Title for
												the Note</label> <input type="text" name="title"
												class="form-control" id="exampleFormControlInput1"
												placeholder="Title">
										</div>
										<div class="form-group">
											<label for="exampleFormControlTextarea1">Enter
												Content</label>
											<textarea class="form-control" name="content"
												id="exampleFormControlTextarea1" rows="10" cols=""></textarea>
										</div>

										<div class="container text-center">
											<button type="submit" class="btn btn-primary">Save
												Note</button>
										</div>
									</form>
								</div>
							</div>
						</div>




					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="all_component/footer.jsp"%>
</body>
</html>