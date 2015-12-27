<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Registration page</title>
<script language="javascript" type="text/javascript" src="datetimepicker.js"></script>
<%@ page import="com.dao.*" %>
	<%@ page import="java.util.*" %>
	<%@ page import="com.bean.*" %>
	<%@ page import="java.util.Iterator" %>
<link rel="stylesheet" type="text/css" href="./css/button.css" />
	<link href="./css/demo.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="./js/datepicker.js"></script>
	<script type="text/javascript" src="./js/Emp.js"></script>
	<script type="text/javascript" src="./js/Modify.js"></script>
	<script type="text/JavaScript">
 
function confirmDelete(){
var agree=confirm("Are you sure you want to delete this record?");
if (agree)
	{document.register.action="ModifyServlet";
     document.register.method="post";
     document.register.submit();}
else return true;


}



function openform(){
	var empID1 = document.getElementById('empId');
	
		window.open('Skill.jsp?eid='+empID1.value,'window','width=500,height=400');
		<%request.setAttribute("Empidmodify", request.getParameter("empId"));%>
		
		document.register.action="ModifyServlet";
		document.register.method="post";
	     document.register.submit();


}

function CompForm(){
	var empID1 = document.getElementById('empId');
	
		window.open('Skill.jsp?eid='+empID1.value,'window','width=500,height=400');
}



</script>
	
   <link href="./css/datepicker.css" rel="stylesheet" type="text/css" />
 
</head>

<%EmployeeBean employeeBean=(EmployeeBean)request.getAttribute("EmployeeList") ;
if(employeeBean == null) {%>
	<%EmployeeBean empsave=(EmployeeBean)request.getAttribute("empcomp") ;%>
	
	
<body bgcolor=#ECF1EF>
<img src="Moody's Log 2.jpg" width="1400" height="70">	
<% 
	String Success=(String)request.getAttribute("SuccessMessage"); 
	if(Success!=null)
	{      

		%><span class="blueText"><%out.print("<p align=center color= red>" +Success+ "</p>"); %></span><%
	}
%>


<table><tr><td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td><td></td><td></td><td></td><td></td><td></td><td></td><td align="center" style="width:96%;"><h3>Employee Details</h3></td><td align="right" style="width:2%;"><input type="image" style="height:35px;width:35px;" src="home.jpg" onClick="window.location.href='Home.jsp'"></td> <td align="right" style="width:2%;"> <input type="image" style="height:35px;width:35px;" src="./images/logout.jpg" onClick="window.location.href='Logout.jsp'">  </td></tr></table>

<form name=register>


<table border="1px solid #000;" align="center" style="width:800px;">
<tr ><td><table style="width:350px;height:400px;"><tr >
			<td align="right" style="width:50%;"><font color="red"><sup>*</sup></font>EmpId  </td>
			<td align="left" style="width:50%;"><input type=text  name="empId"  id="empId" tabindex="1"  value=<%=(empsave!=null)? empsave.getEmpId():"" %> ></input></td>
</tr>
		
<tr ><td align="right" style="width:50%;"><font color="red"></font>Moody's ID  </td>
	 <td align="left" style="width:50%;"><input type=text  name="moodyId" id="moodyId" tabindex="2" value=<%=(empsave!=null)? empsave.getMoodyId():"" %>></input></td>
</tr>
<tr ><td align="right" style="width:50%;"><font color="red"></font>NT ID  </td>
	 <td align="left" style="width:50%;"><input type=text  name="ntid" id="ntid" tabindex="3" value=<%=(empsave!=null)? empsave.getNtid():"" %>></input></td>
</tr>
<tr ><td align="right" style="width:50%;"><font color="red"><sup>*</sup></font>Name  </td>
	 <td align="left" style="width:50%;"><input type=text  name="userName" id="userName" tabindex="4" value=<%=(empsave!=null)? empsave.getUserName():"" %>></input></td>
</tr>
		
<tr><td align="right" style="width:50%;"><font color="red"><sup>*</sup></font>Designation  </td>
				<td align="left" style="width:50%;">
				<select name='designation' size="1"  style="width: 11em;" tabindex="5" onchange="showEmp(this.value)">         
			<option value="default"><%=(empsave!=null)? empsave.getDesignation():"Select" %></option>      
			 <% Iterator<Integer> iterator;
			   HashMap<Integer,String> CmbMap = new DataList().getCatValues("Designation");
			   iterator = CmbMap.keySet().iterator();  
				while(iterator.hasNext()) 
				{
				Integer key = (Integer)iterator.next();
 				String val = (String)CmbMap.get(key);
			%>       
	        <option value="<%=key%>"><% out.println(val); %></option>   
	        	<% }%></select>
</td></tr>

<tr >
			<td align="right" style="width:50%;"><font color="red"><sup>*</sup></font>Mobile No  </td>
			<td align="left" style="width:50%;"><input type=text  name="mobileNumber" id="mobileNumber" tabindex=" 7" value=<%=(empsave!=null)? empsave.getMobileNumber():"" %> ></input></td>
</tr>
		
<tr >
			<td align="right" style="width:50%;">Extension No  </td>
			<td align="left" style="width:50%;"><input type=text  name="extensionNumber" id="extensionNumber" tabindex="8" value=<%=(empsave!=null)? empsave.getExtensionNumber():"" %> ></input></td>
</tr>
		
<tr ><td align="right" style="width:50%;"><font color="red"><sup>*</sup></font>Location  </td>
			<td align="left" style="width:50%;">
			<select name='location' style="width: 11em;" tabindex="9" onchange="showEmp(this.value)">         
			<option value="default"><%=(empsave!=null)? empsave.getLocation():"Select" %></option>      
			<% CmbMap.clear();
		    CmbMap = new DataList().getCatValues("Location");
		    iterator = CmbMap.keySet().iterator();
		    while(iterator.hasNext()) 
			{
			Integer key = (Integer)iterator.next();
			String val = (String)CmbMap.get(key);%>       
        	<option value="<%=key%>"><% out.println(val); %></option>   
     		 <% }%></select>
</td></tr>


<tr >
			<td align="right" style="width:50%;"><font color="red"></font>TCS Email  </td>
			<td align="left" style="width:50%;"><input type=text  name="tcsEmail" id="tcsEmail" tabindex="10" value=<%=(empsave!=null)? empsave.getTcsEmail():"" %> ></input></td>
</tr>
				
		
<tr >
	<td align="right" style="width:50%;"><font color="red"></font>Date Of Birth  </td>  
	  <td align="left" style="width:50%;"><input id="dp-8" type="text" name="dob" tabindex="12" readonly  value=<%=(empsave!=null)? empsave.getDob():"" %> ></input><a href="javascript:NewCal('dp-8','ddmmyyyy')"><img src="./cal.gif" width="16" height="16" border="0" alt="Pick a date"></a></td>
 </tr></table></td>
 
<td><table style="width:350px;height:400px;">
<tr >
	<td align="right" style="width:50%;">Desk No  </td>
	<td align="left" style="width:50%;"><input type=text  name="deskNumber" id="deskNumber" tabindex="6" value=<%=(empsave!=null)? empsave.getDeskNumber():"" %> ></input></td>
</tr>


<tr >
	<td align="right" style="width:50%;">Moody's Email  </td>
	<td align="left" style="width:50%;"><input type=text  name="moodyEmail" id="moodyEmail" tabindex="11" value=<%=(empsave!=null)? empsave.getMoodyEmail():"" %> ></input></td>
</tr>
	

<tr >
	<td align="right" style="width:50%;"><font color="red"></font>Prior Experience  </td>
	<td align="left"><input type=text  name="priorExperience" id="priorExperience" tabindex="20" value=<%=(empsave!=null)? empsave.getPriorExperience():"" %> ></input></td>
</tr>
		
<tr>
	 <td align="right" style="width:50%;"><font color="red"><sup>*</sup></font>TCS Joining Date  </td>  
	  <td align="left"><input id="dp-3" type="text" name="tdoj" tabindex="21" readonly value=<%=(empsave!=null)? empsave.getTdoj():"" %> ></input><a href="javascript:NewCal('dp-3','ddmmyyyy')"><img src="./cal.gif" width="16" height="16" border="0" alt="Pick a date"></a></td>
</tr>
	   
<tr >
			<td align="right" style="width:50%;"><font color="red"></font>TCS Experience  </td>
			<td align="left"><input type=text  name="tcsExperience" id="tcsExperience" tabindex="22" onfocus="tcsExperienceCount();"></td>
</tr>
 <tr>	
     <td align="right" style="width:50%;"><font color="red"></font>Moody's Joining Date  </td>  
	  <td align="left"><input id="dp-5" type="text" name="mdoj" tabindex="23" readonly value=<%=(empsave!=null)? empsave.getMdoj():"" %> ></input><a href="javascript:NewCal('dp-5','ddmmyyyy')"><img src="./cal.gif" width="16" height="16" border="0" alt="Pick a date"></a></td>
</tr>
	  
<tr >
			<td align="right" style="width:50%;"><font color="red"></font>Moody's Experience  </td>
			<td align="left"><input type=text  name="moodysExperience" id="moodysExperience"  tabindex="24" onFocus="moodysExperienceCount();"></td>
</tr>
<tr >
			<td align="right" style="width:50%;"><font color="red"></font>Total Experience  </td>
			<td align="left"><input type=text  name="totalExperience" id="totalExperience"  tabindex="25" onFocus="totalExperienceCount();"></td>
</tr></table></td>

<td><table style="width:350px;height:400px;">
<tr>
      <td align="right" style="width:50%;"><font color="red"><sup>*</sup></font>Delivery Manager  </td>
		<td align="left">
		<select name='deliveryManager' size="1"  style="width: 11em;" tabindex="13" >         
	     <option value="default"><%=(empsave!=null)? empsave.getDeliveryManager():"Select" %></option>      
			<% CmbMap.clear();
		    CmbMap = new DataList().getCatValues("Delivery Manager");
		    iterator = CmbMap.keySet().iterator();
		    while(iterator.hasNext()) 
			{
			Integer key = (Integer)iterator.next();
			String val = (String)CmbMap.get(key);%>       
        	<option value="<%=key%>"><% out.println(val); %></option>   
     		 <% }%></select>
			
</td></tr>
		
<tr>
          <td align="right" style="width:50%;"><font color="red"><sup>*</sup></font>Project Manager     </td>
			<td align="left">
				<select name='projectManager' size="1"  style="width: 11em;" tabindex="14" onchange="showEmp(this.value)">         
		<option value="default"><%=(empsave!=null)? empsave.getProjectManager():"Select" %></option>      
			<% CmbMap.clear();
		    CmbMap = new DataList().getCatValues("Project Manager");
		    iterator = CmbMap.keySet().iterator();
		    while(iterator.hasNext()) 
			{
			Integer key = (Integer)iterator.next();
			String val = (String)CmbMap.get(key);%>       
        	<option value="<%=key%>"><% out.println(val); %></option>   
     		 <% }%></select>
</td></tr>
		
<tr >
			<td align="right" style="width:50%;"><font color="red"><sup>*</sup></font>Group  </td>
			<td align="left">
			<select name='Group' size="1"  style="width: 11em;" tabindex="15" onchange="showEmp(this.value)">         
		<option value="default"><%=(empsave!=null)? empsave.getGroup():"Select" %></option>      
			<% CmbMap.clear();
		    CmbMap = new DataList().getCatValues("group");
		    iterator = CmbMap.keySet().iterator();
		    while(iterator.hasNext()) 
			{
			Integer key = (Integer)iterator.next();
			String val = (String)CmbMap.get(key);%>       
        	<option value="<%=key%>"><% out.println(val); %></option>   
     		 <% }%></select>
</td></tr>
		
		
<tr >
			<td align="right" style="width:50%;"><font color="red"><sup>*</sup></font>Sub Group  </td>
			<td align="left">
			<select name='subGroup' size="1"  style="width: 11em;" tabindex="16" onchange="showEmp(this.value)">         
			<option value="default"><%=(empsave!=null)? empsave.getSubGroup():"Select" %></option>       
			<% CmbMap.clear();
		    CmbMap = new DataList().getCatValues("sub group");
		    iterator = CmbMap.keySet().iterator();
		    while(iterator.hasNext()) 
			{
			Integer key = (Integer)iterator.next();
			String val = (String)CmbMap.get(key);%>       
        	<option value="<%=key%>"><% out.println(val); %></option>   
     		 <% }%></select>
</td></tr>
		
<tr >
			<td align="right" style="width:50%;"><font color="red"></font>Core/Flex  </td>
			<td align="left">
			<select name='technology' style="width: 11em;" tabindex="17" onchange="showEmp(this.value)">         
		    <option value="default"><%=(empsave!=null)? empsave.getTechnology():"Select" %></option>       
			<% CmbMap.clear();
		    CmbMap = new DataList().getCatValues("Core/Flex");
		    iterator = CmbMap.keySet().iterator();
		    while(iterator.hasNext()) 
			{
			Integer key = (Integer)iterator.next();
			String val = (String)CmbMap.get(key);%>       
        	<option value="<%=key%>"><% out.println(val); %></option>   
     		 <% }%></select>
</td></tr>
		
<tr >
			<td align="right" style="width:50%;"><font color="red"></font>B/NB  </td>
			<td align="left">
			<select name='billing' style="width: 11em;" tabindex="18" onchange="showEmp(this.value)">         
			<option value="default"><%=(empsave!=null)? empsave.getBilling():"Select" %></option> 
			<% CmbMap.clear();
		    CmbMap = new DataList().getCatValues("B/NB");
		    iterator = CmbMap.keySet().iterator();
		    while(iterator.hasNext()) 
			{
			Integer key = (Integer)iterator.next();
			String val = (String)CmbMap.get(key);%>       
        	<option value="<%=key%>"><% out.println(val); %></option>   
     		 <% }%></select>
</td></tr>
		
<tr >
			<td align="right" style="width:50%;"><font color="red"></font>Wave  </td>
			<td align="left">
			<select name='wave' style="width: 11em;" tabindex="19" onchange="showEmp(this.value)">         
			<option value="default"><%=(empsave!=null)? empsave.getWave():"Select" %></option>       
			<% CmbMap.clear();
		    CmbMap = new DataList().getCatValues("Wave");
		    iterator = CmbMap.keySet().iterator();
		    while(iterator.hasNext()) 
			{
			Integer key = (Integer)iterator.next();
			String val = (String)CmbMap.get(key);%>       
        	<option value="<%=key%>"><% out.println(val); %></option>   
     		 <% }%></select>
</td></tr>
		
<tr >
			<td align="right" style="width:50%;">BGC Status  </td>
			<td align="left" >
			<select name='bgcStatus' style="width: 11em;" tabindex="26" onchange="showEmp(this.value)">         
			<option value="default"><%=(empsave!=null)? empsave.getBgcCompleted():"Select" %></option>      
			<% CmbMap.clear();
		    CmbMap = new DataList().getCatValues("BGC Status");
		    iterator = CmbMap.keySet().iterator();
		    while(iterator.hasNext()) 
			{
			Integer key = (Integer)iterator.next();
			String val = (String)CmbMap.get(key);%>       
        	<option value="<%=key%>"><% out.println(val); %></option>   
     		 <% }%></select>
</td></tr>
		
<tr >	
	<td align="right" style="width:50%;">BGC Completed Date  </td>  
	  <td align="left" ><input id="dp-2" type="text" name="bgcCompleted" tabindex="27" readonly  value=<%=(empsave!=null)? empsave.getBgcCompleted():"" %> ></input><a href="javascript:NewCal('dp-2','ddmmyyyy')"><img src="./cal.gif" id="imgcal" width="16" height="16" border="0" alt="Pick a date"></a></td>
</tr>
<tr >
			<td align="right" style="width:50%;"><font color="red"><sup>*</sup></font>Status  </td>
			<td align="left" >			
			<select name='status' style="width: 11em;" tabindex="35" onchange="showEmp(this.value)">         
			<option value="default"><%=(empsave!=null)? empsave.getStatus():"Select" %></option>       
			<% CmbMap.clear();
		    CmbMap = new DataList().getCatValues("Status");
		    iterator = CmbMap.keySet().iterator();
		    while(iterator.hasNext()) 
			{
			Integer key = (Integer)iterator.next();
			String val = (String)CmbMap.get(key);%>       
        	<option value="<%=key%>"><% out.println(val); %></option>   
     		 <% }%></select>
</td></tr></table></td></table>
<br/>
<center>

     <input type=button class="button_example" value="Back" tabindex="36" onClick="window.location.href='Home.jsp'">
      <input type=button class="button_example" value="Save" tabindex="37" onClick="return formValidation()"/>
   <%if(empsave==null)
      {%>    
  <input type=button class="button_example" value="Competency"  disabled="disabled" />
 
 
 
 
 <%} else
      {%>
      
      
      
       <input type=button class="button_example" value="Competency" tabindex="37" onClick="return CompForm();"/>
	<font color="red"><%out.print("Select Your Competency");%></font> <%} %>
</center>
		<input type="hidden" name="employee" value="addemployee" />
</form>
<%} 	
else {%>


<body bgcolor=#ECF1EF>
<img src="Moody's Log 2.jpg" width="1400" height="70">	

<%  EmployeeBean Modnewbean=(EmployeeBean)request.getAttribute("ModNewBean") ;
	String ModSuccess=(String)request.getAttribute("ModSuccessMessage"); 
	if(ModSuccess!=null)
	{      

		%><span class="blueText"><%out.print("<p align=center color= red>" +ModSuccess+ "</p>"); %></span><%
	}
%>
<table><tr><td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td><td></td><td></td><td></td><td></td><td></td><td></td><td align="center" style="width:96%;"><h3>Employee Details</h3></td><td align="right" style="width:2%;"><input type="image" style="height:35px;width:35px;" src="home.jpg" onClick="window.location.href='Home.jsp'"></td> <td align="right" style="width:2%;"> <input type="image" style="height:35px;width:35px;" src="./images/logout.jpg" onClick="window.location.href='Logout.jsp'">  </td></tr></table>

<form name=register>

<table border="1px solid #000;" align="center" style="width:800px;">
<tr ><td><table style="width:350px;height:400px;"><tr >
			<td align="right" style="width:50%;"><font color="red"><sup>*</sup></font>EmpId  </td>
			<td align="left" style="width:50%;"><input type=text  name="empId"  id="empId" tabindex="1"  value="<%=(employeeBean!=null)?  employeeBean.getEmpId(): Modnewbean.getEmpId()%>" ></input></td>
</tr>
		
<tr ><td align="right" style="width:50%;"><font color="red"></font>Moody's ID  </td>
	 <td align="left" style="width:50%;"><input type=text  name="moodyId" id="moodyId" tabindex="2" value="<%=employeeBean.getMoodyId()%>"></input></td>
</tr>
<tr ><td align="right" style="width:50%;"><font color="red"></font>NT ID  </td>
	 <td align="left" style="width:50%;"><input type=text  name="ntid" id="ntid" tabindex="3" value="<%=employeeBean.getNtid()%>"></input></td>
</tr>
<tr ><td align="right" style="width:50%;"><font color="red"><sup>*</sup></font>Name  </td>
	 <td align="left" style="width:50%;"><input type=text  name="userName" id="userName" tabindex="4" value="<%=employeeBean.getUserName()%>"></input></td>
</tr>
		
<tr><td align="right" style="width:50%;"><font color="red"><sup>*</sup></font>Designation  </td>
				<td align="left" style="width:50%;">
				<select name='designation' size="1"  style="width: 11em;" tabindex="5" onchange="showEmp(this.value)">         
		      <% Iterator<Integer> iterator;
			   HashMap<Integer,String> CmbMap = new DataList().getCatValues("Designation");
			iterator = CmbMap.keySet().iterator();
		   while(iterator.hasNext()) 
			{
			Integer key = (Integer)iterator.next();
			String val = (String)CmbMap.get(key);
			if (employeeBean.getDesignation().equals(val))
			{  System.out.println("in if lopps desigb ");%>       
        	<option value="<%=key%>" selected><% out.println(val); %></option>
        	<% 
        	}
        	else
        	{%>
        	<option value="<%=key%>"><% out.println(val); %></option>
        	<%}   
     		 }%></select>
</td></tr>

<tr >
			<td align="right" style="width:50%;"><font color="red"><sup>*</sup></font>Mobile No  </td>
			<td align="left" style="width:50%;"><input type=text  name="mobileNumber" id="mobileNumber" tabindex=" 7" value="<%=employeeBean.getMobileNumber()%>"/></td>
</tr>
		
<tr >
			<td align="right" style="width:50%;">Extension No  </td>
			<td align="left" style="width:50%;"><input type=text  name="extensionNumber" id="extensionNumber" tabindex="8" value="<%=employeeBean.getExtensionNumber()%>"/></td>
</tr>
		
<tr ><td align="right" style="width:50%;"><font color="red"><sup>*</sup></font>Location  </td>
			<td align="left" style="width:50%;">
			<select name='location' style="width: 11em;" tabindex="9" onchange="showEmp(this.value)">         
			       
			<%if(employeeBean.getLocation()==null)
				{%> <option value="<%=employeeBean.getLocation()%>" ></option>
				
			<%} 
			 else %>
			
			
			<option value="<%=employeeBean.getLocation()%>" > <%=employeeBean.getLocation()%></option>  
			<% CmbMap.clear();
		    CmbMap = new DataList().getCatValues("Location");
		    iterator = CmbMap.keySet().iterator();
		    while(iterator.hasNext()) 
			{
			Integer key = (Integer)iterator.next();
			String val = (String)CmbMap.get(key);%>       
        	<option value="<%=key%>"><% out.println(val); %></option>   
     		 <% }%></select>
</td></tr>


<tr >
			<td align="right" style="width:50%;"><font color="red"></font>TCS Email  </td>
			<td align="left" style="width:50%;"><input type=text  name="tcsEmail" id="tcsEmail" tabindex="10" value="<%=employeeBean.getTcsEmail()%>" /></td>
</tr>
				
		
<tr >
	<td align="right" style="width:50%;"><font color="red"></font>Date Of Birth  </td>  
	  <td align="left" style="width:50%;"><input id="dp-8" type="text" name="dob" tabindex="12"  value="<%=employeeBean.getDob()%>" readonly><a href="javascript:NewCal('dp-8','ddmmyyyy')"><img src="./cal.gif" width="16" height="16" border="0" alt="Pick a date"></a></td>
 </tr></table></td>
 
<td><table style="width:350px;height:400px;">
<tr >
	<td align="right" style="width:50%;">Desk No  </td>
	<td align="left" style="width:50%;"><input type=text  name="deskNumber" id="deskNumber" tabindex="6" value="<%=employeeBean.getDeskNumber()%>"/></td>
</tr>


<tr >
	<td align="right" style="width:50%;">Moody's Email  </td>
	<td align="left" style="width:50%;"><input type=text  name="moodyEmail" id="moodyEmail" tabindex="11" value="<%=employeeBean.getMoodyEmail()%>"/></td>
</tr>
	

<tr >
	<td align="right" style="width:50%;"><font color="red"></font>Prior Experience  </td>
	<td align="left"><input type=text  name="priorExperience" id="priorExperience" tabindex="20" value="<%=employeeBean.getPriorExperience()%>"/></td>
</tr>
		
<tr>
	 <td align="right" style="width:50%;"><font color="red"><sup>*</sup></font>TCS Joining Date  </td>  
	  <td align="left"><input id="dp-3" type="text" name="tdoj" tabindex="21"  value="<%=employeeBean.getTdoj()%>" readonly><a href="javascript:NewCal('dp-3','ddmmyyyy')"><img src="./cal.gif" width="16" height="16" border="0" alt="Pick a date"></a></td>
</tr>
	   
<tr >
			<td align="right" style="width:50%;"><font color="red"></font>TCS Experience  </td>
			<td align="left"><input type=text  name="tcsExperience" id="tcsExperience" tabindex="22" onFocus="tcsExperienceCount();"  /></td>
</tr>
 <tr>	
     <td align="right" style="width:50%;"><font color="red"></font>Moody's Joining Date  </td>  
	  <td align="left"><input id="dp-5" type="text" name="mdoj" tabindex="23" value="<%=employeeBean.getMdoj()%>" readonly><a href="javascript:NewCal('dp-5','ddmmyyyy')"><img src="./cal.gif" width="16" height="16" border="0" alt="Pick a date"></a></td>
</tr>
	  
<tr >
			<td align="right" style="width:50%;"><font color="red"></font>Moody's Experience  </td>
			<td align="left"><input type=text  name="moodysExperience" id="moodysExperience"  tabindex="24" onFocus="moodysExperienceCount();" /></td>
</tr>
<tr >
			<td align="right" style="width:50%;"><font color="red"></font>Total Experience  </td>
			<td align="left"><input type=text  name="totalExperience" id="totalExperience"  tabindex="25" onFocus="totalExperienceCount();" /></td>
</tr></table></td>

<td><table style="width:350px;height:400px;">
<tr>
      <td align="right" style="width:50%;"><font color="red"><sup>*</sup></font>Delivery Manager  </td>
		<td align="left">
		<select name='deliveryManager' size="1"  style="width: 11em;" tabindex="13" onchange="showEmp(this.value)">         
			<% CmbMap.clear();
		    CmbMap = new DataList().getCatValues("Delivery Manager");
		    iterator = CmbMap.keySet().iterator();
		   while(iterator.hasNext()) 
			{
			Integer key = (Integer)iterator.next();
			String val = (String)CmbMap.get(key);
			if (employeeBean.getDeliveryManager().equals(val))
			{  System.out.println("in if lopps ");%>       
        	<option value="<%=key%>" selected><% out.println(val); %></option>
        	<% 
        	}
        	else
        	{%>
        	<option value="<%=key%>"><% out.println(val); %></option>
        	<%}   
     		 }%></select>
</td></tr>
		
<tr>
          <td align="right" style="width:50%;"><font color="red"><sup>*</sup></font>Project Manager     </td>
			<td align="left">
				<select name='projectManager' size="1"  style="width: 11em;" tabindex="14" onchange="showEmp(this.value)">         
		<% CmbMap.clear();
		    CmbMap = new DataList().getCatValues("Project Manager");
		    iterator = CmbMap.keySet().iterator();
		    if(employeeBean.getProjectManager()==null)
			{ %>
			<option value=" " selected> </option><%} 
		   while(iterator.hasNext()) 
			{
			Integer key = (Integer)iterator.next();
			String val = (String)CmbMap.get(key);
			if(employeeBean.getProjectManager()==null)
			{ System.out.println("value is null");%>
			
			<option value="<%=key %>" ><% out.println(val); %></option>
			
        	<%}
			else if (employeeBean.getProjectManager().equals(val))
			{  System.out.println("in if lopps ");%>       
        	<option value="<%=key%>" selected><% out.println(val); %></option>
        	<% 
        	}
			else
        	{%>
        	<option value="<%=key%>"><% out.println(val); %></option>
        	<%}   
     		 }%></select>
</td></tr>
		
<tr >
			<td align="right" style="width:50%;"><font color="red"><sup>*</sup></font>Group  </td>
			<td align="left">
			<select name='Group' size="1"  style="width: 11em;" tabindex="15" onchange="showEmp(this.value)">         
		    	<% CmbMap.clear();
		    CmbMap = new DataList().getCatValues("group");
		    iterator = CmbMap.keySet().iterator();
		   while(iterator.hasNext()) 
			{
			Integer key = (Integer)iterator.next();
			String val = (String)CmbMap.get(key);
			if (employeeBean.getGroup().equals(val))
			{  System.out.println("in if lopps ");%>       
        	<option value="<%=key%>" selected><% out.println(val); %></option>
        	<% 
        	}
        	else
        	{%>
        	<option value="<%=key%>"><% out.println(val); %></option>
        	<%}   
     		 }%></select>
</td></tr>
		
		
<tr >
			<td align="right" style="width:50%;"><font color="red"><sup>*</sup></font>Sub Group  </td>
			<td align="left">
			<select name='subGroup' size="1"  style="width: 11em;" tabindex="16" onchange="showEmp(this.value)">         
		
     		   	<% CmbMap.clear();
		    CmbMap = new DataList().getCatValues("sub group");
		    iterator = CmbMap.keySet().iterator();
		   while(iterator.hasNext()) 
			{
			Integer key = (Integer)iterator.next();
			String val = (String)CmbMap.get(key);
			if (employeeBean.getSubGroup().equals(val))
			{  System.out.println("in if lopps ");%>       
        	<option value="<%=key%>" selected><% out.println(val); %></option>
        	<% 
        	}
        	else
        	{%>
        	<option value="<%=key%>"><% out.println(val); %></option>
        	<%}   
     		 }%></select>
</td></tr>
		
<tr >
			<td align="right" style="width:50%;"><font color="red"></font>Core/Flex  </td>
			<td align="left">
			<select name='technology' style="width: 11em;" tabindex="17" onchange="showEmp(this.value)">         
		    <%if(employeeBean.getTechnology()==null)
				{%> <option value="<%=employeeBean.getTechnology()%>" ></option>
				
			<%} 
			  %>
			 
			 <% CmbMap.clear();
		    CmbMap = new DataList().getCatValues("Core/Flex");
		    iterator = CmbMap.keySet().iterator();
		   while(iterator.hasNext()) 
			{
			Integer key = (Integer)iterator.next();
			String val = (String)CmbMap.get(key);
			if (employeeBean.getTechnology().equals(val))
			{  System.out.println("in if lopps ");%>       
        	<option value="<%=key%>" selected><% out.println(val); %></option>
        	<% 
        	}
        	else
        	{%>
        	<option value="<%=key%>"><% out.println(val); %></option>
        	<%}   
     		 }%></select>
			 
			
</td></tr>
		
<tr >
			<td align="right" style="width:50%;"><font color="red"></font>B/NB  </td>
			<td align="left">
			<select name='billing' style="width: 11em;" tabindex="18" onchange="showEmp(this.value)">         
			<% CmbMap.clear();
		    CmbMap = new DataList().getCatValues("B/NB");
		    iterator = CmbMap.keySet().iterator();
		    if(employeeBean.getBilling()==null)
			{ %>
			<option value=" " selected> </option><%} 
		   while(iterator.hasNext()) 
			{
			Integer key = (Integer)iterator.next();
			String val = (String)CmbMap.get(key);
			if(employeeBean.getBilling()==null)
			{ %>
			
			<option value="<%=key %>" ><% out.println(val); %></option>
			
        	<%}
			else if (employeeBean.getBilling().equals(val))
			{  %>       
        	<option value="<%=key%>" selected><% out.println(val); %></option>
        	<% 
        	}
			else
        	{%>
        	<option value="<%=key%>"><% out.println(val); %></option>
        	<%}   
     		 }%></select>
		
</td></tr>
		
<tr >
			<td align="right" style="width:50%;"><font color="red"></font>Wave  </td>
			<td align="left">
			<select name='wave' style="width: 11em;" tabindex="19" onchange="showEmp(this.value)">         
			 <% CmbMap.clear();
		    CmbMap = new DataList().getCatValues("Wave");
		    iterator = CmbMap.keySet().iterator();
		    if(employeeBean.getWave()==null)
			{ %>
			<option value=" " selected> </option><%} 
		   while(iterator.hasNext()) 
			{
			Integer key = (Integer)iterator.next();
			String val = (String)CmbMap.get(key);
			if(employeeBean.getWave()==null)
			{ %>
			
			<option value="<%=key %>" ><% out.println(val); %></option>
			
        	<%}
			else if (employeeBean.getWave().equals(val))
			{  %>       
        	<option value="<%=key%>" selected><% out.println(val); %></option>
        	<% 
        	}
			else
        	{%>
        	<option value="<%=key%>"><% out.println(val); %></option>
        	<%}   
     		 }%></select>
</td></tr>
		
<tr >
			<td align="right" style="width:50%;">BGC Status  </td>
			<td align="left" >
			<select name='bgcStatus' style="width: 11em;" tabindex="26" onchange="showEmp(this.value)">         
			 <% CmbMap.clear();
		    CmbMap = new DataList().getCatValues("BGC Status");
		    iterator = CmbMap.keySet().iterator();
		    if(employeeBean.getBgcStatus()==null)
			{ %>
			<option value=" " selected> </option><%} 
		   while(iterator.hasNext()) 
			{
			Integer key = (Integer)iterator.next();
			String val = (String)CmbMap.get(key);
			if(employeeBean.getBgcStatus()==null)
			{ %>
			
			<option value="<%=key %>" ><% out.println(val); %></option>
			
        	<%}
			else if (employeeBean.getBgcStatus().equals(val))
			{  %>       
        	<option value="<%=key%>" selected><% out.println(val); %></option>
        	<% 
        	}
			else
        	{%>
        	<option value="<%=key%>"><% out.println(val); %></option>
        	<%}   
     		 }%></select>
</td></tr>

		
<tr >	
	<td align="right" style="width:50%;">BGC Completed Date  </td>  
	  <td align="left" ><input id="dp-2" type="text" name="bgcCompleted" tabindex="27" value="<%=employeeBean.getBgcCompleted()%>" readonly><a href="javascript:NewCal('dp-2','ddmmyyyy')"><img src="./cal.gif" id="imgcal" width="16" height="16" border="0" alt="Pick a date"></a></td>
</tr>
<tr >
			<td align="right" style="width:50%;"><font color="red"><sup>*</sup></font>Status  </td>
			<td align="left" >			
			<select name='status' style="width: 11em;" tabindex="35" onchange="showEmp(this.value)">         
			 <% CmbMap.clear();
		    CmbMap = new DataList().getCatValues("Status");
		    iterator = CmbMap.keySet().iterator();
		    if(employeeBean.getStatus()==null)
			{ %>
			<option value=" " selected> </option><%} 
		   while(iterator.hasNext()) 
			{
			Integer key = (Integer)iterator.next();
			String val = (String)CmbMap.get(key);
			if(employeeBean.getStatus()==null)
			{ %>
			
			<option value="<%=key %>" ><% out.println(val); %></option>
			
        	<%}
			else if (employeeBean.getStatus().equals(val))
			{  %>       
        	<option value="<%=key%>" selected><% out.println(val); %></option>
        	<% 
        	}
			else
        	{%>
        	<option value="<%=key%>"><% out.println(val); %></option>
        	<%}   
     		 }%></select>
</td></tr></table></td></table>

<center><pre><input type=button class="button_example" value="Back"  tabindex="36" onClick="window.location.href='Home.jsp'">  <input type=submit name="submit" tabindex="38" class="button_example" value="Delete" onClick="confirmDelete();"/>  <input type="submit" name="submit"   class="button_example"  value="Save" tabindex="37" onClick="return formValidationmodify()"/> <input type="hidden" name="submit" value="Competency"  /> <input type=submit name="submit" class="button_example" value="Competency" tabindex="37" onClick="return openform()"/></pre></center></form>
    <center> <form name="excel" method="post" action="ExcelServlet"  ><input type="hidden" name="myObject" value="${employeeBean}" /><input type="submit" value="Generate Report" name="submit" class="button_example" align="right"/><input type="hidden" name="excel" value="excel for employee" /></form></center>

</form>
<%}%>

</body>
</html>