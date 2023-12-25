package com.enotes.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.enotes.dao.PostDAO;
import com.enotes.dbconnection.DBConnect;

/**
 * Servlet implementation class DeleteServlet
 */
@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Integer noteid = Integer.parseInt(req.getParameter("note_id"));

		PostDAO pst = new PostDAO(DBConnect.getConn());
		boolean DelFlag = pst.postDelete(noteid);
		HttpSession session = req.getSession();
		if (DelFlag) {
			session.setAttribute("deleteSuccMsg", "Post Deleted Successfully");
			resp.sendRedirect("showNotes.jsp");
		} else {
			session.setAttribute("deleteErroMsg", "Post Delete Failed");
			resp.sendRedirect("showNotes.jsp");

		}

	}

}
