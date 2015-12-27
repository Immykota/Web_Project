<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script language="javascript" type="text/javascript" src="datetimepicker.js">

//Date Time Picker script- by TengYong Ng of http://www.rainforestnet.com
//Script featured on JavaScript Kit (http://www.javascriptkit.com)
//For this script, visit http://www.javascriptkit.com

</script>
<%@ page import="com.dao.DataList" %>
	<%@ page import="java.util.*" %>
	<%@ page import="java.util.Iterator" %>
	<%@ page import="com.bean.*" %>
	<link rel="stylesheet" type="text/css" href="./css/button.css" />
	<link href="./css/demo.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="./js/datepicker.js"></script>
    <link href="./css/datepicker.css" rel="stylesheet" type="text/css" />
  
  <script type="text/javascript">
  function Date1()
  {		
	 empId=document.register.empId.value;
	var e = document.getElementById("dp-20");
    var cdate= e.options[e.selectedIndex].value;
 	document.register.hiddenvalue.value=cdate;
   	
 		document.register.action="CompSkill";
		document.register.method="post";
		document.register.submit();
		
  }
  </script>
  
  
  <script type="text/javascript" >
  
function formValidation()
	{	
		var check=0;
		var pskill=document.register.pskill;
		var skillset=document.register.skillset;
		var currentlevel=document.register.tccl;
		var desiredlevel1=document.register.tcdl;
		var desiredlevel2=document.register.dccl;
		var desiredlevel3=document.register.dcdl;
		//var compdate=document.register.compdate;
		
		
		
		if(pSkill(pskill))
		{
		if(skillSet(skillset))
		{
		if(currentLevel(currentlevel))
		{
		if(desiredLevelOne(desiredlevel1))
		{
		if(desiredLevelTwo(desiredlevel2))
		{
		if(desiredLevelThree(desiredlevel3))
		{
		
		check=1;			
	    }}}}}}
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
			document.register.action="EmployeeServlet";
			document.register.method="post";
			document.register.submit();
			alert("Changes Saved Successfully");
			window.close();
	  }
	}
	  
	  function skillSet(skillset)
	  {
		   if(skillset.value=="Select")
			{   
			   alert("Please Enter Skills");
			   skillset.focus();
			   return false;
			}
		   else return true;
	 } 
	  

	  function pSkill(pskill)
	  {
		   if(pskill.value=="Select")
			{   
			   alert("Please Enter Primary Skills");
			   pskill.focus();
			   return false;
			}
		   else return true;
	 } 

	  function compDate(compdate)
	  {
		   if(compdate.value=="Select")
			{   
			   alert("Please Select Competency Date");
			   compdate.focus();
			   return false;
			}
		   else return true;
	 } 


	function currentLevel(currentlevel)
	{
		if(currentlevel.value == "Select")
		{
		alert('Select Technical Competency Current Level ');
		currentlevel.focus();
		return false;
		}
		else return true;
		}

	function desiredLevelOne(desiredlevel1)
	{
		if(desiredlevel1.value == "Select")
		{
		alert('Select Technical Competency Desired Level');
		desiredlevel1.focus();
		return false;
		}
		else return true;
	}

	function desiredLevelTwo(desiredlevel2)
	{
		if(desiredlevel2.value == "Select")
		{
		alert('Select Domain Competency Current Level');
		desiredlevel2.focus();
		return false;
		}
		else return true;
	}

	function desiredLevelThree(desiredlevel3)
	{
		if(desiredlevel3.value == "Select")
		{
	    alert('Select Domain Competency Desired Level ');
	    desiredlevel3.focus();
		return false;
		}
	
	else return true; }
    

</script>
    
    
<title>Add Competency</title>
</head>
<%System.out.println("in the skill jsp");%>

<%SkillBean skillbean=(SkillBean)request.getAttribute("skillbeannew") ;%>


<body bgcolor=#ECF1EF>
<form name=register>
<h3 align="center">Competency Management</h3>
<table border="0px ;" align="center" style="width:600px;">

<tr ><td align="right" style="width:50%;">EmpId  </td>
	<td align="left" style="width:50%;"><input type=text  name="empId" style="background-color:#CFCFC3" readonly="readonly" id="empId" tabindex="1" value=<%=(skillbean!=null)? skillbean.getEid():request.getParameter("eid")%>></input></td>
</tr>

<tr >


<td align="right"  style="width:50%;" >Competency Date  </td>  
				<td align="left" >
				<select name='compdate' id="dp-20" style="width: 11em;" tabindex="2" onchange="Date1(this.value);" >         
			<option value="default"><%=(skillbean!=null)? skillbean.getCdate():"Select" %></option>      
			<%  ArrayList<String> complist = new DataList().getComp(request.getParameter("eid"));
			Iterator<String> iterator1=complist.iterator();
		     while(iterator1.hasNext())
		     {     
		    	 String value= (String)iterator1.next();
	    	%>     
	        <option value="<%= value %>"><% out.println(value); %></option>   
	             
	        <% }     
	        %>      
	    </select> <a href="javascript:NewCal('dp-20','ddmmyyyy')"><img src="./cal.gif" width="16" height="16" border="0" alt="Pick a date"></a>
</td></tr>



<tr ><td align="right" style="width:50%;">Primary Skills  </td>
			<td align="left" >
			<select name='pskill' style="width:50%;" tabindex="3" onchange="showEmp(this.value)">         
			<option value="default"><%=(skillbean!=null)? skillbean.getPskill():"Select" %></option>     
			<% Iterator<Integer> iterator;
			   HashMap<Integer,String> CmbMap = new DataList().getCatValues("pskill");
			   iterator = CmbMap.keySet().iterator();
             	while(iterator.hasNext()) 
				{
					Integer key = (Integer)iterator.next();
					String val = (String)CmbMap.get(key);
			%>       
	        <option value="<%=key%>"><% out.println(val); %></option>   
	       <% }%></select>
	       
	       
	       
	       
	       
</td></tr>

		
<tr ><td align="right" style="width:50%;">Technical Competency  </td>
			<td align="left" >
			<select name='skillset'  style="width:50%;"  tabindex="4" onchange="showEmp(this.value)">         
			<option value="default"><%=(skillbean!=null)? skillbean.getSkillset():"Select" %></option>  
			<% CmbMap.clear();
			    CmbMap = new DataList().getCatValues("skillset");
			    iterator = CmbMap.keySet().iterator();
             	while(iterator.hasNext()) 
				{
             		Integer key = (Integer)iterator.next();
					String val = (String)CmbMap.get(key);
			%>       
	        <option value="<%=key%>"><% out.println(val); %></option>   
	       <% }  %></select>
</td></tr>
		

<tr ><td align="right"  style="width:50%;" >Tech. Compt. Current Level  </td>
			<td align="left" >
				<select name="tccl"  style="width:50%;"  tabindex="5">
				<option value="default"><%=(skillbean!=null)? skillbean.getTccl():"Select" %></option>     
			<% CmbMap.clear();
			    CmbMap = new DataList().getCatValues("cl");
			    iterator = CmbMap.keySet().iterator();
             	while(iterator.hasNext()) 
				{
             		Integer key = (Integer)iterator.next();
					String val = (String)CmbMap.get(key);
			%>       
	        <option value="<%=key%>"><% out.println(val); %></option>   
	       <% }  %></select>
</td></tr>	
					
<tr ><td align="right" style="width:50%;">Tech. Compt. Desired Level </td>
			<td align="left" >
				<select name="tcdl"  style="width:50%;"  tabindex="6">
					<option value="default"><%=(skillbean!=null)? skillbean.getTcdl():"Select" %></option>      
			<% CmbMap.clear();
			    CmbMap = new DataList().getCatValues("dl");
			    iterator = CmbMap.keySet().iterator();
             	while(iterator.hasNext()) 
				{
             		Integer key = (Integer)iterator.next();
					String val = (String)CmbMap.get(key);
			%>       
	        <option value="<%=key%>"><% out.println(val); %></option>   
	       <% }  %></select>
</td></tr>	
		
		<tr >
			<td align="right" style="width:50%;">  Dom. Compt. Current Level </td>
			<td align="left" >
				<select name="dccl"  style="width:50%;"  tabindex="7">
				<option value="default"><%=(skillbean!=null)? skillbean.getDccl():"Select" %></option>       
			<% CmbMap.clear();
			    CmbMap = new DataList().getCatValues("cl");
			    iterator = CmbMap.keySet().iterator();
             	while(iterator.hasNext()) 
				{
             		Integer key = (Integer)iterator.next();
					String val = (String)CmbMap.get(key);
			%>       
	        <option value="<%=key%>"><% out.println(val); %></option>   
	       <% }  %></select>
</td></tr>	
		<tr >
			<td align="right" style="width:50%;">  Dom. Compt. Desired Level </td>
			<td align="left" >
				<select name="dcdl"  style="width:50%;"  tabindex="8">
				<option value="default"><%=(skillbean!=null)? skillbean.getDcdl():"Select" %></option>    
			<% CmbMap.clear();
			    CmbMap = new DataList().getCatValues("dl");
			    iterator = CmbMap.keySet().iterator();
             	while(iterator.hasNext()) 
				{
             		Integer key = (Integer)iterator.next();
             		String val = (String)CmbMap.get(key);
			%>       
	        <option value="<%=key%>"><% out.println(val); %></option>   
	       <% }  %></select>
	       
	       
	       
	       
	         	<% CmbMap.clear();
		    CmbMap = new DataList().getCatValues("dl");
		    iterator = CmbMap.keySet().iterator();
		   while(iterator.hasNext()) 
			{
			Integer key = (Integer)iterator.next();
			String val = (String)CmbMap.get(key);
			if (skillbean.getDcdl().equals(val))
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
</table>

	 	<br/>
<center>	
	 <input type=button value="Save"  tabindex="9" onClick="return formValidation()"/>
	 <input type=button value="close" tabindex="10" onClick="window.close()"/>
	 <input type="hidden" name="employee" value="addskill" />
	 <input type="hidden" name="hiddenvalue" />
	 </center>
	 </form>
</body>
</html>