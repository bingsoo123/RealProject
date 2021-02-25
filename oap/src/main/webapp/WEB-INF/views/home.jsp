<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Home</title>
<link href="resources/css/home.css" rel="stylesheet">
</head>
<body>
	<nav class = "container">
		<ul class="nav-container">
			<li><a href="#"><img src="/resources/img/logo.png" width="228px" height="62px"></a></li>
			<li class="nav-item"><a href="#">오시는길</a></li>
			<li class="nav-item"><a href="#">사용후기</a></li>
			<li class="nav-item"><a href="#">주요 기능</a></li>
			<li class="nav-item-regist"><a href="/LogInForm?sCode=3"><img class="test1" src="/resources/img/register_btn.png" width="140px" height="50px"></a></li>
		</ul>
		
		
	</nav>
	<section class="section">
		<div class="main">
			<div class="main_image">
				<span class = "main_title">알바어때?</span><br>
				<span class = "main_title_contents1">생활의 질이 올라갑니다. </span>
				<div class="main_title1">
					<img src="/resources/img/main_title1.png" width="519px" height="258px"/>
				</div>
				<div class="main_title2">
					<img src="/resources/img/main_title2.png" width="750px" height="503px"/>
				</div>
			</div>
			<div class="main_btn">
				<a class="login_btn" href="/LogInForm?sCode=1"><img src="/resources/img/admin_btn.png" width="120px" height="120px"></a>
				<a class="alba_btn" href="/LogInForm?sCode=2"><img src="/resources/img/alba_btn.png" width="120px" height="120px"></a>
				<a class="register_btn" href="/LogInForm?sCode=3"></a><img src="/resources/img/register_btn2.png" width="120px" height="120px"></a>
			</div>
		</div>
	</section>
	
	

</body>
</html>
