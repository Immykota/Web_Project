<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Registration page</title>
<link rel="stylesheet" type="text/css" href="./css/button.css" />
	<link href="./css/demo.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="./js/datepicker.js"></script>
        <link rel="stylesheet" type="text/css" href="./css/table.css" />
        <!-- Add the datepicker's stylesheet -->
        <link href="./css/datepicker.css" rel="stylesheet" type="text/css" />
        
<script type="text/javascript" >
function formValidation()
{	
	var check=0;
	var empid=document.register.empId;
	var moodyid=document.register.moodyId;
	var name=document.register.userName;
	var designation=document.register.designation;
	var desknumber=document.register.deskNumber;
	var mobilenumber=document.register.mobileNumber;
	var extensionnumber=document.register.extensionNumber;
	var tcsemail=document.register.tcsEmail;
	var moodyemail=document.register.moodyEmail;
	var dob=document.register.dob;
	
	
	var deliverymanager=document.register.deliveryManager; 
	var projectmanager=document.register.projectManager; 
	var groupname=document.register.group;
	var subgroupname=document.register.subGroup;
	var technology=document.register.technology;
	var billing=document.register.billing;
	var wave=document.register.wave;
	var priorexperience=document.register.priorExperience;
	var tcsdoj=document.register.tdoj;
	var tcsexperience=document.register.tcsExperience;
	
	
	
	var moodydoj=document.register.mdoj;
	var moodysexperience=document.register.moodysExperience;
	var totalexperience=document.register.totalExperience;
	var bgcstatus=document.register.bgcStatus;
	var bgccompleted=document.register.bgcCompleted;
	var currentlevel=document.register.currentLevel;
	var desiredlevel1=document.register.desiredLevel1;
	var desiredlevel2=document.register.desiredLevel2;
	var desiredlevel3=document.register.desiredLevel3;
	var status=document.register.status;
	
	if(empId(empid))
	{
	 if(moodyId(moodyid))
	 {
	  if(userName(name))
	  {
	   if(validateDesignation(designation))
       {
		if(validateDeskNumber(desknumber))
	    { 
		 if(mobileNumber(mobilenumber))
	     {
		  if(extensionNumber(extensionnumber))
		  { 
		   if(validateTcsEmail(tcsemail))
	       {
			if(validateMoodyEmail(moodyemail))
		    {
		    if(Dob(dob))
		    {  
		      
		    	if(deliveryManager(deliverymanager))
		  	    {
		    	 if(projectManager(projectmanager))
			  	 {
		    	  if(groupName(groupname))
				  {
		    	   if(subGroupName(subgroupname))
				   {  
		    		if(validateTechnology(technology))
					{    
		    	     if(validateBilling(billing))
					 { 
		    	      if(validateWave(wave))
					  {
		    	      if(priorExperience(priorexperience)) 
		    	      {	 
		    	       if(tcsDateOfJoin(tcsdoj))	  
		    	       {	  
		    	    	if(tcsExperience(tcsexperience))
		    	    	{	
		    	    	 
		    	    		
		    	    		
		    	    		
		    	            if(moodyDateOfJoin(moodydoj))	  
				    	    {
		    	              if(moodysExperience(moodysexperience))
				    	      {	
		    	            	if(totalExperience(totalexperience))
					    	    {	
		    	            	  if(bgcStatus(bgcstatus))
						    	  {
		    	            		if(bgcCompletedDate(bgccompleted))
							    	{
		    	            		 if(currentLevel(currentlevel))
								     {
		    	            		   if(desiredLevelOne(desiredlevel1))
									   {		 
		    	            			if(desiredLevelTwo(desiredlevel2))
										{
		    	            			 if(desiredLevelThree(desiredlevel3))
									      {
						    	          if(empStatus(status))
    	  									{
    	  										check=1;			
    	  									}
    	  			 					   }
    	  								 }
    	  								}
           							   }
    	  							  }
    	  							}
          						  }
    	  		               }
    	  			 		}
    	  			}
    	  		}
    	  		}	
    	  		}	
    	  		}	
    	  		}
    	  		}
    	  		}
    	  	}
    	  }
    	  }
        }
       }	  
	  }
    }
	}
	}
	}
	}
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
		document.register.action="EmployeeServlet";
		document.register.method="post";
		document.register.submit();
  }
 
  
  
  function moodyId(moodyid)
  {
	   var letters=/^[a-z A-Z 0-9]+$/;
		if(moodyid.value.match(letters))
		{
			return true;
		}
		else
		{
			alert("invalid moodyid")
			moodyid.focus();
			return false;
		}
  }
  
  
  
  function validateDeskNumber(desknumber)
  {
	  var letters=/^[A-Za-z 0-9]+[ ]*[-]*[A-Za-z0-9]*[-]*[ ]*[A-Za-z0-9]*[ ]*[-]*[A-Za-z0-9]*[ ]*[-]*[A-Za-z0-9]*$/;
		
		if(desknumber.value.match(letters))
		{	
			return true;	
		}
		else
		{
			alert("invalid desk number ");
			desknumber.focus();
			return false;
		}
	  
  }
function userName(name)
{
	
	var letters=/^[A-Za-z]+[ ]*[A-Za-z]*[ ]*[A-Za-z]*[ ]*[A-Za-z]*[ ]*[A-Za-z]*$/;
	
	if(name.value.match(letters))
	{	
		return true;	
	}
	else
	{
		alert("invalid name");
		name.focus();
		return false;
	}
}

  
function empId(empid)
{
	
	var letters=/^[0-9]+$/;
	if(empid.value.match(letters)&&empid.value>9999&&empid.value<1000000)
	{
		return true;
	}
	else
	{
		alert("invalid employee id")
		empid.focus();
		return false;
	}
}

function tDoj(tdoj)
{
	//var letters=/^[0-9]{4}[-]{1}[0-9]{2}[-]{1}[0-9]{2}$/;
	if(!tdoj.value)
	{
		alert("please select tcs joining date");
		tdoj.focus();
		return false;
	}
	else
	{
		
		return true;
	}
}

function validateDesignation(designation)
{
	if(designation.value == "Default")
	{
	alert('Select your designation from the list');
	designation.focus();
	return false;
	}
	else
	{
	
	return true;
    }
	

}

function mobileNumber(mobilenumber)
{
	var letters=/^[0-9]+$/;
	if(mobilenumber.value.match(letters)&&mobilenumber.value>999999999&&mobilenumber.value<10000000000)
	{
		return true;
	}
	else
	{
		alert("invalid mobile number")
		mobilenumber.focus();
		return false;
	}
}


function extensionNumber(extensionnumber)
{
	var letters=/^[0-9]+$/;
	if(extensionnumber.value.match(letters)&&extensionnumber.value>9999&&extensionnumber.value<100000)
	{
		return true;
	}
	else
	{
		alert("invalid extension number")
		extensionnumber.focus();
		return false;
	}
}


function validateTcsEmail(tcsemail)
{
	var letters=/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	if(tcsemail.value.match(letters))
	{
		return true;
	}
	else
	{
		 alert("invalid tcs email id");
		 tcsemail.focus();
		 return false;
	}	
}

function validateMoodyEmail(moodyemail)
{
	var letters=/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	if(moodyemail.value.match(letters))
	{
		return true;
	}
	else
	{
		 alert("invalid moody email id");
		 moodyemail.focus();
		 return false;
	}	
}
function Dob(dob)
{
	//var letters=/^[0-9]{4}[-]{1}[0-9]{2}[-]{1}[0-9]{2}$/;
	if(!dob.value)
	{
		alert("please select date of birth");
		dob.focus();
		return false;
	}
	else
	{
		
		return true;
	}
}

function deliveryManager(deliverymanager)
{
	var letters=/^[A-Za-z]+[ ]*[A-Za-z]*[ ]*[A-Za-z]*[ ]*[A-Za-z]*[ ]*[A-Za-z]*$/;
	if(deliverymanager.value.match(letters))
	{	
		return true;	
	}
	else
	{
		alert("invalid deliverymanager name");
		deliverymanager.focus();
		return false;
	}

}

function projectManager(projectmanager)
{
	var letters=/^[A-Za-z]+[ ]*[A-Za-z]*[ ]*[A-Za-z]*[ ]*[A-Za-z]*[ ]*[A-Za-z]*$/;
	if(projectmanager.value.match(letters))
	{	
		return true;	
	}
	else
	{
		alert("invalid projectmanager name");
		projectmanager.focus();
		return false;
	}

}


function groupName(groupname)
{
	var letters=/^[A-Za-z]+[ ]*[A-Za-z]*[ ]*[A-Za-z]*[ ]*[A-Za-z]*[ ]*[A-Za-z]*$/;
	if(groupname.value.match(letters))
	{	
		return true;	
	}
	else
	{
		alert("invalid groupname name");
		groupname.focus();
		return false;
	}

}


function subGroupName(subgroupname)
{
	var letters=/^[A-Za-z]+[ ]*[A-Za-z]*[ ]*[A-Za-z]*[ ]*[A-Za-z]*[ ]*[A-Za-z]*$/;
	if(subgroupname.value.match(letters))
	{	
		return true;	
	}
	else
	{
		alert("invalid subgroupname name");
		subgroupname.focus();
		return false;
	}

}

function validateTechnology(technology)
{
	
	if(technology.value == "Default")
	{
	alert('Select your technology from the list');
	technology.focus();
	return false;
	}
	else
	{
	
	return true;
    }
}

function validateBilling(billing)
{
	if(billing.value == "Default")
	{
	alert('Select your billing from the list');
	billing.focus();
	return false;
	}
	else
	{
	
	return true;
    }
	

}



function validateWave(wave)
{
	if(wave.value == "Default")
	{
	alert('Select your wave from the list');
	wave.focus();
	return false;
	}
	else
	{
	
	return true;
    }
}

function priorExperience(priorexperience)
{
	
	var letters=/^[0-9]+$/;
	if(priorexperience.value.match(letters)&&priorexperience.value<50)
	{
		return true;
	}
	else
	{
		alert("invalid priorexperience")
		priorexperience.focus();
		return false;
	}
}


function tcsDateOfJoin(tcsdoj)
{
	//var letters=/^[0-9]{4}[-]{1}[0-9]{2}[-]{1}[0-9]{2}$/;
	if(!tcsdoj.value)
	{
		alert("please select tcs joining date");
		tcsdoj.focus();
		return false;
	}
	else
	{
		
		return true;
	}
}


function tcsExperience(tcsexperience)
{
	
	var letters=/^[0-9]+$/;
	if(tcsexperience.value.match(letters)&&tcsexperience.value<50)
	{
		return true;
	}
	else
	{
		alert("invalid tcs experience")
		tcsexperience.focus();
		return false;
	}
}



function moodyDateOfJoin(moodydoj)
{
	//var letters=/^[0-9]{4}[-]{1}[0-9]{2}[-]{1}[0-9]{2}$/;
	if(!moodydoj.value)
	{
		alert("please select moodys joining date");
		moodydoj.focus();
		return false;
	}
	else
	{
		
		return true;
	}
}

function moodysExperience(moodysexperience)
{
	
	var letters=/^[0-9]+$/;
	if(moodysexperience.value.match(letters)&&moodysexperience.value<50)
	{
		return true;
	}
	else
	{
		alert("invalid moodys experience")
		moodysexperience.focus();
		return false;
	}
}


function totalExperience(totalexperience)
{
	
	var letters=/^[0-9]+$/;
	if(totalexperience.value.match(letters)&&totalexperience.value<50)
	{
		return true;
	}
	else
	{
		alert("invalid total experience")
		totalexperience.focus();
		return false;
	}
}


function bgcStatus(bgcstatus)
{
	if(bgcstatus.value == "Default")
	{
	alert('Select your status from the list');
	bgcstatus.focus();
	return false;
	}
	else
	{
	
	return true;
    }
}

function bgcCompletedDate(bgccompleted)
{
	//var letters=/^[0-9]{4}[-]{1}[0-9]{2}[-]{1}[0-9]{2}$/;
	if(!bgccompleted.value)
	{
		alert("please select bgc completed date");
		bgccompleted.focus();
		return false;
	}
	else
	{
		
		return true;
	}
}

function currentLevel(currentlevel)
{
	if(currentlevel.value == "Default")
	{
	alert('Select your current level from the list');
	currentlevel.focus();
	return false;
	}
	else
	{
	
	return true;
    }
}

function desiredLevelOne(desiredlevel1)
{
	if(desiredlevel1.value == "Default")
	{
	alert('Select your desired level from the list');
	desiredlevel1.focus();
	return false;
	}
	else
	{
	
	return true;
    }
}

function desiredLevelTwo(desiredlevel2)
{
	if(desiredlevel2.value == "Default")
	{
	alert('Select your desired level from the list');
	desiredlevel2.focus();
	return false;
	}
	else
	{
	
	return true;
    }
}

function desiredLevelThree(desiredlevel3)
{
	if(desiredlevel3.value == "Default")
	{
	alert('Select your desired level from the list');
	desiredlevel3.focus();
	return false;
	}
	else
	{
	
	return true;
    }
}
function empStatus(status)
{
	//var letters=/^[0-9]{4}[-]{1}[0-9]{2}[-]{1}[0-9]{2}$/;
	if(status.value == "Default")
	{
		alert("please select status");
		status.focus();
		return false;
	}
	else
	{
		
		return true;
	}
}
}
</script>

</head>
	
<body>
		
		    
<jsp:include page="header.jsp"></jsp:include>

 <h4><center ><sup>*</sup> All fields are mandatory </center> </font></h4>
 
 
<form name=register>
<table border="1" align="center"  class="hovertable">
<tr onmouseover="this.style.backgroundColor='99CCFF';" onmouseout="this.style.backgroundColor='#d4e3e5';"> 
	<td>
	  <table>
		
		<tr onmouseover="this.style.backgroundColor='99CCFF';" onmouseout="this.style.backgroundColor='#d4e3e5';">
			<td>EMPID:</td>
			<td><input type=text  name="empId" id="empId"/></td>
		</tr>
		
		<tr onmouseover="this.style.backgroundColor='99CCFF';" onmouseout="this.style.backgroundColor='#d4e3e5';">
			<td>MoodyID:</td>
			<td><input type=text  name="moodyId" id="moodyId"/></td>
		</tr>
		<tr onmouseover="this.style.backgroundColor='99CCFF';" onmouseout="this.style.backgroundColor='#d4e3e5';">
			<td>Name:</td>
			<td><input type=text  name="userName" id="userName" /></td>
		</tr>
		
		
		<tr onmouseover="this.style.backgroundColor='99CCFF';" onmouseout="this.style.backgroundColor='#d4e3e5';">

				<td>  Designation :</td>
				<td>
				<select name="designation">
					<option selected="" value="Default">select </option>
					<option value="ASE">A.S.E</option>
					<option value="SE">S.E</option>
					<option value="ITA">I.T.A</option>
					<option value="ITM">I.T.M</option>
					<option value="PL">P.L</option>
					<option value="DM">D.M</option>
					<option value="PM">P.M</option>
				</select>
				</td></tr><tr></tr><tr></tr>

	   <tr><td>
	   
	   <tr onmouseover="this.style.backgroundColor='99CCFF';" onmouseout="this.style.backgroundColor='#d4e3e5';">
			<td>Desk No:</td>
			<td><input type=text  name="deskNumber" id="deskNumber" /></td>
		</tr>

		<tr onmouseover="this.style.backgroundColor='99CCFF';" onmouseout="this.style.backgroundColor='#d4e3e5';">
			<td>Mobile No:</td>
			<td><input type=text  name="mobileNumber" id="mobileNumber" /></td>
		</tr>
		
		<tr onmouseover="this.style.backgroundColor='99CCFF';" onmouseout="this.style.backgroundColor='#d4e3e5';">
			<td>Extension No:</td>
			<td><input type=text  name="extensionNumber" id="extensionNumber" /></td>
		</tr>
		
		<tr onmouseover="this.style.backgroundColor='99CCFF';" onmouseout="this.style.backgroundColor='#d4e3e5';">
			<td>TCS Email:</td>
			<td><input type=text  name="tcsEmail" id="tcsEmail" /></td>
		</tr>
				
		<tr onmouseover="this.style.backgroundColor='99CCFF';" onmouseout="this.style.backgroundColor='#d4e3e5';">
			<td>Moody Email:</td>
			<td><input type=text  name="moodyEmail" id="moodyEmail" /></td>
		</tr>
	
	
	<tr onmouseover="this.style.backgroundColor='99CCFF';" onmouseout="this.style.backgroundColor='#d4e3e5';">
		  <td>Date Of Birth</td>  
	  
	  <td> <input type="text"  id="dp-8" name="dob" value="" /></p> </td>
      <script type="text/javascript">
      // <![CDATA[       
        var opts = {                            
                formElements:{"dp-8":"d-ds-m-ds-Y"},
                showWeeks:true,
                // Show a status bar and use the format "l-cc-sp-d-sp-F-sp-Y" (e.g. Friday, 25 September 2009)
                statusFormat:"l-cc-sp-d-sp-F-sp-Y"                    
        };      
        datePickerController.createDatePicker(opts);
      // ]]>
      </script>
	</tr>
		
	</table>
 </td>


<td>
	<table border="1" align="center"  class="hovertable">
		
		<tr onmouseover="this.style.backgroundColor='99CCFF';" onmouseout="this.style.backgroundColor='#d4e3e5';">
			<td>Skill Set:</td>
			<td><input type=text  name="skillSet" id="skillSet" /></td>
		</tr>
		<tr onmouseover="this.style.backgroundColor='99CCFF';" onmouseout="this.style.backgroundColor='#d4e3e5';">
			<td>Delivery Manager:</td>
			<td><input type=text  name="deliveryManager" id="deliveryManager" /></td>
		</tr>
		
		<tr onmouseover="this.style.backgroundColor='99CCFF';" onmouseout="this.style.backgroundColor='#d4e3e5';">
			<td>Project Manager:</td>
			<td><input type=text  name="projectManager" id="projectManager" /></td>
		</tr>
		
		<tr onmouseover="this.style.backgroundColor='99CCFF';" onmouseout="this.style.backgroundColor='#d4e3e5';">
			<td>Group:</td>
			<td><input type=text  name="group" id="group" /></td>
		</tr>
		
		<tr onmouseover="this.style.backgroundColor='99CCFF';" onmouseout="this.style.backgroundColor='#d4e3e5';">
			<td>Sub Group:</td>
			<td><input type=text  name="subGroup" id="subGroup" /></td>
		</tr>
		
		<tr onmouseover="this.style.backgroundColor='99CCFF';" onmouseout="this.style.backgroundColor='#d4e3e5';">
			<td>Core/Flex:</td>
			<td>
				<select name="technology">
					<option selected="" value="Default">select </option>
					<option value="core">Core</option>
					<option value="flex">Flex</option>
					<option value="notavailable">NotAvailable</option>
				</select>
				</td></tr><tr></tr><tr></tr>
		<tr><td>
		
		<tr onmouseover="this.style.backgroundColor='99CCFF';" onmouseout="this.style.backgroundColor='#d4e3e5';">
			<td>B/NB:</td>
			<td>
				<select name="billing">
					<option selected="" value="Default">select </option>
					<option value="billing">Billing</option>
					<option value="nonbilling">Non-Billing</option>
					<option value="notavailable">NotAvailable</option>
				</select>
				</td></tr><tr></tr><tr></tr>
		<tr><td>
		
		<tr onmouseover="this.style.backgroundColor='99CCFF';" onmouseout="this.style.backgroundColor='#d4e3e5';">
			<td> Wave:</td>
			<td>
				<select name="wave">
					<option selected="" value="Default">select </option>
					<option value="wave1">Wave1</option>
					<option value="wave2">Wave2</option>
					<option value="wave3">Wave3</option>
				</select>
				</td></tr><tr></tr><tr></tr>
		<tr><td>
		
		<tr onmouseover="this.style.backgroundColor='99CCFF';" onmouseout="this.style.backgroundColor='#d4e3e5';">
			<td>Prior Experience:</td>
			<td><input type=text  name="priorExperience" id="priorExperience" /></td>
		</tr>
		
		<tr onmouseover="this.style.backgroundColor='99CCFF';" onmouseout="this.style.backgroundColor='#d4e3e5';">
	  		<td>TCS Date Of Joining</td>  
	  
	  		<td> <input type="text"  id="dp-3" name="tdoj" value="" /></p> </td>
      		<script type="text/javascript">
      // <![CDATA[       
        		var opts = {                            
                	formElements:{"dp-3":"d-ds-m-ds-Y"},
                	showWeeks:true,
                // Show a status bar and use the format "l-cc-sp-d-sp-F-sp-Y" (e.g. Friday, 25 September 2009)
                	statusFormat:"l-cc-sp-d-sp-F-sp-Y"                    
        					};      
        		datePickerController.createDatePicker(opts);
      // ]]>
      </script>
	   </tr>
	   
	   <tr onmouseover="this.style.backgroundColor='99CCFF';" onmouseout="this.style.backgroundColor='#d4e3e5';">
			<td>TCS Experience:</td>
			<td><input type=text  name="tcsExperience" id="tcsExperience" /></td>
	   </tr>
	   
	</table>
 </td>
  <td>
  	<table border="1" align="center"  class="hovertable">
  		
  	 <tr>	
		 <td>Moodys Join  Date</td>  
	  
	 	 <td> <input type="text"  id="dp-5" name="mdoj" value="" /></p> </td>
     	 <script type="text/javascript">
      	// <![CDATA[       
       	 var opts = {                            
                formElements:{"dp-5":"d-ds-m-ds-Y"},
                showWeeks:true,
                // Show a status bar and use the format "l-cc-sp-d-sp-F-sp-Y" (e.g. Friday, 25 September 2009)
                statusFormat:"l-cc-sp-d-sp-F-sp-Y"                    
       		 };      
        datePickerController.createDatePicker(opts);
      // ]]>
      </script>
	</tr>
	  
	  <tr onmouseover="this.style.backgroundColor='99CCFF';" onmouseout="this.style.backgroundColor='#d4e3e5';">
			<td>Moodys Experience:</td>
			<td><input type=text  name="moodysExperience" id="moodysExperience" /></td>
	   </tr>
	   
	   <tr onmouseover="this.style.backgroundColor='99CCFF';" onmouseout="this.style.backgroundColor='#d4e3e5';">
			<td>Total Experience:</td>
			<td><input type=text  name="totalExperience" id="totalExperience" /></td>
	   </tr>
	   
	   <tr onmouseover="this.style.backgroundColor='99CCFF';" onmouseout="this.style.backgroundColor='#d4e3e5';">
			<td> BGC Status:</td>
			<td>
				<select name="bgcStatus">
					<option selected="" value="Default">select </option>
					<option value="inprogress">inprogress</option>
					<option value="completed">completed</option>
					<option value="na">NA</option>
				</select>
				</td></tr><tr></tr><tr></tr>
		<tr><td>
		
		<tr onmouseover="this.style.backgroundColor='99CCFF';" onmouseout="this.style.backgroundColor='#d4e3e5';">	
		 	<td>BGC Completed Date</td>  
	  
	  		<td> <input type="text"  id="dp-2" name="bgcCompleted" value="" /></p> </td>
      		<script type="text/javascript">
      			// <![CDATA[       
        		var opts = {                            
                		formElements:{"dp-2":"d-ds-m-ds-Y"},
                		showWeeks:true,
                // Show a status bar and use the format "l-cc-sp-d-sp-F-sp-Y" (e.g. Friday, 25 September 2009)
               			 statusFormat:"l-cc-sp-d-sp-F-sp-Y"                    
        					};      
        		datePickerController.createDatePicker(opts);
      			// ]]>
      		</script>
		</tr>
		
		<tr onmouseover="this.style.backgroundColor='99CCFF';" onmouseout="this.style.backgroundColor='#d4e3e5';">
			<td> Current Level:</td>
			<td>
				<select name="currentLevel">
					<option selected="" value="Default">select </option>
					<option value="E0">E0</option>
					<option value="E1">E1</option>
					<option value="E2">E2</option>
					<option value="E3">E3</option>
					<option value="E4">E4</option>
				</select>
				</td></tr><tr></tr><tr></tr>
		<tr><td>
		
		<tr onmouseover="this.style.backgroundColor='99CCFF';" onmouseout="this.style.backgroundColor='#d4e3e5';">
			<td> Desired Level(3-6 months):</td>
			<td>
				<select name="desiredLevel1">
					<option selected="" value="Default">select </option>
					<option value="E0">E0</option>
					<option value="E1">E1</option>
					<option value="E2">E2</option>
					<option value="E3">E3</option>
					<option value="E4">E4</option>
			    </select>
				</td></tr><tr></tr><tr></tr>
		<tr><td>
		
		<tr onmouseover="this.style.backgroundColor='99CCFF';" onmouseout="this.style.backgroundColor='#d4e3e5';">
			<td> Desired Level(6-9 months):</td>
			<td>
				<select name="desiredLevel2">
					<option selected="" value="Default">select </option>
					<option value="E0">E0</option>
					<option value="E1">E1</option>
					<option value="E2">E2</option>
					<option value="E3">E3</option>
					<option value="E4">E4</option>
				</select>
				</td></tr><tr></tr><tr></tr>
		<tr><td>
		
		<tr onmouseover="this.style.backgroundColor='99CCFF';" onmouseout="this.style.backgroundColor='#d4e3e5';">
			<td> Desired Level(1 year):</td>
			<td>
				<select name="desiredLevel3">
					<option selected="" value="Default">select </option>
					<option value="E0">E0</option>
					<option value="E1">E1</option>
					<option value="E2">E2</option>
					<option value="E3">E3</option>
					<option value="E4">E4</option>
				</select>
				</td></tr><tr></tr><tr></tr>
		<tr><td>
		
		<tr onmouseover="this.style.backgroundColor='99CCFF';" onmouseout="this.style.backgroundColor='#d4e3e5';">
			<td> Status:</td>
			<td>
				<select name="status">
					<option selected="" value="Default">select </option>
					<option value="active">Active</option>
					<option value="inactive">Inactive</option>
					<option value="na">NA</option>
				</select>
				</td></tr><tr></tr><tr></tr>
		<tr><td>
  		
  	</table>
  </td>
</table>
<center>
<pre>
     <input type=button class="button_example" value="Back" onClick="window.location.href='Home.jsp'"> <input type=button class="button_example" value="ADD" onClick="return formValidation()"/>  
</pre>
</center>
	<input type="hidden" name="employee" value="addemployee" />
</form>
</body>
</html>