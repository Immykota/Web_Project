<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>forget password</title>

        
<script type="text/javascript" >
function formValidation()
{
	var empId=document.f1.empid;
	
		
		var letters=/^[0-9]+$/;
		if(empId.value.match(letters)&&empId.value>9999&&empId.value<1000000)
		{
			return true;
		}
		else
		{
			alert("Invalid Employee Id");
			empId.focus();
			empId.value="";
			return false;
		}
	}
	
	
</script>
</head>
<body bgcolor=#ECF1EF>
  <img src="Moody's Log 2.jpg" width="1400" height="70">
	
  <h3 align="center">Forgot Password....!  
  </h3> 
  <form name="f1" action="./EmployeeServlet" method="post">
  
  <table align="center" border="0">
  <tr><td>Enter Employee Id</td>
  <input type="hidden" name="employee" value="forget"/>
  		<td><input type="text" name="empid"/></td></tr>
  		
 
  
  </table>
  <br/>
  <center><input type="submit" name="submit" value="Submit" onClick="return formValidation()"/>   <input type="button" value="Back" onClick="window.location.href='Login.jsp'"></center>

  </form>
  
</body>
</html>