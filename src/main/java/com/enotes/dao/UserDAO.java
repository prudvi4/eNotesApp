package com.enotes.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.enotes.user.UserDetails;

public class UserDAO {
	private Connection conn;

	/**
	 * @param conn
	 */
	public UserDAO(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addUser(UserDetails user) {
		boolean addUserFlag = false;
		String INS_QRY = "INSERT INTO enotes_app.user(name,email,password) VALUES(?,?,?)";
		try {
			PreparedStatement pst = conn.prepareStatement(INS_QRY);
			pst.setString(1, user.getName());
			pst.setString(2, user.getEmail());
			pst.setString(3, user.getPassword());
			int rowAffected = pst.executeUpdate();
			if (rowAffected == 1) {
				addUserFlag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return addUserFlag;
	}

	public UserDetails getUserDetails(UserDetails user) {
		UserDetails userDetails = null;
		String GET_QRY = "SELECT * FROM enotes_app.user WHERE email=? AND password=?";
		try {
			PreparedStatement pst = conn.prepareStatement(GET_QRY);
			pst.setString(1, user.getEmail());
			pst.setString(2, user.getPassword());
			ResultSet resultSet = pst.executeQuery();
			if (resultSet.next()) {
				userDetails = new UserDetails();
				userDetails.setId(resultSet.getInt("id"));
				userDetails.setName(resultSet.getString("name"));
				userDetails.setEmail(resultSet.getString("email"));
				userDetails.setPassword(resultSet.getString("password"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return userDetails;
	}
}
