<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/albaScheduleClick.css" rel="stylesheet">
</head>
<body onLoad="info()">

	<div id="workDiary"></div>
	
</body>
<script>
	function info(){
		let workDiary = document.getElementById('workDiary');
		
		let all = document.createElement('Div');
		all.className="all";
		workDiary.appendChild(all);
		
		let one = document.createElement('Div');
		one.className="one";
		all.appendChild(one);
		
		let imgone = document.createElement('Div');
		imgone.className="img-one";
		one.appendChild(imgone);
		
		let imges = document.createElement('img');
		imges.className="imges";
		imges.src = "/resources/img/logo.png";
		imgone.appendChild(imges);
		
		let imgDiv = document.createElement('Div');
		imgDiv.className="imgDiv";
		imgone.appendChild(imgDiv);
		
		let three = document.createElement('Div');
		three.className="three";
		all.appendChild(three);
		
		let storeName = document.createElement('label');
		storeName.className="storeName";
		storeName.textContent="신세계 백화점";
		three.appendChild(storeName);
		
		let info = document.createElement('Div');
		info.className="info";
		info.textContent="09:00 ~ 11:00";
		three.appendChild(info);
		
	}
	
</script>



</html>