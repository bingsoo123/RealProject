<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/payDetail.css" rel="stylesheet" />
</head>
<body>

	<div style="width: 100%;">

		<div class="pay_top">

			<div class="detail_title">성명 : 홍길동</div>

			<div class="detail_title">직책 : 아르바이트</div>

			<div class="detail_title">기간 :2021-02-01~2021-02-10</div>

		</div>



		<div class="pay_middle">

			<div>
				<div class="detail_content">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp시급 : 8720원</div>
				<div class="detail_content">&nbsp휴게시간 : 30분</div>
			</div>

			<div>
				<div class="detail_content">근무시간 : 460분</div>
				<div class="detail_content">식대 : 10000원</div>
			</div>
		</div>



		<div class="pay_bottom">

			<div class="detail_pay">시급x(근무시간-휴게시간)(시) + 주휴수당 - 식대</div>
			<div class="detail_pay">880000원</div>

		</div>


	</div>
	
	<button onClick="check()">닫기</button>

</body>

<script>

	function check(){
		
		alert("ok");
		
	}

</script>

</html>







