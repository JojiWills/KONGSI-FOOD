<%@ page import="java.io.*,java.sql.*,java.util.Base64" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Post An Item | KF - Kongsi Food</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, intial-scale=1.0">
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
</head>
<style>
#form1 .pro-container{
	flex-direction: column;
	align-items: center;
}
</style>
<body>
<%! String base64Image = "";%>
    <%
	String name = (String) request.getAttribute("name");
    String date = (String) request.getAttribute("date");
    String type = (String) request.getAttribute("type");
    int qty = (int) request.getAttribute("qty");
 
	%>

	<section id="header">
		<a href="#"><img src="LogoBlack.png" class="logo" alt=""></a>
		
		<div>
			<ul id="navbar">
				<li><a href="userhomepage.jsp">Home</a></li>
				<li><a href="ProfilePAge.jsp">My Profile</a></li>
				<li><a class="active" href="#">Post Item</a></li>
				<li><a href="LogoutServlet">Log Out</a></li>
			
			</ul>
		</div>
	</section>
	<section id="form1" class="section-p2">
		<h2>Success!</h2>
		<hr class="line">
		<div class="pro-container">
			<h3>Thank You For Sharing Your Item.</h2>
			<div class="table">
				<div class="row">
					<div class="cell wide">Item Name: </div>
				    <div class="cell"><%= name %></div>
				</div>
				<div class="row">
				    <div class="cell wide">Item Type: </div>
				    <div class="cell"><%=type%> </div>
				</div>
				<div class="row">
				    <div class="cell wide">Expiration Date: </div>
				    <div class="cell"><%= date %></div>
				</div>
				<div class="row">
				    <div class="cell wide">Quantity: </div>
				    <div class="cell"><%= qty %></div>
				</div>
			</div>
			<a id="back-btn" href="userhomepage.jsp">Back</a>
		</div>
		
		
		
	</section>
</body>
</html>