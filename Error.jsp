<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Error page</title>
<SCRIPT type="text/javascript">
    window.history.forward();
    function noBack() { window.history.forward(); }
</SCRIPT>
</head>
<body bgcolor=#ECF1EF onload="noBack();"
    onpageshow="if (event.persisted) noBack();">
<img src="Moody's Log 2.jpg" width="1400" height="70">
<h3 align="center" style="background-color:red;">Please Enter Valid Details</h3>
<center><a href="./ForgotPassword.jsp">Try Again</a></center>
</body>
</html>