<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/pay.css" rel="stylesheet">
</head>
<body onLoad="init()">
	<div class="another">
	<br/>
	<div class="date">
		<select id="box1" class="option1">
			<option>선택하세요.</option>
			<option>2020년</option>
			<option>2021년</option>
			<option>2022년</option>
			<option>2023년</option>
			<option>2024년</option>
			<option>2025년</option>
		</select>
		
		<select id="box2" class="option2">
			<option>선택하세요.</option>
			<option>01월명세서</option>
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
		<input type="button" value="조회" class="input1" onClick="init1()"/>
		<input type="button" value="추가" class="adder" onClick="add()"/>
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
	
	<div id="test5"></div>
	
	</div>
</body>

<script>

	function add(){
		window.open("/manageStore","급여추가","width=800,height=700,left=550,top=150,toolbar=no,status=no,resizable=no");
	}


	function init() {
		var x = document.getElementById("box1").value;
		var y = document.getElementById("box2").value;
		let paylist = document.getElementById("test5");
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

	function init1(){
		var year = document.getElementById("box1").value;
		var month = document.getElementById("box2").value;
		let pay = JSON.parse('${jsonData}');
		paName = year+month;
		shCode = pay[0].shCode;
		let request = new XMLHttpRequest();
	    request.onreadystatechange = function() {
	       if (this.readyState == 4 && this.status == 200) {
	    	   let paySearch = decodeURIComponent(request.response);
	    	   	
	    	   let sPay = JSON.parse(paySearch);
	    	   sView(sPay);
	    	   
	       }
		}
		 	request.open("POST","paySearch",true);
   		 	request.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
    		request.send("sCode=paySearch" + "&shCode=" + shCode + "&paName=" + paName);
		}
	
	function sView(sPay){
		document.getElementById("test5").innerHTML = "";
		let paylist = document.getElementById("test5");
		for (i = 0; i < sPay.length; i++) {
			let test1 = i;
			let alldiv = document.createElement('Div');
			alldiv.type = "button";
			alldiv.className = "alldiv";
			alldiv.style.cursor = "pointer";
			alldiv.addEventListener('click', function() {
				gopayDetail1(sPay,test1);
			});
			paylist.appendChild(alldiv);
			
			let shName = document.createElement('Div');
			shName.textContent = sPay[i].shName;
			shName.className = "shName";
			shName.style.display = "inline-block";
			alldiv.appendChild(shName);
			
			let abName = document.createElement('Div');
			abName.textContent = sPay[i].abName;
			abName.className = "aName";
			abName.style.display = "inline-block";
			alldiv.appendChild(abName);
			
			let paName = document.createElement('Div');
			paName.textContent = sPay[i].paName;
			paName.className = "paName";
			paName.style.display = "inline-block";
			alldiv.appendChild(paName);
		}
		
		
	}
	
function gopayDetail1(sPay, test1) {
		
		window.open("","pop","width=550,height=530,left=690,top=250,toolbar=no,status=no,resizable=no");

		var form = document.createElement('form');
		form.action = "/payDetail";
		form.method = "post";
		form.target = "pop"; 
		
		var input1 = document.createElement('input');
		input1.type = "hidden";
		input1.name = "shCode";
		input1.value = sPay[test1].shCode;
		form.appendChild(input1);
		
		var input2 = document.createElement('input');
		input2.type = "hidden";
		input2.name = "abCode";
		input2.value = sPay[test1].abCode;
		form.appendChild(input2);
		
		var input3 = document.createElement('input');
		input3.type = "hidden";
		input3.name = "paName";
		input3.value = sPay[test1].paName;
		form.appendChild(input3);
		
		document.body.appendChild(form);
		form.submit();
		
	}
	
	
	function gopayDetail(pay, test1) {
		
		window.open("","pop","width=550,height=530,left=690,top=250,toolbar=no,status=no,resizable=no");

		var form = document.createElement('form');
		form.action = "/payDetail";
		form.method = "post";
		form.target = "pop"; 
		
		var input1 = document.createElement('input');
		input1.type = "hidden";
		input1.name = "shCode";
		input1.value = pay[test1].shCode;
		form.appendChild(input1);
		
		var input2 = document.createElement('input');
		input2.type = "hidden";
		input2.name = "abCode";
		input2.value = pay[test1].abCode;
		form.appendChild(input2);
		
		var input3 = document.createElement('input');
		input3.type = "hidden";
		input3.name = "paName";
		input3.value = pay[test1].paName;
		form.appendChild(input3);
		
		document.body.appendChild(form);
		form.submit();
		
	}
</script>
</html>