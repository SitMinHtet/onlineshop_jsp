<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>

<% 

	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String category = request.getParameter("category");
	String price = request.getParameter("price");
	String active = request.getParameter("active");
	
	System.out.print(name);
	System.out.print(category);
	System.out.print(price);
	System.out.print(active);
	try{
		
		Connection con = ConnectionProvider.getCon();
		Statement stmt = con.createStatement();
		stmt.executeUpdate("update products set name='"+name+"', category='"+category+"', price='"+price+"', active='"+active+"' where id='"+id+"'");
		
		if(active.equals("No")){
			stmt.executeUpdate("delete from cart where product_id='"+id+"'");
		}
		response.sendRedirect("allProductEditProduct.jsp?msg=done");
		
		
		System.out.print("NOT SUCC Edit Product?");
		
	}catch(Exception e){
		
		System.out.print("Edit Product E "+ e);
		response.sendRedirect("allProductEditProduct.jsp?msg=wrong");
	}
			
%>