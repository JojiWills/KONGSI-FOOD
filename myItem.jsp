<%@ page import="java.io.*,java.sql.*,java.util.Base64" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title></title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="style.css">
        <!-- font awesome -->
        <script src="https://kit.fontawesome.com/dbed6b6114.js" crossorigin="anonymous"></script>
        <style>
          @import url('https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;500;600;700&family=Roboto:wght@300;400;500;700;900&display=swap');

:root{
    --white-light: rgba(255, 255, 255, 0.5);
    --alice-blue: #f8f9fa;
    --carribean-blue: #00e5ff;
    --gray: #ededed;
}
*{
    padding: 0;
    margin: 0;
    box-sizing: border-box;
}
body{
    font-family: 'Quicksand', sans-serif;
}

/* Utility stylings */
img{
    width: 100%;
    display: block;
}
.container{
    width: 88vw;
    margin: 0 auto;
}
.lg-title,
.md-title,
.sm-title{
    font-family: 'Roboto', sans-serif;
    padding: 0.6rem 0;
    text-transform: capitalize;
}
.lg-title{
    font-size: 2.5rem;
    font-weight: 500;
    text-align: center;
    padding: 1.3rem 0;
    opacity: 0.9;
}

.log-btn{
		margin: 0;
	}
	
.md-title{
    font-size: 2rem;
    font-family: 'Roboto', sans-serif;
}
.sm-title{
    font-weight: 300;
    font-size: 1rem;
    text-transform: uppercase;
}
.text-light{
    font-size: 1rem;
    font-weight: 600;
    line-height: 1.5;
    opacity: 0.5;
    margin: 0.4rem 0;
}

/* product section */
.products{
    background: var(--alice-blue);
    padding: 3.2rem 0;
}
.products .text-light{
    text-align: center;
    width: 70%;
    margin: 0.9rem auto;
}
.product{
    margin: 2rem;
    position: relative;
}
.product-content{
    background: var(--gray);
    padding: 3rem 0.5rem 2rem 0.5rem;
    cursor: pointer;
}
.product-img{
    background: var(--white-light);
    box-shadow: 0 0 20px 10px var(--white-light);
    width: 200px;
    height: 200px;
    margin: 0 auto;
    border-radius: 50%;
    transition: background 0.5s ease;
}
.product-btns{
    display: flex;
    justify-content: center;
    margin-top: 1.4rem;
    opacity: 0;
    transition: opacity 0.6s ease;
}
.btn-cart, .btn-buy{
    background: transparent;
    border: 1px solid black;
    padding: 0.8rem 0;
    width: 125px;
    font-family: inherit;
    text-transform: uppercase;
    cursor: pointer;
    border: none;
    transition: all 0.6s ease;
}
.btn-cart{
    background: black;
    color: white;
}
.btn-cart:hover{
    background: var(--carribean-blue);
}
.btn-buy{
    background: white;
}
.btn-buy:hover{
    background: var(--carribean-blue);
    color: #fff;
}
.product-info{
    background: white;
    padding: 2rem;
}
.product-info-top{
    display: flex;
    justify-content: space-between;
    align-items: center;
}
.rating span{
    color: var(--carribean-blue);
}
.product-name{
    color: black;
    display: block;
    text-decoration: none;
    font-size: 1rem;
    text-transform: uppercase;
    font-weight: bold;
}
.product-price{
    padding-top: 0.6rem;
    padding-right: 0.6rem;
    display: inline-block;
}
.product-price:first-of-type{
    color: var(--carribean-green);
}
.product-img img{
    transition: transform 0.6s ease;
}
.product:hover .product-img img{
    transform: scale(1.1);
}
.product:hover .product-img{
    background: var(--carribean-blue);
}
.product:hover .product-btns{
    opacity: 1;
}
.off-info .sm-title{
    background: var(--carribean-blue);
    color: white;
    display: inline-block;
    padding: 0.5rem;
    position: absolute;
    top: 0;
    left: 0;
    writing-mode: vertical-lr;
    transform: rotate(180deg);
    z-index: 1;
    letter-spacing: 3px;
    cursor: pointer;
}

/* Media Queries */
@media screen and (min-width: 992px){
    .product-items{
        display: grid;
        grid-template-columns: repeat(2, 1fr);
    }
    .product-col-r-bottom{
        display: grid;
        grid-template-columns: repeat(2, 1fr);
    }
}
@media screen and (min-width: 1200px){
    .product-items{
        grid-template-columns: repeat(3, 1fr);
    }
    .product{
        margin-right: 1rem;
        margin-left: 1rem;
    }
    .products .text-light{
        width: 50%;
    }
}

@media screen and (min-width: 1336px){
    .product-items{
        grid-template-columns: repeat(4, 1fr);
    }
    .product-collection-wrapper{
        display: grid;
        grid-template-columns: repeat(2, 1fr);
    }
    .flex{
        height: 60vh;
    }
    .product-col-left{
        height: 121.5vh;
    }
}
        </style>
    </head>
        <body>
        <section id="header">
		<a href="#"><img src="LogoBlack.png" class="logo" alt=""></a>
		
		<div>
			<ul id="navbar">
				<li><a href="userhomepage.jsp">Home</a></li>
				<li><a href="profilePage.jsp">My Profile</a></li>
				<li><a  href="PostItem.jsp">Post Item</a></li>
				<li><a href="listofuser.jsp">User List</a></li>
				<li><a class="active" href="myItem.jsp">My Item</a></li>
				<li><form action='LogoutServlet' method='post' class="log-btn"><input type='submit' value='Logout' ></form></li>
				<li><a href="index.html"><i class="fa fa-bag-shopping" aria-hidden="true"></i></a></li>
			</ul>
		</div>
	</section>

        <div class = "products">
            <div class = "container">
                <h1 class = "lg-title">My Items</h1>
                <p class = "text-light">“Always give without remembering and always receive without forgetting."</p>

                <div class = "product-items">
    <%! String base64Image = "";
    	String itemname,date,type;
    	int qty;
    	int itemid;
    	
    %>
    <%
    
    String username = null;
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
            stmt = con.prepareStatement("SELECT * FROM ITEM WHERE username = '"+username+"' ORDER BY ISAVAILABLE DESC");
         
            rs = stmt.executeQuery();

            while (rs.next()) {
                // Get the image data
                byte[] imageData = rs.getBytes("IMAGES");
                itemname = rs.getString("ITEMNAME");
                date = rs.getString("ITEM_EXP");
                type = rs.getString("ITEM_TYPE");
                qty = rs.getInt("ITEM_TOTAL");
                itemid = rs.getInt("ITEMID");
                int isAvailable = rs.getInt("ISAVAILABLE");
                base64Image = Base64.getEncoder().encodeToString(imageData);
                

               %>
    <div class = "product">
                        <div class = "product-content">
                            <div class = "product-img">
                                <img src = "data:image/jpeg;base64,<%= base64Image %>" alt = "product image">
                               
                            </div>
                            <div class = "product-btns">
                            <form action="UpdateItem.jsp" method="post">
                            <input type='hidden' name='itemid' value='<%=  itemid %>'>
                                 <input type = "submit" value='UPDATE' class = "btn-cart">
                                    <span><i class = "fas fa-plus"></i></span>
                                </form>
                                 <form action="DeleteItem.java" method="post">
                                <button type = "button" class = "btn-buy"> Delete
                                    <span><i class = "fa fa-trash"></i></span>
                                </button>
                            </div>
                        </div>

                        <div class = "product-info">
                            <div class = "product-info-top">
                            
                                <h2 class = "sm-title">Product Type : <%= type %></h2>
                            </div>
                            <a href = "#" class = "product-name"><%= itemname %></a>
                            <p class = "product-price">Expired Date: <%= date %></p>
                            <p class = "product-price">Quantity: <%= qty %></p><br>
                             <a><strong><% if (isAvailable == 0){ %>ITEM DONATED<% } %></strong></a><br>
                        </div>
                    </div>

       																	
        <% 
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

                    <!-- single product -->
                    
                    <!-- end of single product -->
                  
                </div>
            </div>
        </div> 
      </div>
    </body>
</html>
