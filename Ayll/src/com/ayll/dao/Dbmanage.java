package com.ayll.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Dbmanage {
	
	public Connection initDB() {
		
		Connection conn = null;
		
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			
			String url = "jdbc:mysql://localhost:3306/ayll";
			
			conn = DriverManager.getConnection(url, "root", "root");
			
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return conn;
	}
	
	public void closeDB(Statement sta, Connection conn) {
		
		try {
			
			if (sta != null)
				sta.close();
			if (conn != null) 
				conn.close();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
	}
	
	public void close(ResultSet rs, Statement sta, Connection conn) {
		
		try {
			
			if (rs != null)
				rs.close();
			if (sta != null)
				sta.close();
			if (conn != null)
			conn.close();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
	}
}
