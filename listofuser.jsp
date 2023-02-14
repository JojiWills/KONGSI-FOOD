<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, intial-scale=1.0">
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
</head>
<title>Display Data from Database</title>

</head>
<body>

	<section id="header">
		<a href="#"><img src="LogoBlack.png" class="logo" alt=""></a>
		
		<div>
			<ul id="navbar">
				<li><a href="adminhomepage.jsp">Home</a></li>
				<li><a href="#">My Profile</a></li>
				<li><a href="adminpost.jsp">Post Item</a></li>
				<li><a class="active" href="#">User List</a></li>
				<li><a href="myItem.jsp">My Item</a></li>
				<li><a href="#">Log Out</a></li>
				<li><a href="#"><i class="fa fa-bag-shopping" aria-hidden="true"></i></a></li>
			</ul>
		</div>
	</section>
	<main>
	
	<div class="pro-container">
		<h2 style="text-align: center; margin-top: 40px;">User Information</h2>
			<div class="list">
    <%! 
    	String address,phone,username;
    %>	

		<%
		 String username =null;
		 String userType = null;
		    Cookie[] cookies = request.getCookies();
		    if(cookies !=null){
		    for(Cookie cookie : cookies){
		    	if(cookie.getName().equals("user")) username = cookie.getValue();
		    	if(cookie.getName().equals("usertype")) userType = cookie.getValue();
		    }}
		    if(username == null)response.sendRedirect("login.jsp");
			Connection con = null;
			Statement stmt = null;
			ResultSet rs = null;
			
			
			try {
				Class.forName("com.mysql.jdbc.Driver");
				con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/foodwaste","root","Nazone12");
				stmt = con.createStatement();
				rs = stmt.executeQuery("SELECT * FROM user2");
				while (rs.next()) {
					
	                address = rs.getString("address");
	                phone = rs.getString("phone");
	                username = rs.getString("username");
		%>
		
		
		

			<div class="line1">
				<div class="user">
					<div class="profile">
						<img src="#" alt="" width="50px" height="50px">
					</div>
					<div class="details">
						<h1 class="name"><%= rs.getString("NAME") %></h1>
						<h3 class="username"><%= rs.getString("username") %></h3>
					</div>
				</div>
				<div class="status">
					<span></span>
					<p>Verified Status : 	  
					 <% String status = rs.getString("isVerify");
				if(status.equals("0")){
					out.print("Not Verify");
				}else
					out.print("Verified");
				%>        </p>
				</div>
				<div class="location">
					<p><%= address %></p>
				</div>
				<div class="phone]">
					<p><%= phone %></p>
				</div>
				<div class="action">
					<td>
					<form action='verify.jsp' method='post'>
					<input type='hidden' name='username' value='<%= username %>'/> 
					<input type='submit' id="verify-btn" value='verify'/>
					</form>
					</td>
				</div>
			</div>


	
	

		
		<%
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					rs.close();
					stmt.close();
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		%>
		</div>
	<script>
		let status = document.getElementById("status");
	
		function changeColor(isVerified) {
		  if (isVerified) {
		    status.style.backgroundColor = "green";
		  } else {
		    status.style.backgroundColor = "red";
		  }
		}
	</script>
		</main>
</body>
</html>