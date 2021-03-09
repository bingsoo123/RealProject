<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/pay.css" rel="stylesheet">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body onLoad="init()">
	<div class="another">
	<br/>
	<div class="date">
		<select id="box1"  class="option1">
			<option>선택하세요.</option>
			<option value="2020년">2020년</option>
			<option value="2">2021년</option>
			<option value="3">2022년</option>
			<option value="4">2023년</option>
			<option value="5">2024년</option>
			<option value="6">2025년</option>
		</select>
		
		<select id="box2"  class="option2">
			<option>선택하세요.</option>
			<option value="01월명세서">01월명세서</option>
			<option>02월명세서</option>
			<option>03월명세서</option>
			<option>04월명세서</option>
			<option>05월명세서</option>
			<option>06월명세서</option>
			<option>07월명세서</option>
			<option>08월명세서</option>
			<option>09월명세서</option>
			<option>10월명세서</option>
			<option>11월명세서</option>
			<option>12월명세서</option>
		</select>
		&nbsp;
		<input type="button" value="조회" class="input1" onClick="init1()">
		<a href="http://localhost//payInsert" class="adder">add</a>
	</div>
	
	<br/><br/>

	<div class="bone">
	
		<div class="bone_top">
		
			<div class="storename">매장명</div>
			<div class="abname">알바명</div>
			<div class="paylist">명세서</div>
		
		</div>


	
		<div class="bone_bottom">
		
			<div class="storename1"></div>
			<div class="abname1"></div>
			<div class="paylist1"></div>
		</div>
	
	
	</div>
	
	<div id="payZone"></div>

	</div>
</body>

<script>

	function init() {

		let paylist = document.getElementById("payZone");
		let pay = JSON.parse('${jsonData}');

		for (i = 0; i < pay.length; i++) {
			let test1 = i;
			let alldiv = document.createElement('Div');
			alldiv.type = "button";
			alldiv.className = "alldiv";
			alldiv.style.cursor = "pointer";
			alldiv.addEventListener('click', function() {
				gopayDetail(pay,test1);
			});
			paylist.appendChild(alldiv);

			let shName = document.createElement('Div');
			shName.textContent = pay[i].shName;
			shName.className = "shName";
			shName.style.display = "inline-block";
			alldiv.appendChild(shName);

			let abName = document.createElement('Div');
			abName.textContent = pay[i].abName;
			abName.className = "aName";
			abName.style.display = "inline-block";
			alldiv.appendChild(abName);

			let paName = document.createElement('Div');
			paName.textContent = pay[i].paName;
			paName.className = "paName";
			paName.style.display = "inline-block";
			alldiv.appendChild(paName);
			
		}
	}

	function init1() {

		document.getElementById("payZone").innerHTML = "";
		
		alert("ok");
		var x = $('#box1').val();
		var y = $('#box2').val();
		var z = x + y;
		let paylist = document.getElementById("payZone");
		let pay = JSON.parse('${jsonData}');

		for (i = 0; i < pay.length; i++) {
				let test1 = i;
			if (z == pay[i].paName) {
				let alldiv = document.createElement('Div');
				alldiv.type = "button";
				alldiv.className = "alldiv";
				alldiv.style.cursor = "pointer";
				alldiv.addEventListener('click', function() {
					gopayDetail(pay,test1);
				});
				paylist.appendChild(alldiv);

				let shName = document.createElement('Div');
				shName.textContent = pay[i].shName;
				shName.className = "shName";
				shName.style.display = "inline-block";
				alldiv.appendChild(shName);

				let abName = document.createElement('Div');
				abName.textContent = pay[i].abName;
				abName.className = "aName";
				abName.style.display = "inline-block";
				alldiv.appendChild(abName);

				let paName = document.createElement('Div');
				paName.textContent = pay[i].paName;
				paName.className = "paName";
				paName.style.display = "inline-block";
				alldiv.appendChild(paName);

			}

		}
	}
	
	function gopayDetail(pay, test1) {
		
		var form = document.createElement('form');
		form.action = "/payDetail";
		form.method = "post";
		
		
		var input1 = document.createElement('input');
		input1.type = "text";
		input1.name = "shCode";
		input1.value = pay[test1].shCode;
		form.appendChild(input1);
		
		var input2 = document.createElement('input');
		input2.type = "text";
		input2.name = "abCode";
		input2.value = pay[test1].abCode;
		form.appendChild(input2);
		
		var input3 = document.createElement('input');
		input3.type = "text";
		input3.name = "paName";
		input3.value = pay[test1].paName;
		form.appendChild(input3);
		
		document.body.appendChild(form);
		form.submit();
	}
</script>

</html>