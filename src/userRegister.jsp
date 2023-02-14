<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "<a class="vglnk"
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>Register Page</title>
  <link href="https://fonts.googleapis.com/css?family=Assistant:400,700" rel="stylesheet"><link rel="stylesheet" href="./style.css">

<style>

body {

   background: 
    linear-gradient(to right, #136a8a,#00E5FF );
  font-family: Assistant, sans-serif;
  display: flex;
  min-height: 90vh;
}
.login {
  color: white;
  background: background: #136a8a;
  background: 
    -webkit-linear-gradient(to right, #267871, #136a8a);
  background: 
    linear-gradient(to right, #267871, #136a8a);
  margin: auto;
  box-shadow: 
    0px 2px 10px rgba(0,0,0,0.2), 
    0px 10px 20px rgba(0,0,0,0.3), 
    0px 30px 60px 1px rgba(0,0,0,0.5);
  border-radius: 8px;
  padding: 20px;
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
  outline: none;
  margin-bottom: 20px;
  margin-top: 20px;
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
.login .form .btn-register {
  background: none;
  text-decoration: none;
  color: white;
  box-shadow: 0px 0px 0px 2px white;
  border-radius: 3px;
  padding: 5px 2em;
  transition: 0.5s;
}
.login .form .btn-register:hover {
  background: white;
  color: dimgray;
  transition: 0.5s;
}
.login .log {
  text-decoration: none;
  color: white;
  float: right;
}


</style>
</head>
<body>
<!-- partial:index.partial.html -->
<form action="registeruser" method="post">
<section class='login' id='login'>
  <div class='head'>
  <h1 class='company'>FOOD WASTE MANAGEMENT</h1>
  </div>
  <p class='msg'>Registration</p>
  <div class='form'>
  <input type="text" placeholder='Email' class='text' name='Email' required><br>
  <input type="text" placeholder='Name' class='text' name='Name' required><br>
  <input type="text" placeholder='Phone' class='text' name='Phone' required><br>
  <input type="text" placeholder='Address' class='text' name='Address' required><br>
  <input type="text" placeholder='Username' class='text' name='Username' required><br>
  <input type="password" placeholder='••••••••••••••' class='password' name='Password'><br>
  <input type="submit" name='submit' value="Register" class='btn-register' id='do-register'>
  <a href="#" class='log'>Login Here</a></br>
  <br></br>
 
    </form>
  </div>
</section>
<footer>
  </footer>
<!-- partial -->
  <script  src="./script.js"></script>

</body>
</html>