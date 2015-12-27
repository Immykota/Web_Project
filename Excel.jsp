<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Excel Sheet</title>
<link rel="stylesheet" type="text/css" href="./css/button.css" />
<link rel="stylesheet" type="text/css" href="./css/table.css" />

<script type="text/javascript">

function formValidation()
{	
	
	var check=0;
	
	  if(allAlphaNumeric())
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
    	
		document.excelsheet.action="ExcelServlet";
    	document.excelsheet.method="post";
		document.excelsheet.submit();
      }
 




function allAlphaNumeric()
{
	return true;
}

}


</script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include> 
	<br /> <br /> <br /><form name="excelsheet">
	       <font color="blue">  <pre>Create a folder and name it as "files" in your c drive and get Template,
	         
	   		fill the data and upload it by clicking the below button </pre> </font>
<p align="center">
	<input type="submit" name="submit" class="button_example" value="Get Template" onClick="return formValidation()" /> 
	<input type="submit" name="submit" class="button_example" value="Upload Data" onclick="return formValidation()"/>
</p>

</form>
</body>
</html>