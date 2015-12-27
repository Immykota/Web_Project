<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<link rel="stylesheet" type="text/css" href="./css/button.css" />
<script type="text/javascript" >
function formValidation()
{	
	var check=0;
	var opt=document.search.searchby;
	
		if(validateSearch(opt))
		{
		  check=1;
	    }
      else
  	  {
			check=0;
			return false;
  	  }
  	  if(check==0)
  	  {
		return false;
      }
      else
      {
    	 
		document.search.action="EmployeeServlet";
		document.search.method="post";
		document.search.submit();
      }
	function validateSearch(opt)
	{
		if(opt.value == "Default")
		{
		alert('Select Search By Option From The List');
		opt.focus();
		return false;
		}
		else
		{
		
		return true;
	    }
	}

}
</script>
<link rel="stylesheet" type="text/css" href="./css/button.css" />
<link rel="stylesheet" type="text/css" href="./css/table.css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home Page</title>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" %> 
<%@ page import="java.sql.*" %> 
<%@ page import="com.dao.RegistrationDao" %>
<%@ page import="java.util.*" %>
<%@ page import="com.bean.EmployeeBean" %>
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
<style type="text/css">
table { border:1px solid #000;}
</style>

<% 
Connection conn = null; 
Class.forName("com.mysql.jdbc.Driver").newInstance(); 
conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/moodys","root", ""); 

ResultSet rsPagination = null; 
ResultSet rsRowCnt = null; 

PreparedStatement psPagination=null; 
PreparedStatement psRowCnt=null; 

int iShowRows=20; // Number of records show on per page 
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
String sqlPagination="SELECT SQL_CALC_FOUND_ROWS * ,(Select value from ref_data where ref_data.id=empdata.designation and ref_data.category = 'designation')as 'desig',(Select value from ref_data where ref_data.id=empdata.groupname and ref_data.category = 'group')as 'grp' FROM empdata limit "+iPageNo+","+iShowRows+""; 
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

</head>
<body bgcolor=#ECF1EF>
<%
ArrayList<EmployeeBean> employeeList2 = (ArrayList<EmployeeBean>)request.getAttribute("list");  
if( employeeList2!=null )
{
 		%>
 		
 
 <jsp:include page="header.jsp"></jsp:include>
 <h4 align=center><font color=3300CCb>TCS Employee Details</font></h4>
<table border="1" align="center" style="width:1100px;" >
 <tr>
	
	<th align="left" align="right" style="width:10%;">Employee Id</th>
	<th align="left" align="right" style="width:10%;">Moody's Id</th>
	<th align="center" align="right" style="width:40%;">Associate Name</th>
	<th align="left" align="right" style="width:15%;"> Designation</th>
	<th align="left" align="right" style="width:15%;">Group</th>
	<th align="left" align="right" style="width:15%;">Contact No</th>
	
</tr>


<%
	  
	    Iterator<EmployeeBean> iteResult=employeeList2.iterator(); 
	    
		while( iteResult.hasNext() )
		{
		
			EmployeeBean employeeBean = (EmployeeBean)iteResult.next();
			
%>
	
			<tr>
			
			 <td align="left"><a href="EmployeeServlet?value=<%=employeeBean.getEmpId()%>"><%=employeeBean.getEmpId()%></a></td>
			 <td align="left"><%=employeeBean.getMoodyId()%></td>
			 <td align="left"><%=employeeBean.getUserName()%></td>
			 <td align="left"><%=employeeBean.getDesignation()%></td>
			 <td align="left"><%=employeeBean.getGroup()%></td>
			 <td align="left"><%=employeeBean.getMobileNumber()%></td>
			 </tr>
	   
   <%}} 
 		
else { %>

<img src="Moody's Log 2.jpg" width="1400" height="70">
<div class="FixedHeightContainer">
    <div class="Content">
    <div style="height:50;border-width:1;">
<br />
<form name="search" >
<pre>
<input type=text name="searchbox"  /> <select name="searchby">       
									  <option selected="" value="Default">Select </option>
									  <option value="Name">Name</option>
									  <option value="EmployeeId">Emp Id</option>
									 <option value="MoodyId">Moody's Id</option> 
									</select>  <input type=button class="button_example" name=user value="Search" onClick="return formValidation()" />								 <input type=button value="Add Emp Manually" onClick="window.location.href='EmployeeRegister.jsp'">	 <input type=button value="Import From Excel" onClick="window.location.href='Excel.jsp'">    <a href="<%=request.getContextPath() %>/Login.jsp"><big>LogOut</big></a>             
</pre>
	<input type="hidden" name="employee" value="searchemployee" />
</form>


<% 
	String error=(String)request.getAttribute("errMessage"); 
	if(error!=null)
	{      

		%><span class="blueText"><%out.print("<p align=center color= red>" +error+ "</p>"); %></span><%
	}
%>
</div>


<div  style="height:550">
<input type="hidden" name="iPageNo" value="<%=iPageNo%>"> 
<input type="hidden" name="cPageNo" value="<%=cPageNo%>"> 
<input type="hidden" name="iShowRows" value="<%=iShowRows%>">	
		<%
					ArrayList<EmployeeBean> employeeList = new ArrayList<EmployeeBean>();   
						RegistrationDao rdTcs= new RegistrationDao();
						employeeList=rdTcs.displayEmployees();
						session.setAttribute("EmployeesList",employeeList);
		%>
		<%
					  
						RegistrationDao registrationDao= new RegistrationDao();
						int employeeCount=registrationDao.countEmployees();
						session.setAttribute("count", employeeCount);
		%>
<h4 align=center><font color=3300CCb>TCS Employee Details(<%=employeeCount %>)</font></h4>
<table border="1" align="center" style="width:1100px; height:700px">
 <tr>
	
	<th align="left" align="right" style="width:10%;">Employee Id</th>
	<th align="left" align="right" style="width:10%;">Moody's Id</th>
	<th align="center" align="right" style="width:40%;">Associate Name</th>
	<th align="left" align="right" style="width:15%;"> Designation</th>
	<th align="left" align="right" style="width:15%;">Group</th>
	<th align="left" align="right" style="width:15%;">Contact No</th>
	
</tr>



<%
	if( employeeList!=null )
	{  
		while( rsPagination.next())
		{		
%>
			<tr>
			
			 <td align="left"><a href="./EmployeeServlet?value=<%=rsPagination.getString("empId")%>"><%=rsPagination.getString("empId")%></a></td>
			 <td align="left"><%=rsPagination.getString("moodyId")%></td>
			 <td align="left"><%=rsPagination.getString("name")%></td>
			 <td align="left"><%=rsPagination.getString("desig")%></td>
			 <td align="left"><%=rsPagination.getString("grp")%></td>
			 <td align="left"><%=rsPagination.getString("mobileNumber")%></td>
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
<td colspan="6" align="center"> 
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
<a href="Home.jsp?iPageNo=<%=prePageNo%>&cPageNo=<%=prePageNo%>"> << Previous</a> 
<% 
} 

for(i=((cPage*iTotalSearchRecords)-(iTotalSearchRecords-1));i<=(cPage*iTotalSearchRecords);i++) 
{ 
if(i==((iPageNo/iShowRows)+1)) 
{ 
%> 
<a href="Home.jsp?iPageNo=<%=i%>" style="cursor:pointer;color: red "><b><%=i%></b></a> 
<% 
} 
else if(i<=iTotalPages) 
{ 
%> 
<a href="Home.jsp?iPageNo=<%=i%>"><%=i%></a> 
<% 
} 
} 
if(iTotalPages>iTotalSearchRecords && i<iTotalPages) 
{ 
%> 
<a href="Home.jsp?iPageNo=<%=i%>&cPageNo=<%=i%>"> >> Next</a> 
<% 
} 
} 
%> 
<b>&nbsp &nbsp Rows :&nbsp <%=iStartResultNo%> - <%=iEndResultNo%> &nbsp &nbsp &nbsp &nbsp &nbsp Total Records : &nbsp<%=iTotalRows%> </b>
</div> 
</td> 
</tr> 
</table>
<p align="center" >
<form name="excel" method="post" action="ExcelServlet"  >
	 
	<input type="submit"  value="Export To Excel" name="submit" class="button_example" />
	
	<input type="hidden" name="excel" value="excel for employee" />
</form>
</p>
		</div>
	  </div>
	</div>
<%} %>
</body>
</html>