<%@ page import="java.util.*" %>   
 

  
<html>   
  <head>   
  <title></title>   
  </head>   
  <body>   
    <form id="test" method="POST" action="Populate">   
      <input name="state" type="radio" value="Australia" id="state-aus">Australia   
      <input name="state" type="radio" value="NewZealand" id="state-new">NewZealand   
      <input name="state" type="radio" value="India" id="state-oth"  >India   
      <Select name="othStates" size="1" id="oth-states">   
      <c:forEach items="${state.stateList}" var="st">   
            <option value="1"><c:out value="${st.name}"/></option>   
      </c:forEach>   
      </select>   
      <br>   
      <input type="Submit" name="cmdSub" value="SUBMIT">   
      <input type="Reset" name="cmdReset" value="RESET">   
    </form>   
  </body>   
</html>  
