<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
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

.checkout_wrapper .checkout_form h2{
	font-size: 36px;
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


  </style>
</head>


  <%
  String username = null;
  Cookie[] cookies = request.getCookies();
  if(cookies !=null){
  for(Cookie cookie : cookies){
  	if(cookie.getName().equals("user")) username = cookie.getValue();
  }}
  if(username == null)response.sendRedirect("login.jsp");
  Connection conn = null;
  PreparedStatement stmt = null;
  ResultSet rs = null;
    
  try {
      // Load the JDBC driver
      Class.forName("com.mysql.jdbc.Driver");
      // Open a connection to the database
      conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/foodwaste", "root", "Nazone12"); 
      // Execute a SELECT statement to retrieve the user's profile information
      stmt = conn.prepareStatement("SELECT name, email, phone, address FROM user2 WHERE USERNAME = '"+username+"'");
    
      rs = stmt.executeQuery();
		
      // Extract the user's profile information from the result set
      if (rs.next()) {
        String name = rs.getString("name");
        String email = rs.getString("email");
        String phone = rs.getString("phone");
        String address = rs.getString("address");
      
      
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
        <h3> Name </h3><br>
        <h3> <%= name %></h3>
       
      </div>
     
    </div>
    <div class="checkout_form">
      <h2>Profile Information</h2>
      <div class="details">
        <div class="section">
          <p>Email: <%= email %></p>
        </div>
        <div class="section">
          <br><p>  Phone: <%= phone %></p>
        </div>
        <div class="section">
          <br><p> Address: <%= address %></p>
          </div>
        <div class="btn">
          <a href="profileUpdate.jsp">Update</a>
        </div>
        
      </div>
    </div>
  </div>
</div>
</body>

<%
      }
    } catch (SQLException | ClassNotFoundException ex) {
      // Handle the exception
      ex.printStackTrace();
    } finally {
      // Close the JDBC resources
      try {
        if (rs != null) {
          rs.close();
        }
        if (stmt != null) {
          stmt.close();
        }
        if (conn != null) {
          conn.close();
        }
      } catch (SQLException ex) {
        // Handle the exception
        ex.printStackTrace();
      }
    }
  %>
  







</html>