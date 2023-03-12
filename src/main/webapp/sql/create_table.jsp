<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>

<% 

	try{
		
		Connection con = ConnectionProvider.getCon();
		Statement stmt = con.createStatement();
		String query = "create table users (name varchar(100),email varchar(100) primary key, mobileNumber bigInt, securityQuestion varchar(200), answer varchar(200), password varchar(100), address varchar(500), city varchar(100), state varchar(100), country varchar(100))";
		System.out.print("QUERY"+ query);
		stmt.execute(query);
		System.out.print("Created Users Table");
		con.close();
		
	}catch(Exception e) {
		System.out.print("Created Users Table Error"+ e);
	}
%> 