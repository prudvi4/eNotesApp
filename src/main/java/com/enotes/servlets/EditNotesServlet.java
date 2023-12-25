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
 * Servlet implementation class EditNotesServlet
 */
@WebServlet("/EditNotesServlet")
public class EditNotesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			Integer noteid = Integer.parseInt(request.getParameter("noteid"));
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			PostDAO pst = new PostDAO(DBConnect.getConn());
			boolean updFlag = pst.postUpdate(noteid, title, content);
			HttpSession session = request.getSession();
			if (updFlag) {
				session.setAttribute("updateSuccMsg", "Notes Updated Successfully");
				response.sendRedirect("showNotes.jsp");
			} else {
				session.setAttribute("updateErrorMsg", "Notes Update Failed");
				response.sendRedirect("editNotes.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
