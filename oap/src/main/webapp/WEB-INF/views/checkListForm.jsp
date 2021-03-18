<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/checkListForm.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
</head>
<body onLoad="check()">

		<div class="checkList" id="checkList">
		
			<h4>근무 간 업무 체크리스트</h4>
			
			<div class="checkList-content" id="checkList-content">
				<div class="checkList-list">
				
					<div class="body-contentList">업무목록</div>
					<div class="body-contentTrue">수행했음</div>
					<div class="body-contentFalse">수행하지 못함</div>
					
				</div>
				
				<button class="albaAdd_btn" onClick="transffer()">지원하기</button>
				
			</div>
		
		</div>
		


</body>

<script>

	function check(){
		
		
	}

	function multiChk(obj){
		
		var checkTrue = document.getElementsByName("checkTrue");
		var checkFalse = document.getElementsByName("checkFalse");
		
		for(var i=0; i<checkTrue.length; i++){
			
			if(checkTrue[i] == obj){
				checkFalse[i].checked=false;
			}else if(checkFalse[i] == obj){
				checkTrue[i].checked=false;				
			}
			
		}
	}
	
	function transffer(){
		
		var test = document.getElementsByClassName("detail-content");
		var checkTrue = document.getElementsByName("checkTrue");
		var checkFalse = document.getElementsByName("checkFalse");
		
		alert("testValue" + test[0].innerText);
		
		
		for (index=0 ; index < checkTrue.length ; index++){
			
			if(checkTrue[index].checked){
				
				alert(checkTrue[index].value);
				
			}else if(checkFalse[index].checked){
				
				alert(checkFalse[index].value);
			}
				
		}
		
	}

</script>

</html>


