<%@ page import="java.io.*,java.sql.*,java.util.Base64" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Update Item</title>
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
    top: 58%;
    left: 50%;
    transform: translate(-50%,-50%);
    width: 950px;
    display: flex;
    box-shadow: 0 1px 20px 0 rgba(69,90,100,.08);
    }
    
    .log-btn{
		margin: 0;
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
    
  
    </style>
</head>

<%
String base64Image = "";
int itemid = Integer.parseInt(request.getParameter("itemid"));
  //Jika sudah siap session guna yang ini
  //String username = request.getParameter("username");

	


  Connection conn = null;
  PreparedStatement stmt = null;
  ResultSet rs = null;
  String name = null;
  String exp = null;
  String total = null;
  String type = null;
    
  try {
      // Load the JDBC driver
      Class.forName("com.mysql.jdbc.Driver");
      // Open a connection to the database
      conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/foodwaste", "root", "Nazone12"); 
      // Execute a SELECT statement to retrieve the user's profile information
      stmt = conn.prepareStatement("SELECT IMAGES,ITEMNAME, ITEM_EXP, ITEM_TOTAL, ITEM_TYPE FROM item WHERE ITEMID = '"+itemid+"'");
    
      rs = stmt.executeQuery();
		
      // Extract the user's profile information from the result set
      if (rs.next()) {
    	
        name = rs.getString("ITEMNAME");
        exp = rs.getString("ITEM_EXP");
        total = rs.getString("ITEM_TOTAL");
        type = rs.getString("ITEM_TYPE");}
        byte[] imageData = rs.getBytes("IMAGES");
        base64Image = Base64.getEncoder().encodeToString(imageData);
      
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
				<li><a href="profilePage.jsp">My Profile</a></li>
				<li><a  href="PostItem.jsp">Post Item</a></li>
				<li><a href="listofuser.jsp">User List</a></li>
				<li><a class="active" href="myItem.jsp">My Item</a></li>
				<li><form action='LogoutServlet' method='post' class="log-btn"><input type='submit' value='Logout' ></form></li>
				<li><a href="index.html"><i class="fa fa-bag-shopping" aria-hidden="true"></i></a></li>
			</ul>
		</div>
	</section>
    

<div class="wrapper">
    <div class="left">
    
        <img src="data:image/jpeg;base64,<%= base64Image %>" 
        alt="user" width="290">
        <h4 style="text-align:center;">Choose Image <input type="file" id="avatar" name="avatar"
             accept="image/png, image/jpeg"></h4>

    </div>
    <div class="right">
        <div class="info">
        <form action ='UpdateItem' method='post'>
            <h3> Item Information</h3>
            <div class="info_data">
                 <div class="data">
                 <input type='hidden' name='id' value='<%= itemid %>'>
                    <h4>Item Name : <input type="text" id="name" value="<%=name%>" name="name"  ></h4><br><br>
                    <h4>Quantity    : <input type="text" id="quantity" value="<%=total%>" name="quantity"></h4><br><br>
                    <h4>Item Type : <input type="text" id="type" value="<%=type%>" name="type"></h4><br><br>
                 </div>
               
              <div class="data">
                <h4> Expired Date : <input type="date" id="date"  value="<%=exp%>" name="date"></h4>

          </div>
         
      
            </div>
        
      
         <div class="button">
          <input type="submit" name="submit" value="Update">
              </form>
          </div>
          
        </div>
      
     
    </div>
</div>

</body>
</html>



