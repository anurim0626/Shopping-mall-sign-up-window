package test;

import java.sql.*;

public class DBconnect {

	public static Connection getConnection() {
		Connection conn = null;
		
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "system";
		String pw = "1234";
		
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection(url, id, pw);
			
			System.out.println("DB 접속");
		} catch(Exception e) {
			e.printStackTrace();
		}

		return conn;
	}

}
