<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Home</title>
<link href="resources/css/home.css" rel="stylesheet">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script> 
</head>
<body onLoad="init()">
	<nav class = "container">
		<ul class="nav-container">
			<li><a href="/"><img src="/resources/img/logo.png" width="228px" height="62px"></a></li>
			<li class="nav-item"><div class="show" onclick="fnMove(0)">오시는길</div></li>
			<li class="nav-item"><a href="#">사용후기</a></li>
			<li class="nav-item"><a href="#">주요 기능</a></li>
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
					<img src="/resources/img/main_title2.png" width="600px" height="400px"/>        <!-- 519  258        750  503 -->
				</div>
			</div>
			<div class="main_btn">
				<a class="login_btn" href="/LogInForm?lCode=manage"><img src="/resources/img/admin_btn.png" width="120px" height="120px"></a>
				<a class="alba_btn" href="/LogInForm?lCode=alba"><img src="/resources/img/alba_btn.png" width="120px" height="120px"></a>
				<a class="register_btn" href="/JoinForm?sCode=JoinForm"><img src="/resources/img/register_btn2.png" width="120px" height="120px"></a>
			</div>
		</div>
	</section>
	<div class="container">
		<section>
			<div id="comment"></div>
			<div id="map"></div>
			<a href="http://kko.to/jaxXKOIDB" target="_blank" title="다음 지도로 연결 "><div class="btn_Yellow">다음지도로 연결</div></a>
			<div id="howTo"></div>
			
				<div class="come">□ 대중교통 이용 하실 때</div>
					<div class="traffic"></div>
					
				<div class = "bus">
				<ul>버스 이용시</ul>
				<dd>영남아파트 하차:도보 1분거리</dd>
				<dt>4,5번</dt>
				<dd>신동아아파트 하차:도보 4분거리</dd>
				<dt>111-2,46,520번 </dt>
				</div>
				<div class="train">
				<ul>지하철 이용시</ul>
				<dd>인천종합터미널역</dd> 
				<dt>2번출구 → 도보1분거리 종합터미널정류장 승차 → 4,5번 버스 승차 → 영남아파트 하차 → 도보 1분거리</dt>
				<dd>인하대역</dd> 
				<dt>7번출구 → 46,112-2번 버스 승차 → 신동아아파트 하차 → 홈플러스익스프레스 방향 도보 2분거리</dt>
				</div>
				
		
		</section>
	</div>
	
	

</body>
<!-- 카카오 지도 api -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c12ddaa519ac1f1f821e84ef032ac15d&libraries=services"></script>
<!--	ease효과를 주기 위한 라이브러리	  -->
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>

<script>

	function fnMove(n) {
		$('html, body').stop().animate({
			scrollTop : $('.container section').eq(n).offset().top
		}, 1000, 'easeOutElastic');
	}

	function init() {
		let section = document.getElementById('comment');
		let comment = document.createElement('div');
		//오시는 길
		comment.textContent = "오시는 길";
		comment.style.fontSize = "40px";
		comment.style.fontWeigth = "bold";
		comment.style.fontFamily = "'Noto Sans KR', sans-serif";
		section.appendChild(comment);
		//주소박스
		let way = document.getElementById('howTo');
		way.style.display = "flex";
		way.style.margin = "0px 0px 20px 200px";
		way.style.verticalAlign = "middle";
		//주소아이콘
		let wayimg = document.createElement('img');
		wayimg.src = "/resources/img/map.png";
		wayimg.style.margin = "auto 0px";
		wayimg.style.width = "30px";
		wayimg.style.height = "30px";
		//주소
		let wayTo = document.createElement('div');
		wayTo.textContent = " 인천광역시 미추홀구 매소홀로 488번길 6-32";
		wayTo.style.margin = "10px  400px 10px 5px";
		wayTo.style.fontSize = "25px";
		wayTo.style.fontWeigth = "bold";
		//전화아이콘
		let telimg = document.createElement('img');
		telimg.src = "/resources/img/phone.png";
		telimg.style.margin = "auto 0px";
		telimg.style.width = "30px";
		telimg.style.height = "30px";
		//전화번호
		let tel = document.createElement('div');
		tel.textContent = "TEL) 032-876-3332";
		tel.style.margin = "10px  50px 10px 5px";
		tel.style.fontFamily = "'Noto Sans KR', sans-serif";
		tel.style.fontSize = "25px";
		tel.style.fontWeigth = "bold";

		way.appendChild(wayimg);
		way.appendChild(wayTo);
		way.appendChild(telimg);
		way.appendChild(tel);
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 

		mapOption = {
			center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 2
		// 지도의 확대 레벨

		};

		mapContainer.style.display = "block";
		mapContainer.style.width = "1400px";
		mapContainer.style.margin = "0px 0px 0px 200px";
		mapContainer.style.height = "500px";

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();

		// 주소로 좌표를 검색합니다
		geocoder
				.addressSearch(
						'인천광역시 미추홀구 매소홀로488번길 6-32 ',
						function(result, status) {

							// 정상적으로 검색이 완료됐으면 
							if (status === kakao.maps.services.Status.OK) {

								var coords = new kakao.maps.LatLng(result[0].y,
										result[0].x);

								// 결과값으로 받은 위치를 마커로 표시합니다
								var marker = new kakao.maps.Marker({
									map : map,
									position : coords
								});

								// 인포윈도우로 장소에 대한 설명을 표시합니다
								var infowindow = new kakao.maps.InfoWindow(
										{
											content : '<div style="text-align:center;"><span style="width:100px;text-align:center;padding:6px 0;">(주)알바어때</span></div><span> 인천광역시 미추홀구 매소홀로 488번길 6-32</div>'

										});
								infowindow.open(map, marker);
								// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
								var mapTypeControl = new kakao.maps.MapTypeControl();

								// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
								// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
								map.addControl(mapTypeControl,
										kakao.maps.ControlPosition.TOPRIGHT);

								// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
								var zoomControl = new kakao.maps.ZoomControl();
								map.addControl(zoomControl,
										kakao.maps.ControlPosition.RIGHT);

								// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
								map.setCenter(coords);
							}
						});

	}
</script>




</html>
