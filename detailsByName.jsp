<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<link rel="stylesheet" type="text/css" href="./css/button.css" />
<link rel="stylesheet" type="text/css" href="./css/table.css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home Page</title>
<%@ page import="com.dao.RegistrationDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.bean.EmployeeBean" %>
<%@ page import="java.util.Iterator" %> 

</head>
<body bgcolor=#ECF1EF>
<jsp:include page="header.jsp"></jsp:include>
<div class="FixedHeightContainer">
    <div class="Content">
    <div style="height:50;border-width:1;">
<br />
</div>
<div  style="height:550">
		
		<%
					
					   ArrayList<EmployeeBean> employeeList = (ArrayList<EmployeeBean>)request.getAttribute("list");   
		%>	
<h2 align=center><font color=3300CC>TCS Employee Details</font></h2>
<table border="1" align="center"  class="hovertable">
	<tr  >
	<th> Empid </th>
	<th> MoodyId </th>
	<th> Name </th>
	<th> Designation </th>
	<th> Mobile No </th>
	<th> TcsEmail </th>
	<th> MoodyEmail </th>
	
</tr>
<%
	if( employeeList!=null )
	{  
	    Iterator<EmployeeBean> iteResult=employeeList.iterator(); 
	    
		while( iteResult.hasNext() )
		{
		
			EmployeeBean employeeBean = (EmployeeBean)iteResult.next();
			
%>
			
			<tr onmouseover="this.style.backgroundColor='99CCFF';" onmouseout="this.style.backgroundColor='#d4e3e5';">
			 <td><b><a href="EmployeeRegister.jsp?value=<%=employeeBean.getEmpId()%>"><%=employeeBean.getEmpId()%></a></b></td>
			 <td><b><%=employeeBean.getMoodyId()%></b></td>
			 <td><b>  <%=employeeBean.getUserName()%> </b></td>
			 <td><b><%=employeeBean.getDesignation()%></b></td>
			 <td><b><%=employeeBean.getMobileNumber()%></b></td>
			 <td><b><%=employeeBean.getTcsEmail()%></b></td>
			 <td><b><%=employeeBean.getMoodyEmail()%></b></td>
			</tr>
	   <%}%>
   <%} %>
</table> <br />
<center>

     <input type=button class="button_example" value="Back" onClick="window.location.href='Home.jsp'">  
</center>
		</div>
	  </div>
	</div>
	
</body>
</html>