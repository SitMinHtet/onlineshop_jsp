<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@include file="header.jsp" %>
<%@include file="footer.jsp" %>
<%@page errorPage="error.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Cart</title>
<style>
h3
{
	color: yellow;
	text-align: center;
}
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">My Cart <i class='fas fa-cart-arrow-down'></i></div>

<h3 class="alert">There is only one Quantity! So click on remove!</h3>

<h3 class="alert">Quantity  Increased Successfully!</h3>

<h3 class="alert">Quantity  Decreased Successfully!</h3>

<h3 class="alert">Product Successfully Removed!</h3>

<table>
<thead>
          <tr>
            <th scope="col" style="background-color: yellow;">Total: <i class='fas fa-dollar'></i> </th>
            <th scope="col"><a href="">Proceed to order</a></th>
          </tr>
        </thead>
        <thead>
          <tr>
          <th scope="col">S.No</th>
            <th scope="col">Product Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class='fas fa-dollar'></i> price</th>
            <th scope="col">Quantity</th>
            <th scope="col">Sub Total</th>
            <th scope="col">Remove <i class='fas fa-trash-alt'></i></th>
          </tr>
        </thead>
        <tbody>
         <%
	       	try{
	       		String e = session.getAttribute("email").toString();
	       		
		       	Connection con = ConnectionProvider.getCon();
				Statement stmt = con.createStatement();
				System.out.println("AAA "+ e);
				ResultSet rs = stmt.executeQuery("select * from cart where email='"+e+"'");
				System.out.println("BBB");
				
				int index = 0;
				while(rs.next()){
					index = index+1;
	       %>
      
          <tr>

           <td><% out.print(index); %></td>
            <td><%= rs.getString(2) %></td>
            <td></td>
            <td><i class='fas fa-dollar'></i> </td>
            <td><a href=""><i class='fas fa-plus-circle'></i></a>  <a href=""><i class='fas fa-minus-circle'></i></a></td>
            <td><i class='fas fa-dollar'></i> </td>
            <td><a href=""> <i class='fas fa-trash-alt'></i></a></td>
          </tr>
          <%
				}
				}
	       		catch(Exception e){
	       			System.out.print("Cart List "+ e);
	       		}
	        %>

        </tbody>
      </table>
      <br>
      <br>
      <br>

</body>
</html>