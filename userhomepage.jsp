<%@ page import="java.io.*,java.sql.*,java.util.Base64" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, intial-scale=1.0">
<title>Homepage | KF - Kongsi Food</title>
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
</head>
<style>
form{
	margin: 0;
}
</style>
<body>
	<section id="header">
		<a href="#"><img src="LogoBlack.png" class="logo" alt=""></a>
		
		<div>
			<ul id="navbar">
				<li><a class="active" href="#">Home</a></li>
				<li><a href="profilePage.jsp">My Profile</a></li>
				<li><a href="PostItem.jsp">Post Item</a></li>
				<li><a href="listofuser.jsp">User List</a></li>
				<li><a href="myItem.jsp">My Item</a></li>
				<li><form action='LogoutServlet' method='post'><input type='submit' value='Logout' class="li-a"></form></li>
				<li><a href="myItem.jsp"><i class="fa fa-bag-shopping" aria-hidden="true"></i></a></li>
			</ul>
		</div>
	</section>
	<section id='product1' class='section-p1'>
	<h2>Products From another user!</h2>
	<div class='pro-container'>
	
	<%! String base64Image = "";%>
    <%
    String username = null;
    String usertype = null;
    
    Cookie[] cookies = request.getCookies();
    if(cookies !=null){
    for(Cookie cookie : cookies){
    	if(cookie.getName().equals("user")) username = cookie.getValue();
    	
    }}
    if(username == null)response.sendRedirect("login.jsp");
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            // Load the JDBC driver
            Class.forName("com.mysql.jdbc.Driver");

            // Connect to the database
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/foodwaste", "root", "Nazone12"); 

            // Retrieve the image data from the database
            stmt = con.prepareStatement("SELECT * FROM ITEM");
         
            rs = stmt.executeQuery();

            while (rs.next()) {
                // Get the image data
                byte[] imageData = rs.getBytes("IMAGES");
                String itemname = rs.getString("ITEMNAME");
                String date = rs.getString("ITEM_EXP");
                String type = rs.getString("ITEM_TYPE");
                int itemid = rs.getInt("ITEMID");
                int isAvailable = rs.getInt("isAvailable");
                base64Image = Base64.getEncoder().encodeToString(imageData);

                // Set the content type to "image/jpeg" or "image/png"
                response.setContentType("image/jpeg");
                response.setContentType("text/html");
               
               
       			if(isAvailable == 1){
       			out.println("<div class='pro'>");
       			out.println("<img src='data:image/jpeg;base64," + base64Image + "' alt='Image from Database'/>");
       			out.println("<div class='des'>");
       			out.println("<span>"+rs.getString("ITEM_TYPE")+"</span>");
       			out.println("<h5>"+itemname+"</h5>");
       			out.println("<div class='star'>");
       					out.println("<i class='fas fa-star'></i>");
       							out.println("<i class='fas fa-star'></i>");
       									out.println("<i class='fas fa-star'></i>");
       											out.println("<i class='fas fa-star'></i>");
       													out.println("<i class='fas fa-star'></i>");
       															out.println("</div>");
       																	out.println("<h4>"+date+"</h4>");
       																			out.println("</div>");
       																					out.println("<form action='viewitemdetail.jsp' method='post'><input type='hidden' name='itemid' value='"+itemid+"'><input type='submit' class='fa-solid fa-eye cart' value='V' '></form>");
       																							out.println("</div>");
       			}
       																								
       																					
               
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
	</div>
							</section>
								
	<section id="banner" class="section-m1">
		<h4>Promotions</h4>
		<h2>First Time User Only, up to <span>4 Times Limit</span> <br>Product Available To Be Claimed</h2>
		<button class="normal">Claim Now!</button>
	</section>
	
	<section id="product1" class="section-p1">
		<h2>New Arrivals</h2>
		<p>New Instant Food</p>
		<div class="pro-container">
			<div class="pro">
				<img src="NewProduct.png" alt="">
				<div class="des">
					<span>Instant Noodle & Pasta</span>
					<h5>Samyang Hot Chicken Carbonara Ramen 130g x 5s</h5>
					<div class="star">
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
					</div>
					<h4>RM35.00</h4>
				</div>
				<a href="useritem.jsp"><i class="fa-solid fa-eye cart"></i></a>
			</div> 
			<div class="pro">
				<img src="NewProduct.png" alt="">
				<div class="des">
					<span>Instant Noodle & Pasta</span>
					<h5>Samyang Hot Chicken Carbonara Ramen 130g x 5s</h5>
					<div class="star">
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
					</div>
					<h4>RM35.00</h4>
				</div>
				<a href="useritem.jsp"><i class="fa-solid fa-eye cart"></i></a>
			</div>
			<div class="pro">
				<img src="NewProduct.png" alt="">
				<div class="des">
					<span>Instant Noodle & Pasta</span>
					<h5>Samyang Hot Chicken Carbonara Ramen 130g x 5s</h5>
					<div class="star">
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
					</div>
					<h4>RM35.00</h4>
				</div>
				<a href="useritem.jsp"><i class="fa-solid fa-eye cart"></i></a>
			</div>
			<div class="pro">
				<img src="NewProduct.png" alt="">
				<div class="des">
					<span>Instant Noodle & Pasta</span>
					<h5>Samyang Hot Chicken Carbonara Ramen 130g x 5s</h5>
					<div class="star">
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
					</div>
					<h4>RM35.00</h4>
				</div>
				<a href="useritem.jsp"><i class="fa-solid fa-eye cart"></i></a>
			</div>
			<div class="pro">
				<img src="NewProduct.png" alt="">
				<div class="des">
					<span>Instant Noodle & Pasta</span>
					<h5>Samyang Hot Chicken Carbonara Ramen 130g x 5s</h5>
					<div class="star">
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
					</div>
					<h4>RM35.00</h4>
				</div>
				<a href="useritem.jsp"><i class="fa-solid fa-eye cart"></i></a>
			</div>
			<div class="pro">
				<img src="NewProduct.png" alt="">
				<div class="des">
					<span>Instant Noodle & Pasta</span>
					<h5>Samyang Hot Chicken Carbonara Ramen 130g x 5s</h5>
					<div class="star">
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
					</div>
					<h4>RM35.00</h4>
				</div>
				<a href="useritem.jsp"><i class="fa-solid fa-eye cart"></i></a>
			</div>
			<div class="pro">
				<img src="NewProduct.png" alt="">
				<div class="des">
					<span>Instant Noodle & Pasta</span>
					<h5>Samyang Hot Chicken Carbonara Ramen 130g x 5s</h5>
					<div class="star">
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
					</div>
					<h4>RM35.00</h4>
				</div>
				<a href="useritem.jsp"><i class="fa-solid fa-eye cart"></i></a>
			</div>
			<div class="pro">
				<img src="NewProduct.png" alt="">
				<div class="des">
					<span>Instant Noodle & Pasta</span>
					<h5>Samyang Hot Chicken Carbonara Ramen 130g x 5s</h5>
					<div class="star">
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
					</div>
					<h4>RM35.00</h4>
				</div>
				<a href="useritem.jsp"><i class="fa-solid fa-eye cart"></i></a>
			</div>
		</div>
	</section>
	
<script src="script.js"></script>
</body>
</html>