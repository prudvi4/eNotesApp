package com.enotes.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.enotes.dao.UserDAO;
import com.enotes.dbconnection.DBConnect;
import com.enotes.user.UserDetails;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String repassword = req.getParameter("repassword");
		HttpSession session;

		UserDetails addUser = new UserDetails();
		addUser.setName(name);
		addUser.setEmail(email);
		addUser.setPassword(password);

		UserDAO userDAO = new UserDAO(DBConnect.getConn());
		boolean addUserFlag = userDAO.addUser(addUser);
		if (addUserFlag) {
			session = req.getSession();
			session.setAttribute("reg-success", "Registration Successfully Please Login..");
			resp.sendRedirect("register.jsp");
		} else {
			session = req.getSession();
			session.setAttribute("failed-msg", "Server Error...");
			resp.sendRedirect("register.jsp");
		}
	}

}
