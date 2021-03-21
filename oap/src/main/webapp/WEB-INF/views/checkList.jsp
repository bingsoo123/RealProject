<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/checkList.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
</head>
<body onLoad="check()">

	<div class="checkZone" id="checkZone">
	
		<div class="checkList" id="checkList">
		
			<h4>오늘의 업무리스트</h4>
			
<!-- 			<div class="checkList-content" id="checkList-content"> -->
<!-- 				<p>● 바닥에 붙은 껌 떼어내기 -->
<!-- 				<p>● 음료수 자판기에 음료수 채워넣기 -->
<!-- 				<p>● 화장실에 휴지여부 확인 후 채워넣기 -->
<!-- 				<p>● 흡연장 재떨이 청소하기 -->
<!-- 				<p>● 모든 좌석 청소하기 -->
<!-- 				<p>● 행복하게 근무하기 -->
<!-- 			</div> -->

		
		</div>
	
	</div>
	

</body>

<script>

	function check(){
		
		var checkList = JSON.parse('${checkListInfo}');
		
		var mainDiv = document.getElementById("checkList");
		
		var servDiv = document.createElement("Div");
		servDiv.className="checkList-content";
		servDiv.id="checkList-content";
		
		for(index = 0 ; index<checkList.length ; index++){
			
			var pp = document.createElement("p");
			var text = document.createTextNode("● " + checkList[index].mtDetail);
			pp.appendChild(text);
			servDiv.appendChild(pp);			
		}
		
		mainDiv.appendChild(servDiv);
		
	}

</script>

</html>











