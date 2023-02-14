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
<%! String base64Image = "";
	String name,date,type;
    int qty;%>
    <%
	int itemid = (int) request.getAttribute("itemid");
    
    Connection con = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    try {
        // Load the JDBC driver
        Class.forName("com.mysql.jdbc.Driver");

        // Connect to the database
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/foodwaste", "root", "Nazone12"); 

        // Retrieve the image data from the database
        stmt = con.prepareStatement("SELECT * FROM ITEM WHERE ITEMID = ?");
        stmt.setInt(1, itemid);
        rs = stmt.executeQuery();

        if (rs.next()) {
        name = rs.getString("ITEMNAME");
    	type = rs.getString("ITEM_TYPE");
    	qty = rs.getInt("ITEM_TOTAL");
    	date = rs.getString("ITEM_EXP");
            
        }
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) {
                rs.close();
            }
            if (stmt != null) {
                stmt.close();
            }
            if (con != null) {
                con.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
 
	%>

	<section id="header">
		<a href="#"><img src="LogoBlack.png" class="logo" alt=""></a>
		
		<div>
			<ul id="navbar">
				<li><a href="userhomepage.jsp">Home</a></li>
				<li><a href="#">My Profile</a></li>
				<li><a class="active" href="#">Post Item</a></li>
				<li><a href="#">Log Out</a></li>
				<li><a href="#"><i class="fa fa-bag-shopping" aria-hidden="true"></i></a></li>
			</ul>
		</div>
	</section>
	<section id="form1" class="section-p2">
		<h2>Success!</h2>
		<hr class="line">
		<div class="pro-container">
			<h3>Successful Received the item </h2>
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