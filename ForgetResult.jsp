<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ page import="com.dao.RegistrationDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.bean.EmployeeBean" %>
<%@ page import="java.util.Iterator" %> 
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body bgcolor=#ECF1EF>
<img src="Moody's Log 2.jpg" width="1400" height="70">
<%
					
ArrayList<EmployeeBean> employeeList = (ArrayList<EmployeeBean>)session.getAttribute("details");   
		%>
<form name="form" action="./EmployeeServlet" method="post">
<input type="hidden" name="employee" value="password"/>
<table align="center" >

<%
	if( employeeList!=null )
	{  
	    Iterator<EmployeeBean> iteResult=employeeList.iterator(); 
	    
		while( iteResult.hasNext() )
		{
		
			EmployeeBean employeeBean = (EmployeeBean)iteResult.next();
			
%>
			
			<tr><td><b>Employee Id :</b></td><td><input type=text name="empid" value="<%=employeeList.get(0)%>" readonly/></td></tr>
			<tr><td><b>Security Question :</b></td><td><input type=text name="empid" value="<%=employeeBean.getQ%>" readonly/></td></tr>
			 <tr><td><b>Answer:</b></td><td><input type="text" name="ans" /></td></tr>
			
			  <tr><td><input type="submit" name="submit" value="Submit"/></td><td><input type="reset" name="reset" value="Reset"/></td></tr>
			 
			
	   <%}%>
   <%} %>
</table>

</form>


</body>
</html>