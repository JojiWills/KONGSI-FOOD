<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Profile Update Form</title>
	<link rel="stylesheet" href="style.css">
  <style>
    @import url('https://fonts.googleapis.com/css?family=Josefin+Sans');

*{
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  outline: none;
  text-decoration: none;
}

form{
	margin: 0;
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

p {
margin: 0;
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

  </style>
</head>
<%
String userName = null;
Cookie[] cookies = request.getCookies();
if(cookies !=null){
for(Cookie cookie : cookies){
	if(cookie.getName().equals("user")) userName = cookie.getValue();
}}
if(userName == null)response.sendRedirect("login.jsp");


  Connection conn = null;
  PreparedStatement stmt = null;
  ResultSet rs = null;
  String name = null;
  String email = null;
  String phone = null;
  String address = null;
    
  try {
      // Load the JDBC driver
      Class.forName("com.mysql.jdbc.Driver");
      // Open a connection to the database
      conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/foodwaste", "root", "Nazone12"); 
      // Execute a SELECT statement to retrieve the user's profile information
      stmt = conn.prepareStatement("SELECT name, email, phone, address FROM user2 WHERE username = '"+userName+"'");
    
      rs = stmt.executeQuery();
		
      // Extract the user's profile information from the result set
      if (rs.next()) {
        name = rs.getString("name");
        email = rs.getString("email");
        phone = rs.getString("phone");
        address = rs.getString("address");}
      
    } catch (Exception e) {
		e.printStackTrace();
	}

  %>
<body>

<section id="header">
		<a href="#"><img src="LogoBlack.png" class="logo" alt=""></a>
		
		<div>
			<ul id="navbar">
				<li><a href="userhomepage.jsp">Home</a></li>
				<li><a class="active" href="profilePage.jsp">My Profile</a></li>
				<li><a href="PostItem.jsp">Post Item</a></li>
				<li><a href="listofuser.jsp">User List</a></li>
				<li><a href="myItem.jsp">My Item</a></li>
				<li><form action='LogoutServlet' method='post'><input type='submit' value='Logout' class="li-a"></form></li>
				<li><a href="myItem.jsp"><i class="fa fa-bag-shopping" aria-hidden="true"></i></a></li>
			</ul>
		</div>
	</section>

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
    <form method="post" action="profileUpdate">
      <p>Profile Update Form</p>
      <div class="details">
        <div class="section">
        <input type='hidden' name='username' value='<%= userName %>' >
          <input type="text" name="name" value="<%=name%>" placeholder="Name">
        </div>
        <div class="section">
            <br> <input type="text" name="phone" value="<%=phone%>"  placeholder="Phone Number">
        </div>
        <div class="section">
            <br> <input type="text" name="email" value="<%=email%>"  placeholder="email">
        </div>
        <div class="section">
            <br><input type="text" name="address" value="<%=address%>"  placeholder="Address">
          </div>
          </div>
        
        <div class="btn">
          <input type="submit" name="submit" value="Update"></div>
          </form>
        </div>
      </div>
    </div>
</body>



</html>