<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/payInsert.css" rel="stylesheet">
</head>
<body onLoad="view()">
	
	<div class="all" id="all">
	
		<div class="imgdiv">
			<img src="/resources/img/Main_logo.png" style="width:115px;height:115px;">
		</div>
		
		<div class="one">
			<select class="select1" id="se1">
			
			</select>
			
			<select class="select2" id="se2">
				<option>해당년도</option>
				<option>2020년</option>
				<option>2021년</option>
				<option>2022년</option>
				<option>2023년</option>
				<option>2024년</option>
			</select>
			
			<select class="select3" id="se3">
				<option>명세서</option>
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
			<input type="date" id="da1">
			<input type="date" id="da2">
			<input type="image" class="clickimg" src="/resources/img/hand.jpg" onClick="search()">
		</div>
		
		<div class="two">
			<a class="a1">시급 : </a> <input type="text" class="text1" id="text1" readonly> <a class="a2">원</a>
		</div>
		
		<div class="three">
			<a class="a1">휴게시간 : </a> <input type="text" class="text2" id="text2" readonly> <a class="a2">분</a>
		</div>
		
		<div class="four">
			<a class="a1">근무시간 : </a> <input type="text" class="text3" id="text3" readonly> <a class="a2">분</a>
		</div>
		
		<div class="five">
			<a class="a1">지급액 : </a> <input type="text" class="text4" id="text4" readonly> <a class="a3">원</a>
		</div>
		
		<input type="button" value="등록하기" class="addClick" onClick="addPay()">
		
	</div>
</body>
<script>

	function addPay(){
		
	}

	function view(){
		let x = document.getElementById('se1').value;
		let y = document.getElementById('se2').value;
		let z = document.getElementById('se3').value;
		let q = document.getElementById('da1').value;
		let w = document.getElementById('da2').value;
		let tesinfo = JSON.parse('${payInsert}');
		
		for(i=0; i<tesinfo.length; i++){
			let select1 = document.getElementById('se1');
			
			let option1 = document.createElement('option');
			option1.value = tesinfo[i].abName;
			option1.text = tesinfo[i].abName;
			
			select1.appendChild(option1);
			
		}
	}

	function search(){
		document.getElementById("text1").innerHTML = "";
		
		let x = document.getElementById('se1').value;
		let y = document.getElementById('se2').value;
		let z = document.getElementById('se3').value;
		let q = document.getElementById('da1').value.replace(/-/g,"");
		let w = document.getElementById('da2').value.replace(/-/g,"");
		let length = w.replace(/-/g,"")-q.replace(/-/g,"")+1;
		
		
		let data="";
		
		let tesinfo = JSON.parse('${payInsert}');
		
		for(i=0; i<tesinfo.length; i++){
			if(x==tesinfo[i].abName){
				let text1 = document.getElementById('text1');
				text1.value = tesinfo[i].aPay;
				
				let text2 = document.getElementById('text2');
				text2.value = tesinfo[i].restTime;
				
			}
		
		}
		
		for(i=q ; i<=w ; i++){
			data += i + ((i==w) ? "" : "-");
		}
		
		for(i=0 ; i<tesinfo.length ; i++){
			if(tesinfo[i].abName==x){
				code = tesinfo[i].abCode;
				pay= tesinfo[i].aPay;
				rest=tesinfo[i].restTime;
			}
		}
		
		
		var input1 = document.createElement("input");
		input1.type="text";
		input1.name="sDate";
		input1.value=data;
		
		var input2 = document.createElement("input");
		input2.type="text";
		input2.name="abCode";
		input2.value=code;
		
		var input3 = document.createElement("input");
		input3.type="text";
		input3.name="aPay";
		input3.value=pay;
		
		var input4 = document.createElement("input");
		input4.type="text";
		input4.name="restTime";
		input4.value=rest;

		send(data, code, pay, rest);
		
	}
		
		function send(data, code, pay, rest){
		let request = new XMLHttpRequest();
	    request.onreadystatechange = function() {
	       if (this.readyState == 4 && this.status == 200) {
	    	   let jdats = decodeURIComponent(request.response);
	    	   
	    	   twogab=jdats.split("-");
	    	   let text3 = document.getElementById('text3');
			   text3.value = twogab[0];
			   
			   let text4 = document.getElementById('text4');
			   text4.value = twogab[1];
			   
	       }
		}
	    
	
		 	request.open("POST","PaySelect",true);
   		 	request.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
    		request.send("sCode=PaySelect" + "&sDate=" + data + "&abCode=" + code + "&aPay=" + pay + "&restTime=" + rest);
		}
	
	
	
</script>
</html>