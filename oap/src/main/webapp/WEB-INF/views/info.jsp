<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
<style>
</style>
<link href="/resources/css/info.css" rel="stylesheet" />
</head>
<body>
	<!-- 검색 버튼 -->
	<!-- this.style.backgroundImage="url()"; javascript 백그라운드 이미지 클릭시 onClick 작동 구문 활용 -->
	<div class="search">
		<input type="text" placeholder="이름 검색" />
	</div>

	<!-- 프로필 2개씩 묶는 div -->
	<div class="two">

		<!-- 프로필 전체 박스 -->
		<div class="profile-one">

			<!-- 왼쪽 박스(사진, 이름) -->
			<div class="profile-left">
				<div>
					<img class="profile-pic" title="프로필 사진입니다." alt="프로필 사진입니다."
						src="/resources/img/제니.jpg">
				</div>

				<div>제니</div>
			</div>

			<!-- 오른쪽 박스(세부사항) -->
			<div>
				<p>
					근무시간 : 09:00 ~ 14:00 <br>
				<p>
					시급 : 8,720 원 <br>
				<p>전화번호 : 010-1234-4321
			</div>

		</div>

		<!-- 프로필 전체 박스 -->
		<div class="profile-one">

			<!-- 왼쪽 박스(사진, 이름) -->
			<div class="profile-left">
				<div>
					<img class="profile-pic" title="프로필 사진입니다." alt="프로필 사진입니다."
						src="/resources/img/차은우.jpg">
				</div>

				<div>은우</div>
			</div>

			<!-- 오른쪽 박스(세부사항) -->
			<div>
				<p>
					근무시간 : 14:00 ~ 22:00 <br>
				<p>
					시급 : 8,720 원 <br>
				<p>전화번호 : 010-1234-4321
			</div>
		</div>
	</div>



	<div class="two">
		<!-- 프로필 전체 박스 -->
		<div class="profile-one">

			<!-- 왼쪽 박스(사진, 이름) -->
			<div class="profile-left">
				<div>
					<img class="profile-pic" title="프로필 사진입니다." alt="프로필 사진입니다."
						src="/resources/img/지효.jpg">
				</div>

				<div>지효</div>
			</div>

			<!-- 오른쪽 박스(세부사항) -->
			<div>
				<p>
					근무시간 : 09:00 ~ 14:00 <br>
				<p>
					시급 : 8,720 원 <br>
				<p>전화번호 : 010-1234-4321
			</div>
		</div>

		<!-- 프로필 전체 박스 -->
		<div class="profile-one">

			<!-- 왼쪽 박스(사진, 이름) -->
			<div class="profile-left">
				<div>
					<img class="profile-pic" title="프로필 사진입니다." alt="프로필 사진입니다."
						src="/resources/img/지수.jpg">
				</div>

				<div>지수</div>
			</div>

			<!-- 오른쪽 박스(세부사항) -->
			<div>
				<p>
					근무시간 : 09:00 ~ 14:00 <br>
				<p>
					시급 : 8,720 원 <br>
				<p>전화번호 : 010-1234-4321
			</div>
		</div>
	</div>

</body>
</html>
