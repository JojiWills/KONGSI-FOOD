<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update User Information</title>	
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
<style>
 @import url('https://fonts.googleapis.com/css?family=Josefin+Sans');

*{
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  outline: none;
  text-decoration: none;
}

body{
  /*background: url("bg.jpg") no-repeat center center;*/
  background-size: cover;
  background-color: #00e5ff;
  width: 100%;
  height: 100vh;
}

.wrapper{
  position: absolute;
  top: 50%;
  left: 40%;
  transform: translate(-50%,-50%);
  width: 500px;
  height: 350px;
}

.checkout_wrapper{
  width: 900px;
  height: 400px;
  display: flex;
}

.checkout_wrapper .product_info{
  width: 45%;
  background: #5386f3;
  border-top-left-radius: 20px;
  border-bottom-left-radius: 20px;
  position: relative;
}

.checkout_wrapper .product_info img{
  width: 200px;
  margin-top: 30px;
  margin-left: 115px;
}

.checkout_wrapper .checkout_form{
  width: 55%;
  background: #fff;
  padding: 50px 30px;
  border-top-right-radius: 120px;
  border-bottom-right-radius: 20px;
}

.checkout_wrapper .product_info .content{
  text-align: center;
  margin-top: 25px;
  color: #fff;
  text-transform: uppercase;
}

.checkout_wrapper .product_info .content h3{
  font-size: 18px;
  line-height: 18px;
  letter-spacing: 3px;
}

.checkout_wrapper .product_info .content p{
  margin-top: 10px;
  font-size:14px;
}

.checkout_form p{
  margin-bottom: 25px;
  font-size: 20px;
  text-transform: uppercase;
}

.checkout_form .details .section{
  margin-bottom: 15px;
}

.checkout_form .details .section input[type="text"]{
  width: 100%;
  padding: 10px;
  border: 2px solid #dddddd;
}

.checkout_form .details .section input[type="text"]:focus{
  border: 2px solid #5386f3;
}

.checkout_form .details .section.last_section{
  display: flex;
  justify-content: space-between;
}

.checkout_form .details .section.last_section .item{
  width: 48%;
}

.checkout_form .details .btn{
  background: #5386f3;
  padding: 10px;
  border-radius: 25px;
  text-align: center;
  margin-top: 25px;
}

form{

margin: 0;
}

p {
margin: 0;
}

.checkout_form .details .btn a{
  color: #fff;
  letter-spacing: 5px;
  display: block;
}

.custom-file-input {
  color: transparent;
  margin-top: 10px;
  font-size:14px;
}
.custom-file-input::-webkit-file-upload-button {
  visibility: hidden;
}
.custom-file-input::before {
  content: 'Select some files';
  color: black;
  display: inline-block;
  background: -webkit-linear-gradient(top, #f9f9f9, #e3e3e3);
  border: 1px solid #999;
  border-radius: 3px;
  padding: 5px 8px;
  outline: none;
  white-space: nowrap;
  -webkit-user-select: none;
  cursor: pointer;
  text-shadow: 1px 1px #fff;
  font-weight: 700;
  font-size: 10pt;
}
.custom-file-input:hover::before {
  border-color: black;
}
.custom-file-input:active {
  outline: 0;
}
.custom-file-input:active::before {
  background: -webkit-linear-gradient(top, #e3e3e3, #f9f9f9); 
}

.wrapper .checkout_wrapper .product_info .content .custom-file-input
{
    
    color: transparent;
    letter-spacing: 1px;
    margin-left: 130px;
   
}

.log-btn{
	margin: 0;
}
</style>
</head>
<body>
<section id="header">
		<a href="#"><img src="LogoBlack.png" class="logo" alt=""></a>
		
		<div>
			<ul id="navbar">
				<li><a class="active" href="userhomepage.jsp">Home</a></li>
				<li><a href="profilePage.jsp">My Profile</a></li>
				<li><a href="PostItem.jsp">Post Item</a></li>
				<li><a href="listofuser.jsp">User List</a></li>
				<li><a href="myItem.jsp">My Item</a></li>
				<li><form action='LogoutServlet' method='post' class="log-btn"><input type='submit' value='Logout' class="li-a"></form></li>
				<li><a href="myItem.jsp"><i class="fa fa-bag-shopping" aria-hidden="true"></i></a></li>
			</ul>
		</div>
	</section>
	
	<%
		String username = request.getParameter("username");
		String name = "";
		String email = "";
		String phone = "";
		String address = "";
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/foodwaste","root","Nazone12");
			stmt = con.createStatement();
			rs = stmt.executeQuery("SELECT * FROM user2 WHERE USERNAME = '" + username +"'");
			if (rs.next()) {
				username = rs.getString("USERNAME");
				email = rs.getString("EMAIL");
				name = rs.getString("NAME");
				phone = rs.getString("PHONE");
				address = rs.getString("ADDRESS");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} 
	%>
<body>
<div class="wrapper">
  <div class="checkout_wrapper">
    <div class="product_info">
      <img src="avat.png" alt="product">
      <div class="content">
        <h3> New Profile Picture </h3>
        <input type="file" class="custom-file-input">
      </div>
     
    </div>
    <div class="checkout_form">
	<form action="updateVerify" method="post">
	<p>Verify User Form</p>
		<input type="hidden" name="username" value="<%=username%>">
		 <div class="details">
        <div class="section">
          <input type="text" name="username" value="<%=username%>" disabled>
        </div>
		 <div class="section">
          <input type="text" name="name" value="<%=name%>" disabled>
        </div>
	     <div class="section">
          <input type="text" name="email" value="<%=email%>" disabled>
        </div>
         <div class="section">
          <input type="text" name="phone" value="<%=phone%>" disabled>
        </div>
		<div class="section">
          <input type="text" name="address" value="<%=address%>" disabled>
        </div>
     
			
			<tr>
				<td>Verification</td>
				<td>
				<select name="type" id="type" >
				  <option value="verify">Verify</option>
				  <option value="delete">Delete</option></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="Update"></td>
			</tr>
			
			
			
		
	</form>

  </body>
</html>