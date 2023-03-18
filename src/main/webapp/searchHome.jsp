<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@include file="header.jsp" %>
<%@include file="footer.jsp" %>
<%@page errorPage="error.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Home <i class="fa fa-institution"></i></div>
<table>
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> Price</th>
            <th scope="col">Add to cart <i class='fas fa-cart-plus'></i></th>
          </tr>
        </thead>
        <tbody>
         <%
         	int x = 0;
	       	try{
	       		
	       		String search = request.getParameter("search");
		       	Connection con = ConnectionProvider.getCon();
				Statement stmt = con.createStatement();
				
				ResultSet rs = stmt.executeQuery("select * from products where active='Yes' and name like '%"+search+"%' or category like '%"+search+"%'");
				
				int index = 0;
				while(rs.next()){
					x = 1;
					index = index+1;
	       %>

          <tr>
            <td><% out.print(index);%></td>
            <td><%= rs.getString(2) %></td>
            <td><%= rs.getString(3) %></td>
            <td><i class='fas fa-dollar'></i> <%= rs.getString(5) %></td>
            <td><a href="addToCartAction.jsp?id=<%= rs.getString(1) %>"> <i class='fas fa-cart-plus'></i></a></td>
          </tr>
          <%
				}
				}
	       		catch(Exception e){
	       			System.out.print("Product List "+ e);
	       		}
	        %>
         
        </tbody>
      </table>
      	<%
      		if(x ==0){
      			
      		
      	%>
			<h1 style="color:white; text-align: center;">Nothing to show</h1>
		<%
			}
		%>
      <br>
      <br>
      <br>
      <div class="footer">
          <p>All right reserved by BTech Days</p>
      </div>

</body>
</html>