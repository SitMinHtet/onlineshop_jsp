<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>

<% 

	try{
		
		Connection con = ConnectionProvider.getCon();
		Statement stmt = con.createStatement();
		String query = "create table users (name varchar(100),email varchar(100) primary key, mobileNumber bigInt, securityQuestion varchar(200), answer varchar(200), password varchar(100), address varchar(500), city varchar(100), state varchar(100), country varchar(100))";
		String query2 = "create table products (id int, name varchar(500), category varchar(200), price int, active varchar(10))";
		String query3 = "create table cart (email varchar(100), product_id int, quantity int, price int, total int, address varchar(500), city varchar(100), state varchar(100), country varchar(100), mobileNumber bigInt, orderDate varchar(100), deliveryDate varchar(100), paymentMethod varchar(100), transactionId varchar(100), status varchar(10) )";
		System.out.print("QUERY"+ query3);
		//stmt.execute(query);
		stmt.execute(query3);
		System.out.print("Created Users Table");
		con.close();
		
	}catch(Exception e) {
		System.out.print("Created Users Table Error"+ e);
	}
%> 