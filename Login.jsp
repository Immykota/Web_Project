<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Login</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet" type="text/css" href="./css/button.css" />
<link rel="stylesheet" type="text/css" href="./css/table.css" />
<script type="text/JavaScript">

function timedRefresh()
{
	setTimeout("location.reload(true);",22000);
}
</script>
<script>    
history.forward(1); 
</script>


<script language="javascript">
               c=0;
           function counter() {
             c++;
             switch(c) 
             {
      		  case 1 : document.images[1].src="<%=request.getContextPath() %>/images/2.JPG"; break;
              case 2 : document.images[1].src="<%=request.getContextPath() %>/images/3.jpg"; break;
              case 3 : document.images[1].src="<%=request.getContextPath() %>/images/4.jpg"; break;
              case 4 : document.images[1].src="<%=request.getContextPath() %>/images/5.png";break;  
              case 5 : document.images[1].src="<%=request.getContextPath() %>/images/6.png";break;  
              case 6 : document.images[1].src="<%=request.getContextPath() %>/images/7.jpg";break;  
              case 7 : document.images[1].src="<%=request.getContextPath() %>/images/11.jpg";break;  
              case 8 : document.images[1].src="<%=request.getContextPath() %>/images/8.JPG";break;  
		      case 9 : document.images[1].src="<%=request.getContextPath() %>/images/9.jpg";break;  
              case 10: document.images[1].src="<%=request.getContextPath() %>/images/10.jpg";break;  
                
             default:document.images[1].src="<%=request.getContextPath() %>/images/1.jpg"; break;
                    }
            
            
                     }
               
    </script>

<script type="text/javascript" >
function formValidation()
{
	var id=document.login.id;
	var password=document.login.password;
	//var role=document.login.role;
	var check=0;
	
	if(validateId(id))
	{
		if(validatePassword(password))
		{
			
				check=1;
			
		}
	}
	
	if(check==0)
	{
		return false;
	}
	else
	{
		document.login.action="LoginServlet";
		document.login.method="post";
		document.login.submit();
	}
	function validateId(id)
	{
		
		if(id.value=="")
		{   alert("Please Enter UserName");
		    id.focus();
			return false;
		}
		else return true;
	}
	
	function validatePassword(password)
	{
		
		if(password.value=="")
		{alert("Please Enter Your Password");
		password.focus();
			return false;
		}
		else return true;
		
	}
	
	/*function validateRole(role)
	{
		if(role.value == "Select")
		{
			alert('Select Role From The List');
			role.focus();
			return false;
		}
		else
		{
			return true;
	    }
	}*/
}

</script>

</head>
<body bgcolor=#ECF1EF> 

<img src="Moody's Log 2.jpg" width="1400" height="70">
	
<% 
	String error=(String)request.getAttribute("errorMessage"); 
	if(error!=null)
	{      

		%><span class="blueText"><%out.print("<p align=center color= red>" +error+ "</p>"); %></span><%
	}
%> 
<form name="login">
<p>
<h1><span class="page_title1">Welcome to</span> <span class="page_title2">Moody's</span></h1>
</p>
<!-- Title -->
<br><br>
<!-- Content Slider Starts Here -->
<table align="left" width="100%" border="0" cellspacing="0" cellpadding="5">
<tr><td width="50%">
<table width="100%" border="0" cellspacing="0" cellpadding="1">     
     <tr>
       <td> <img src="<%=request.getContextPath() %>/images/1.jpg" align=center width="500" height="350"  alt="Moodys images" >
<script language="javascript">
      setInterval("counter()",2000)</script>

</td></tr>
</table></td>
	<td width="1000%"><table align="left">

		<tr>
			<td>UserName </td>
			<td align="left" > <input type="text" name="id" /> 
		</tr> 
		<tr>
			<td> Password </td>
			<td align="left"> <input type="password" name="password"/></td>
		</tr>
	    <!-- <tr>
	    	<td> Role </td>
	    	<td> <select name="role">
	    		  <option value="Select">Select</option>
	    		  <option value="Admin"> Admin </option>
	    		  <option value="User"> User </option>
	    	</select>
	    	</td>
	    </tr> -->
	    
	<br />
	  					                
	 <tr align="center"><td align="right"><input type="submit" name="Login" value="Login" onclick="return formValidation()" /></td>    
	 <td align="left"><input type="reset" name="reset" value="Reset" /></td></tr>
	
    <tr><td><a href="ForgotPassword.jsp"> Forget Password?</a></td>  <td><a href="NewUser.jsp"> New User?</a></td></tr>
     </table></td></tr></table> 
</form>
</body>
</html>