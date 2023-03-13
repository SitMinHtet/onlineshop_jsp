<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>

<% 

	String email = request.getParameter("email");
	String mobileNumber = request.getParameter("mobileNumber");
	String securityQuestion = request.getParameter("securityQuestion");
	String answer = request.getParameter("answer");
	String newPassword = request.getParameter("newPassword");
	
	System.out.print("NNN" +mobileNumber);
	int check = 0;
	try{
		
		Connection con = ConnectionProvider.getCon();
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery("select * from users where email='"+email+"' and mobileNumber='"+mobileNumber+"' and securityQuestion='"+securityQuestion+"' and answer='"+answer+"'");
		
		System.out.print("RRSS"+rs);
		
		while(rs.next()){
			
			check = 1;
			stmt.executeUpdate("update users set password='"+newPassword+"' where email='"+email+"'");
			System.out.print("Update?");
			response.sendRedirect("forgotPassword.jsp?msg=done");
			
		}
		
		
		if(check == 0){
			System.out.print("CHECK 0?");
			response.sendRedirect("forgotPassword.jsp?msg=invalid");
		}

		System.out.print("NOT SUCC New Pass?");
		
	}catch(Exception e){
		
		System.out.print("NewPassAction E "+ e);
	}
			
%>