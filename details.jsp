<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <%@page import="com.bean.EmployeeBean"  %>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body bgcolor=#ECF1EF>
	<jsp:include page="header.jsp"></jsp:include> 
		<%
 			EmployeeBean employeeBean=(EmployeeBean)request.getAttribute("list");
 		%>
		
		
		<form  >
<table align="center" >
	
	<br /> <br /> <br />
	<tr>
		<td> Name </td>
		<td> <input type="text" name="userName" value="<%=employeeBean.getUserName()%>" readonly="readonly"> </td>
	</tr>
	
	<tr>
		<td> Emp Id </td>
		<td> <input type="text" name="empId" value="<%=employeeBean.getEmpId()%>" readonly="readonly"> </td>
	</tr>
	
	
	<tr>
		<td> Moody's Id </td>
		<td> <input type="text" name="moodyId" value="<%=employeeBean.getMoodyId()%>" readonly="readonly"> </td>
	</tr>
	
	<tr>
		<td> Designation </td>
		<td> <input type="text" name="designation" value="<%=employeeBean.getDesignation()%>" readonly="readonly"> </td>
	</tr>
	
	<tr>
		<td> TCS Email </td>
		<td> <input type="text" name="tcsEmail" value="<%=employeeBean.getTcsEmail()%>" readonly="readonly"> </td>
	</tr>
	
	<tr>
		<td> Moody's Email </td>
		<td> <input type="text" name="moodyEmail" value="<%=employeeBean.getMoodyEmail()%>" readonly="readonly"> </td>
	</tr>
	
	<tr>
		<td> MobileNumber </td>
		<td> <input type="text" name="mobileNumber" value="<%=employeeBean.getMobileNumber()%>" readonly="readonly"> </td>
	</tr>
	
 </table>
 	<p align="center"><input type=button value="Back" onClick="window.location.href='Home.jsp'"></p>
</form>
</body>
</html>