package com.enotes.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.enotes.dao.PostDAO;
import com.enotes.dbconnection.DBConnect;

/**
 * Servlet implementation class AddNotesServlet
 */
@WebServlet("/AddNotesServlet")
public class AddNotesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int uid = Integer.parseInt(request.getParameter("uid"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");

		PostDAO postDAO = new PostDAO(DBConnect.getConn());
		boolean addNotesFlag = postDAO.addNotes(title, content, uid);
		if (addNotesFlag) {
			response.sendRedirect("showNotes.jsp");
		} else {

		}

	}

}
