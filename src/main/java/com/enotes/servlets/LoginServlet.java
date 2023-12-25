package com.enotes.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.enotes.dao.UserDAO;
import com.enotes.dbconnection.DBConnect;
import com.enotes.user.UserDetails;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		HttpSession session = request.getSession();
		RequestDispatcher dispatcher = null;

		if (email == null || email.equals("")) {
			request.setAttribute("status", "mailmsg");
			dispatcher = request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);
		}
		if (password == null || password.equals("")) {
			request.setAttribute("status", "passmsg");
			dispatcher = request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);
		}

		UserDetails userGet = new UserDetails();
		userGet.setEmail(email);
		userGet.setPassword(password);

		UserDAO userDAO = new UserDAO(DBConnect.getConn());
		UserDetails user = userDAO.getUserDetails(userGet);
		if (user != null) {
			session.setAttribute("userDetails", user);
			response.sendRedirect("home.jsp");
		} else {
			session.setAttribute("login-failed", "Invalid Username or Password");
			response.sendRedirect("login.jsp");
		}
	}

}
