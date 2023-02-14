<%@ page import="java.io.*,java.sql.*,java.util.Base64" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>CSS User Profile Card</title>
	<link rel="stylesheet" href="style.css">
	<script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
    <style>
        @import url('https://fonts.googleapis.com/css?family=Josefin+Sans&display=swap');

    *{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    list-style: none;
    }

    body{
    background-color: #f3f3f3;
    }

    .wrapper{
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%,-50%);
    width: 950px;
    display: flex;
    box-shadow: 0 1px 20px 0 rgba(69,90,100,.08);
    }

    .wrapper .left{
    width: 35%;
    background: linear-gradient(to right,#01a9ac,#01dbdf);
    padding: 30px 25px;
    border-top-left-radius: 5px;
    border-bottom-left-radius: 5px;
    text-align: center;
    color: #fff;
    }

    .wrapper .left img{
    border-radius: 10px;
    margin-bottom: 40px;
    }

    .wrapper .left h4{
    margin-bottom: 10px;
    }

    .wrapper .left p{
    font-size: 12px;
    }

    .wrapper .right{
    width: 65%;
    background: #fff;
    padding: 30px 25px;
    border-top-right-radius: 5px;
    border-bottom-right-radius: 5px;
    }

    .wrapper .right .info,
    .wrapper .right .projects{
    margin-bottom: 25px;
    }

    .wrapper .right .info h3,
    .wrapper .right .projects h3{
        margin-bottom: 15px;
        padding-bottom: 5px;
        border-bottom: 1px solid #e0e0e0;
        color: #353c4e;
    text-transform: uppercase;
    letter-spacing: 5px;
    }

    .wrapper .right .info_data,
    .wrapper .right .projects_data{
    display: flex;
    justify-content: space-between;
    }

    .wrapper .right .info_data .data,
    .wrapper .right .projects_data .data{
    width: 45%;
    }

    .wrapper .right .info_data .data h4,
    .wrapper .right .projects_data .data h4{
        color: #353c4e;
        margin-bottom: 5px;
        font-size: 18px;
    }

    .wrapper .right .info_data .data p,
    .wrapper .right .projects_data .data input{
    font-size: 20px;
    margin-bottom: 10px;
    color: #919aa3;
    }


    .button-29 {
    align-items: center;
    appearance: none;
    background-image: radial-gradient(100% 100% at 100% 0, #00e5ff,  #5adaff 0  100%);
    border: 0;
    border-radius: 6px;
    box-shadow: rgba(45, 35, 66, .4) 0 2px 4px,rgba(45, 35, 66, .3) 0 7px 13px -3px,rgba(58, 65, 111, .5) 0 -3px 0 inset;
    box-sizing: border-box;
    color: #fff;
    cursor: pointer;
    display: inline-flex;
    font-family: "JetBrains Mono",monospace;
    height: 48px;
    justify-content: center;
    line-height: 1;
    list-style: none;
    overflow: hidden;
    padding-left: 16px;
    padding-right: 16px;
    position: relative;
    text-align: left;
    text-decoration: none;
    transition: box-shadow .15s,transform .15s;
    user-select: none;
    -webkit-user-select: none;
    touch-action: manipulation;
    white-space: nowrap;
    will-change: box-shadow,transform;
    font-size: 18px;
    }

    .button-29:focus {
    box-shadow: #3c4fe0 0 0 0 1.5px inset, rgba(45, 35, 66, .4) 0 2px 4px, rgba(45, 35, 66, .3) 0 7px 13px -3px, #3c4fe0 0 -3px 0 inset;
    }

    .button-29:hover {
    box-shadow: rgba(45, 35, 66, .4) 0 4px 8px, rgba(45, 35, 66, .3) 0 7px 13px -3px, #3c4fe0 0 -3px 0 inset;
    transform: translateY(-2px);
    }

    .button-29:active {
    box-shadow: #3c4fe0 0 3px 7px inset;
    transform: translateY(2px);
    }

    .lg-title,
    .md-title,
    .sm-title{
    font-family: 'Roboto', sans-serif;
    padding: 0.6rem 0;
    text-transform: capitalize;
    text-align: center;
    text-shadow: #00e5ff;
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

    


    <%! String base64Image = "";%>
    <%
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        int itemid = Integer.parseInt(request.getParameter("itemid"));
        try {
            // Load the JDBC driver
            Class.forName("com.mysql.jdbc.Driver");

            // Connect to the database
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/foodwaste", "root", "Nazone12"); 

            // Retrieve the image data from the database
            stmt = con.prepareStatement("SELECT * FROM ITEM WHERE ITEMID='"+itemid+"'");
         
            rs = stmt.executeQuery();

           if(rs.next()) {
                // Get the image data
                byte[] imageData = rs.getBytes("IMAGES");
                String itemname = rs.getString("ITEMNAME");
                String date = rs.getString("ITEM_EXP");
                String type = rs.getString("ITEM_TYPE");
                int qty = rs.getInt("ITEM_TOTAL");
             
                String username = rs.getString("username");
                base64Image = Base64.getEncoder().encodeToString(imageData);

                // Set the content type to "image/jpeg" or "image/png"
                response.setContentType("image/jpeg");
                response.setContentType("text/html");
               
               
       			
                out.println("<div class='wrapper'>");
                out.println("<div class='left'>");
                out.println("<img src='data:image/jpeg;base64," + base64Image + "' alt='Image from Database'"); 
                out.println("width='290'/>");
                out.println("<h4 style='text-align:center;'>POSTED BY : "+username+" </h4>");

                out.println("</div>");
                out.println("<div class='right'>");
                out.println("<div class='info'>");
       			out.println("<h3> Item Information</h3>");
       			out.println("<div class='info_data'>");
       			out.println("<div class='data'>");
       			out.println("<h4>Item Name :"+itemname+" </h4><br><br>");
       		    out.println("<h4>Quantity    :"+qty+" </h4><br><br>");
       			out.println("<h4>Item Type : "+type+"</h4><br><br>");
       			out.println("</div>");
                   
       			out.println("<div class='data'>");
       			out.println("<h4> Expired Date : "+date+"</h4>");

       			out.println("</div>");
              
       			out.println("</div>");
       			out.println("</div>");
          
       			out.println("<form action='Receive' method='post'> <input type='hidden' name='d' value='"+itemid+"'> <input type='submit' value='receive'> </form>");
       			out.println("</div>");
       			out.println("</div>");
       			out.println("<div class ='button'>");
       			
       			out.println("</div>");
       			
       																								
       																					
               
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
</div>

</body>
</html>



