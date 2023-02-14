<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<meta charset="ISO-8859-1">
<title>Homepage</title>
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
<body>
<h3>Hi <%=userName %>, Login successful.</h3>

<form action="LogoutServlet" method="post">
<input type="submit" value="Logout">
</form>

</body>
</html>