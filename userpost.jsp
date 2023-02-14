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
<body>
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
		<h2>Item Information</h2>
		<hr class="line">
		<div class="pro-container">
			<form action="#" method="post" enctype="multipart/form-data">
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
				<input id="default-btn" type="file" accept="image/*" hidden>
				<button onchange="defaultBtnActive()" id="custom-btn">Choose a file</button>
			</div>
			<div class="row">
				<div class="column">
					<label for="name">Item Name</label>
					<input type="text" id="name" placeholder="Your item name here">
					
				</div>
				<div class="column">
					<label for="type">Item Type</label>

					<select name="type" id="type">
					  <option value="food">Food</option>
					  <option value="electronic">Electronic</option>
					</select>
				</div>
			</div>
			<div class="row">
				<div class="column">
					<label for="expdate">Expiration Date</label>
					<input type="date" id="expdate" placeholder="dd/mm/yyyy">
					
				</div>
				<div class="column">
					<label for="quantity">Quantity</label>
					<input type="text" id="quantity" placeholder="0">
					
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