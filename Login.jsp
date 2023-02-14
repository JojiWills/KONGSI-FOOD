<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "<a class="vglnk"
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>Login Page</title>
  <link href="https://fonts.googleapis.com/css?family=Assistant:400,700" rel="stylesheet">
  <link rel="stylesheet" href="style.css">

<style>
body {

   background: 
    linear-gradient(to right, #136a8a,#00E5FF );
  font-family: Assistant, sans-serif;
  min-height: 90vh;
}
.login {
  color: white;
  background: background: #136a8a;
  background: 
    -webkit-linear-gradient(to right, #267871, #136a8a);
  background: 
    linear-gradient(to right, #267871, #136a8a);
  margin:70px 20%;
  box-shadow: 
    0px 2px 10px rgba(0,0,0,0.2), 
    0px 10px 20px rgba(0,0,0,0.3), 
    0px 30px 60px 1px rgba(0,0,0,0.5);
  border-radius: 8px;
  padding: 50px;
}
.login .head {
  display: flex;
  align-items: center;
  justify-content: center;
}
.login .head .company {
  font-size: 2.2em;
}
.login .msg {
  text-align: center;
}
.login .form input[type=text].text {
  border: none;
  background: none;
  box-shadow: 0px 2px 0px 0px white;
  width: 100%;
  color: white;
  font-size: 1em;
  outline: none;
}
.login .form .text::placeholder {
  color: #D3D3D3;
}
.login .form input[type=password].password {
  border: none;
  background: none;
  box-shadow: 0px 2px 0px 0px white;
  width: 100%;
  color: white;
  font-size: 1em;
  outline: none;
  margin-bottom: 20px;
  margin-top: 20px;
}
.login .form .password::placeholder {
  color: #D3D3D3;
}
.login .form .btn-login {
  background: none;
  text-decoration: none;
  color: white;
  box-shadow: 0px 0px 0px 2px white;
  border-radius: 3px;
  padding: 5px 2em;
  transition: 0.5s;
}
.login .form .btn-login:hover {
  background: white;
  color: dimgray;
  transition: 0.5s;
}
.login .forgot {
  text-decoration: none;
  color: white;
  float: right;
}
.login .register {
  text-decoration: none;
  color: white;
  float: right;
}


</style>
</head>
<body>
<section id="header">
		<a href="#"><img src="LogoBlack.png" class="logo" alt=""></a>
		
		<div>
			<ul id="navbar">
				<li><a href="index.jsp">Home</a></li>
				<li><a class="active" href="Login.jsp">Login/Register</a></li>
				<li><a href="myItem.jsp"><i class="fa fa-bag-shopping" aria-hidden="true"></i></a></li>
			</ul>
		</div>
	</section>
<!-- partial:index.partial.html -->
<section class='login' id='login'>
  <div class='head'>
  <h1 class='company'>FOOD WASTE MANAGEMENT</h1>
  </div>
  <p class='msg'>Welcome!</p>
  <div class='form'>
    <form action="LoginServlet" method="post">
  <input type="text" placeholder='Username' class='text' name='user' required><br>
  <input type="password" placeholder='••••••••••••••' class='password' name='pwd'><br>
  <lable>Select user type:</lable>
  <select name="type" id="type" >
				  <option value="user">user</option>
				  <option value="admin">admin</option></select><br>
  <input type="submit" name="submit" value="Login" class='btn-login' id='do-login'>
  <a href="#" class='forgot'>Forgot password?</a></br>
  <br></br>
  <a href="Register.jsp" class='register'>Register Account</a>
    </form>
  </div>
</section>
<footer>
  </footer>
<!-- partial -->
  <script  src="./script.js"></script>

</body>
</html>