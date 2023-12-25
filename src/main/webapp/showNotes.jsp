<%@page import="com.enotes.user.PostDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.enotes.dbconnection.DBConnect"%>
<%@page import="com.enotes.dao.PostDAO"%>
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
<!-- Favicon -->
<link rel="icon" type="image/x-icon" href="assets/logo/logo.png">

<!-- Bootstrap CSS and JS Links and FontAwsone CDN and CSS Links -->
<%@ include file="all_component/allcss.jsp"%>
<meta charset="ISO-8859-1">
<title>View Notes | E-Notes Application</title>
</head>
<body>

	<%@ include file="all_component/navbar.jsp"%>
	<%
	String updateSuccMsg = (String) session.getAttribute("updateSuccMsg");
	if (updateSuccMsg != null) {
	%>
	<div class="alert alert-success" role="alert">
		<%=updateSuccMsg%>
	</div>
	<%
	session.removeAttribute("updateSuccMsg");
	}
	%>
	
	<%
	String deleteSuccMsg = (String) session.getAttribute("deleteSuccMsg");
	if (deleteSuccMsg != null) {
	%>
	<div class="alert alert-success" role="alert">
		<%=deleteSuccMsg%>
	</div>
	<%
	session.removeAttribute("deleteSuccMsg");
	}
	%>
	
	
	<%
	String deleteErroMsg = (String) session.getAttribute("deleteErroMsg");
	if (deleteErroMsg != null) {
	%>
	<div class="alert alert-danger" role="alert">
		<%=deleteErroMsg%>
	</div>
	<%
	session.removeAttribute("deleteErroMsg");
	}
	%>
	
	<div class="container">
		<h2 class="text-center">All Notes</h2>
		<div class="row">
			<div class="col-md-12">


				<%
				if (userDet != null) {
					PostDAO postDao = new PostDAO(DBConnect.getConn());
					List<PostDetails> postDetails = postDao.getPostData(userDet.getId());
					for (PostDetails pst : postDetails) {
				%>

				<div class="card mt-3">
					<img alt="" src="assets/logo/logo.png"
						class="card-img-top mt-2 mx-auto" style="max-width: 50px">
					<div class="card-body p-4">


						<h5 class="card-title">
							<%=pst.getTitle()%>
						</h5>
						<p>
							<%=pst.getContent()%>
						</p>

						<p>
							<b class="text-success">Published By: <%=userDet.getName()%>
							</b> <br> <b class="text-primary"></b>
						</p>

						<p>
							<b class="text-success">Published Date and Time: <%=pst.getDate()%>
							</b> <br> <b class="text-primary"></b>
						</p>


						<div class="container text-center mt-2">
							<a href="DeleteServlet?note_id=<%=pst.getId()%>" class="btn btn-danger">Delete
								Note</a> <a href="editNotes.jsp?note_id=<%=pst.getId()%>"
								class="btn btn-success">Edit Note</a>


						</div>
					</div>
				</div>
				<%
				}

				}
				%>


			</div>
		</div>
	</div>




	<%@ include file="all_component/footer.jsp"%>


</body>
</html>