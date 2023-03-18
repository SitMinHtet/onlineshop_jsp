<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>

<% 

	String email = session.getAttribute("email").toString();
	String product_id = request.getParameter("id");
	
	int quantity = 1;
	int product_price = 0;
	int product_total = 0;
	int cart_total = 0;
		
	int x = 0;
	try{
		
		Connection con = ConnectionProvider.getCon();
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery("select * from products where id ='"+product_id+"'");
		
		while(rs.next()){
			product_price = rs.getInt(4);
			product_total = product_price;
		}
		
		ResultSet rs1 = stmt.executeQuery("select * from cart where product_id ="+product_id+" and email='"+email+"'");
		
		while(rs1.next()){
			
			cart_total = rs1.getInt(5);
			cart_total = cart_total + product_total;
			quantity = rs1.getInt(3);
			quantity = quantity + 1;
			x = 1;
			
		}
		
		
		if( x== 1){
			
			stmt.executeUpdate("update cart set total='"+cart_total+"', quantity='"+quantity+"' where product_id='"+product_id+"' and email='"+email+"'");
			response.sendRedirect("home.jsp?msg=exist");
		}
		if( x== 0){
			
			PreparedStatement pstmt = con.prepareStatement("insert into cart (email, product_id,quantity, price, total ) values (?,?,?,?,?)");
			pstmt.setString(1, email);
			pstmt.setString(2, product_id);
			pstmt.setInt(3, quantity);
			pstmt.setInt(4, product_price);
			pstmt.setInt(5, product_total);
			pstmt.executeUpdate();
			
			response.sendRedirect("home.jsp?msg=add");
		}
		
		System.out.print("NOT SUCC ?");
		
	}catch(Exception e){
		
		System.out.print("add to cart E "+ e);
		response.sendRedirect("home.jsp?msg=invalid");
	}
			
%>