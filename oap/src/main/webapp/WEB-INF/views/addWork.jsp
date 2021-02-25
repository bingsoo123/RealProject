<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE HTML>
<html>
<head>
   <title>addWork</title>
   <link href="/resources/css/addWork.css" rel="stylesheet"/> 
</head>
<body>
   <fieldset class="field1">
   	<legend>업무 추가</legend><br/>
   
   	<div>
   		<label for="분류1">근무시간</label>
   		<select id="select1">
             <option ></option>
             <option ></option>
             <option ></option>
   	    </select>
    	<label for="분류2">주기</label>
    	<select id="select1">
             <option ></option>
             <option ></option>
             <option ></option>
    	</select>
   	 </div> <br/><br/>
   	 
   	 <fieldset class="field2">
   	 	<legend>내용</legend>
   	 </fieldset>
    
    
    </fieldset>
    
    <input type="button" value="추가하기" style="position:absolute; left:16%" onclick="goAdd()"/>
    
   

</body>
</html>