<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>

<% 

	
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	
	if("admin@gmail.com".equals(email) && "admin".equals(password)){
		
		session.setAttribute("email", email);
		response.sendRedirect("admin/adminHome.jsp");
		
		
	}
	else{
		int x=0;
		
		
		try{
			
			Connection con = ConnectionProvider.getCon();
			Statement stmt = con.createStatement();
			
			
			ResultSet rs = stmt.executeQuery("select * from users where email='"+email+"' password='"+password+"'");
			
			while(rs.next()){
				
				x = 1;
				session.setAttribute("email", email);
				response.sendRedirect("home.jsp");
			}
			
			if(x == 0){
				response.sendRedirect("signup.jsp?msg=notexist");
			}
			
			response.sendRedirect("signup.jsp?msg=invalid");
			System.out.print("NOT SUCC ?");
			
		}catch(Exception e){
			
			System.out.print("sugnupAction E "+ e);
			response.sendRedirect("signup.jsp?msg=invalid");
		}
		
	}
		
	
			
%>