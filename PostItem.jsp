<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<%
String userName = null;
Cookie[] cookies = request.getCookies();
if(cookies !=null){
for(Cookie cookie : cookies){
	if(cookie.getName().equals("user")) userName = cookie.getValue();
}}
if(userName == null)response.sendRedirect("login.jsp");
%>
<style>
	.log-btn{
		margin: 0;
	}
</style>
<body>
	<section id="header">
		<a href="#"><img src="LogoBlack.png" class="logo" alt=""></a>
		
		<div>
			<ul id="navbar">
				<li><a href="userhomepage.jsp">Home</a></li>
				<li><a href="profilePage.jsp">My Profile</a></li>
				<li><a class="active" href="PostItem.jsp">Post Item</a></li>
				<li><a href="listofuser.jsp">User List</a></li>
				<li><a href="myItem.jsp">My Item</a></li>
				<li><form action='LogoutServlet' method='post' class="log-btn"><input type='submit' value='Logout' ></form></li>
				<li><a href="index.html"><i class="fa fa-bag-shopping" aria-hidden="true"></i></a></li>
			</ul>
		</div>
	</section>
	<section id="form1" class="section-p2">
		<h2>Item Information</h2>
		<hr class="line">
		<div class="pro-container">
			<form action="postitem" method="post" enctype="multipart/form-data">
			<div class="img-container">
				<div class="wrapper">
					<div class="image">
						<img src="#" alt="" id="image">
					</div>
					<div class="content">
						<div class="icon"><i class="fa fa-cloud-upload-alt"></i></div>
						<div class="text">No image chosen, yet!</div>
					</div>
					<div id="cancel-btn"><i class="fa fa-times"></i></div>
				</div>
				<input id="default-btn" type="file"  name="image">
			
			</div>
			<div class="row">
				<div class="column">
					<label for="name">Item Name</label>
					<input type="text" name="name" placeholder="Your item name here">
				<input type="hidden" name="username" value="<%= userName %>">	
				</div>
				<div class="column">
					<label for="type">Item Type</label>

					<select name="type" id="type">
					  <option value="food">Food</option>
					  <option value="beverages">Beverages</option>
					</select>
				</div>
			</div>
			<div class="row">
				<div class="column">
					<label for="expdate">Expiration Date</label>
					<input type="date" name="item_exp" placeholder="dd/mm/yyyy">
					
				</div>
				<div class="column">
					<label for="quantity">Quantity</label>
					<input type="text" name="quantity" placeholder="0">
					
				</div>
			</div>
			<div class="row">
				<div class="column">
					<input type="submit" value="Submit">
				</div>
			</div>
			</form>
		</div>
		
		
		
	</section>
	
	<script>
		var wrapper = document.querySelector(".wrapper");
		var defaultBtn = document.getElementById("default-btn");
		var cancelBtn = document.querySelector("#cancel-btn");
		var customBtn = document.getElementById("custom-btn");
		var img = document.getElementById("image");
		
		/*function defaultBtnActive(){
			defaultBtn.click();
		}*/
		
		defaultBtn.addEventListener("change", function(){
			var file = this.files[0];
			if(file && file.type.match("image/*")){
				var reader = new FileReader();
				reader.onload = function(event){
					var result = reader.result;
					img.src = event.target.result;
					wrapper.classList.add("active");
				}
				cancelBtn.addEventListener("click", function(){
					document.getElementById("image").src = "";
				});
				reader.readAsDataURL(file);
			}else {
				document.getElementById("image").src = "#";
			    }
		});
	</script>
</body>
</html>