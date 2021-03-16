<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/whoseWorkList.css">
</head>
<body onLoad="whose()">

	<div class="work-albaList" id="work-albaList">
		
	</div>

</body>

<script>

	function whose(){
		
		//넘어오는 데이터값 매장코드 알바생코드 알바생이름 성별 업무번호 업무분류
		var list = JSON.parse('${workList}');
		
		var albaList = document.getElementById("work-albaList");
		
		for(index = 0 ; index < list.length ; index ++){
			
			var dv1 = document.createElement("Div");
			dv1.className = "albaList-content";
			var img = document.createElement("Img");
			img.className="alba-genderImg";
			img.src="/resources/img/" + list[index].abGender + ".png";
			dv1.appendChild(img);
			
			var name = document.createElement("p");
			var text = document.createTextNode(list[index].abName);
			name.appendChild(text);
			dv1.appendChild(name);
			
			albaList.appendChild(dv1);
			
		}
		
	}

</script>

</html>

