package com.enotes.dbconnection;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
	public static Connection connection;

	public static Connection getConn() {
		String dbUrl = "jdbc:mysql://127.0.0.1:3306/?user=excelr?useSSL=false";
		String user = "excelr";
		String password = "excelr@123";

		if (connection == null) {
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				connection = DriverManager.getConnection(dbUrl, user, password);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return connection;
	}

}
