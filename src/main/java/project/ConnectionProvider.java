package project;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider {
	
	public static Connection getCon() {
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ospjsp","root","Sitmin@16");
			return conn;
		} catch (Exception e) {
			System.out.println("E"+e);
			return null;
		}
		
	}

}
