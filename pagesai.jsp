<%@ page language="java" contentType="text/html; charset=ISO-8859-1" %> 
<%@ page import="java.sql.PreparedStatement" %> 
<%@ page import="java.sql.ResultSet" %> 
<%@ page import="java.sql.Connection" %> 
<%@ page import="com.dao.RegistrationDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.bean.EmployeeBean" %>
<%@ page import="java.util.Iterator" %> 
<%@ page import="java.sql.DriverManager" %> 
<%! 
public int nullIntconv(String str) 
{ 
int conv=0; 
if(str==null) 
{ 
str="0"; 
} 
else if((str.trim()).equals("null")) 
{ 
str="0"; 
} 
else if(str.equals("")) 
{ 
str="0"; 
} 
try{ 
conv=Integer.parseInt(str); 
} 
catch(Exception e) 
{ 
} 
return conv; 
} 
%> 
<% 



Connection conn = null; 
Class.forName("com.mysql.jdbc.Driver").newInstance(); 
conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/moodys","root", ""); 

ResultSet rsPagination = null; 
ResultSet rsRowCnt = null; 

PreparedStatement psPagination=null; 
PreparedStatement psRowCnt=null; 

int iShowRows=5; // Number of records show on per page 
int iTotalSearchRecords=10; // Number of pages index shown 

int iTotalRows=nullIntconv(request.getParameter("iTotalRows")); 
int iTotalPages=nullIntconv(request.getParameter("iTotalPages")); 
int iPageNo=nullIntconv(request.getParameter("iPageNo")); 
int cPageNo=nullIntconv(request.getParameter("cPageNo")); 

int iStartResultNo=0; 
int iEndResultNo=0; 

if(iPageNo==0) 
{ 
iPageNo=0; 
} 
else{ 
iPageNo=Math.abs((iPageNo-1)*iShowRows); 
} 



String sqlPagination="SELECT SQL_CALC_FOUND_ROWS * FROM employee limit "+iPageNo+","+iShowRows+""; 

psPagination=conn.prepareStatement(sqlPagination); 
rsPagination=psPagination.executeQuery(); 

//// this will count total number of rows 
String sqlRowCnt="SELECT FOUND_ROWS() as cnt"; 
psRowCnt=conn.prepareStatement(sqlRowCnt); 
rsRowCnt=psRowCnt.executeQuery(); 

if(rsRowCnt.next()) 
{ 
iTotalRows=rsRowCnt.getInt("cnt"); 
} 
%> 
<html> 
<head> 
<title>Pagination of JSP page</title> 

</head> 
<body> 
<form name="frm"> 
<input type="hidden" name="iPageNo" value="<%=iPageNo%>"> 
<input type="hidden" name="cPageNo" value="<%=cPageNo%>"> 
<input type="hidden" name="iShowRows" value="<%=iShowRows%>"> 
<%
					ArrayList<EmployeeBean> employeeList = new ArrayList<EmployeeBean>();   
						RegistrationDao rdTcs= new RegistrationDao();
						employeeList=rdTcs.displayEmployees();
						session.setAttribute("EmployeesList",employeeList);
		%>
<h4 align=center><font color=3300CC>TCS Employee Details</font></h4>
<table border="0" align="center" style="width:1000px;">
	<tr >
	<th><u>Emp Id</u></th>
	<th><u>Moody's Id</u></th>
	<th><u>Name</u></th>
	<th><u>Designation</u></th>
	<th><u>Mobile No</u></th>
	<th><u>Email Id</u></th>
	
</tr>
<%
	if( employeeList!=null )
	{  
		while( rsPagination.next())
		{		
%>
			<tr>
			 <td align="center"><a href="Modify.jsp?value=<%=rsPagination.getString("empId")%>"><%=rsPagination.getString("empId")%></a></td>
			 <td align="center"><%=rsPagination.getString("moodyId")%></td>
			 <td align="center"><%=rsPagination.getString("username")%></td>
			 <td align="center"><%=rsPagination.getString("designation")%></td>
			 <td align="center"><%=rsPagination.getString("mobileNumber")%></td>
			 <td align="center"><%=rsPagination.getString("moodyEmail")%></td>
			 </tr>
	   <%}%>
   <%} %>
<% 
//// calculate next record start record and end record 
try{ 
if(iTotalRows<(iPageNo+iShowRows)) 
{ 
iEndResultNo=iTotalRows; 
} 
else 
{ 
iEndResultNo=(iPageNo+iShowRows); 
} 

iStartResultNo=(iPageNo+1); 
iTotalPages=((int)(Math.ceil((double)iTotalRows/iShowRows))); 

} 
catch(Exception e) 
{ 
e.printStackTrace(); 
} 

%> 
<tr> 
<td colspan="3"> 
<div> 
<% 
//// index of pages 

int i=0; 
int cPage=0; 
if(iTotalRows!=0) 
{ 
cPage=((int)(Math.ceil((double)iEndResultNo/(iTotalSearchRecords*iShowRows)))); 

int prePageNo=(cPage*iTotalSearchRecords)-((iTotalSearchRecords-1)+iTotalSearchRecords); 
if((cPage*iTotalSearchRecords)-(iTotalSearchRecords)>0) 
{ 
%> 
<a href="pagesai.jsp?iPageNo=<%=prePageNo%>&cPageNo=<%=prePageNo%>"> << Previous</a> 
<% 
} 

for(i=((cPage*iTotalSearchRecords)-(iTotalSearchRecords-1));i<=(cPage*iTotalSearchRecords);i++) 
{ 
if(i==((iPageNo/iShowRows)+1)) 
{ 
%> 
<a href="pagesai.jsp?iPageNo=<%=i%>" style="cursor:pointer;color: red"><b><%=i%></b></a> 
<% 
} 
else if(i<=iTotalPages) 
{ 
%> 
<a href="pagesai.jsp?iPageNo=<%=i%>"><%=i%></a> 
<% 
} 
} 
if(iTotalPages>iTotalSearchRecords && i<iTotalPages) 
{ 
%> 
<a href="pagesai.jsp?iPageNo=<%=i%>&cPageNo=<%=i%>"> >> Next</a> 
<% 
} 
} 
%> 
<b>Rows <%=iStartResultNo%> - <%=iEndResultNo%> Total Result <%=iTotalRows%> </b>
</div> 
</td> 
</tr> 
</table> 
</form> 
</body> 
</html> 
