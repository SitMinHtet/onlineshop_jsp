<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>

<% 

	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String mobileNumber = request.getParameter("mobileNumber");
	String securityQuestion = request.getParameter("securityQuestion");
	String answer = request.getParameter("answer");
	String password = request.getParameter("password");
	
	String address = "";
	String city = "";
	String state = "";
	String country = "";
		
	try{
		
		Connection con = ConnectionProvider.getCon();
		PreparedStatement pstmt = con.prepareStatement("insert into users values(?,?,?,?,?,?,?,?,?,?)");
		pstmt.setString(1, name);
		pstmt.setString(2, email);
		pstmt.setString(3, mobileNumber);
		pstmt.setString(4, securityQuestion);
		pstmt.setString(5, answer);
		pstmt.setString(6, password);
		pstmt.setString(7, address);
		pstmt.setString(8, city);
		pstmt.setString(9, state);
		pstmt.setString(10, country);
		pstmt.executeUpdate();
		
		response.sendRedirect("signup.jsp?msg=valid");
		System.out.print("NOT SUCC ?");
		
	}catch(Exception e){
		
		System.out.print("sugnupAction E "+ e);
		response.sendRedirect("signup.jsp?msg=invalid");
	}
			
%>