<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0 ,minimum-scale=1.0">
<title>Insert title here</title>
<link href="/resources/css/addAlba.css" rel="stylesheet" />
</head>
<body>

	<div class="all">
		
		<label>매장</label>&emsp;&emsp;&nbsp;
		<input type="text" name="store" class="store" readonly/>
		<br/><br/><br/>
			
		<label>알바생ID</label>&nbsp;
		<input type="text" name="albaid" class="albaid" placeholder="아이디를 적어주세요." >
		<br/><br/><br/>
		
		<label>상태</label>&emsp;&emsp;&nbsp;
		<select class="select">
			<option for="none">선택하세요.</option>
			<option for="관리자">M</option>
			<option for="부관리자">BM</option>
			<option for="알바생">A</option>
		</select>
		<br/><br/><br/>
		
		<label>사진</label>&emsp;&emsp;&nbsp;
		<input type="text" id="filename" class="file_input_textbox" readonly>
		<div class="file_input_div">
			<img src="/resources/images/open.jpg" class="file_input_img_btn" alt="open">
			<input type="file" id="ff" name="file_1" class="file_input_hidden" onchange="test()">
		</div>
		
	</div>
<button onclick="myFunction()">Try it</button>
</body>


<script>
function test(){
	var fname = document.getElementById('filename');
	var tt = document.getElementById('ff').value;
	var ab = tt.split("\\");
	fname.value += ab[2];
}


function myFunction() {
  var test = window.open("http://192.168.1.111/", "testWindow", "width=500,height=600");
}
</script>