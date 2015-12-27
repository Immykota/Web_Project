<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%! public String password;%>
<% password=(String) request.getAttribute("list");%>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>password result</title>
</head>
<body bgcolor=#ECF1EF onload='alert("password is: <%=password%>")'>
<img src="Moody's Log 2.jpg" width="1400" height="70">
<form name="f1">

<h3 align="center">Please CLICK HERE to<a href="./Login.jsp"><b> Login</b></a> </h3>



</form>


</body>
</html>