<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>

<% 

	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String category = request.getParameter("email");
	String price = request.getParameter("price");
	String active = request.getParameter("active");

		
	try{
		
		Connection con = ConnectionProvider.getCon();
		PreparedStatement pstmt = con.prepareStatement("insert into products values(?,?,?,?,?)");
		pstmt.setString(1, id);
		pstmt.setString(2, name);
		pstmt.setString(3, category);
		pstmt.setString(4, price);
		pstmt.setString(5, active);
		pstmt.executeUpdate();
		
		response.sendRedirect("addNewProduct.jsp?msg=done");
		System.out.print("NOT SUCC ADD NEW Pro ?");
		
	}catch(Exception e){
		
		System.out.print("Add New Pro E "+ e);
		response.sendRedirect("addNewProduct.jsp?msg=wrong");
	}
			
%>