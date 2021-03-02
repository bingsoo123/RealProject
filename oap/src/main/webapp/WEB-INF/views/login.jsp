<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/login.css" rel="stylesheet">
</head>
<body onLoad="message()" style="text-align: center;">


<div class="login_banner">


	<div class ="login">
		<p> <b style="font-size: 20px">알바어때?</b></p>
		<div><input type="text" name="sId" class="login_input" placeholder="아이디"></div>
		<div><input type="text" name="sPw" class="login_input" placeholder="비밀번호"></div>
		<div onClick="goLogIn()"><input type="button" class="login_btn" value="로그인"></div>
		<div onClick="goMain()"><input type="button" class="main_btn" value="메인으로"></div>
	</div>

	<div class="banner_content1"><font style="font-size: 25px"> 알바어때 하나로 충분합니다.</font>

	 <p class= "banner_content2">알바 어때는 사장님과 알바생의 일정 관리를 도와주는 웹 사이트입니다. <br>
	대충 이런 내용을 적어야 분량이 나오겠지. 더적어야되는데 멘트가 없다. <br>
	암튼 이런 내용을 채우면 괜찮을것 같습니다.
	</p>

	<img src="/resources/img/login_banner.png" width="750px" height="500px"/>
	</div>


</div>


</body>


<script>

	function message(){
		
		var msg = "${message}";
		
		if(msg != ""){
			alert(msg);
		}
		
	}

	function goLogIn(){
		
		let sId = document.getElementsByName("sId")[0];
		let sPw = document.getElementsByName("sPw")[0];
		
		let code = document.createElement("input");
		code.type="text";
		code.name="lCode";
		code.value="${lCode}";
		
		let form = document.createElement("form");
		form.action="/LogIn";
		form.method="post";
		
		form.appendChild(sId);
		form.appendChild(sPw);
		form.appendChild(code);
		
		document.body.appendChild(form);
		
		form.submit();
		
	}
	
	function goMain(){
		
		location.href="/";
	}

</script>

</html>