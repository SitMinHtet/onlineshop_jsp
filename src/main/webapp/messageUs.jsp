<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@include file="header.jsp" %>
<%@include file="footer.jsp" %>
<%@page errorPage="error.jsp" %>

<html>
<head>
<link rel="stylesheet" href="css/messageUs.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Message Us</title>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Message Us <i class='fas fa-comment-alt'></i></div>

<h3 style="text-align:center; color:red;">Message successfully sent. Our team will contact you soon!</h3>

<h3 style="text-align:center; ">Something Went Wrong! Try Again!</h3>


<br><br><br>
</body>
</html>