<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/workMan.css" rel="stylesheet" />
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body onLoad="workDiary()">
	
	<div>

		<div class="test1">

			<ul class="nav-container">

				<li><a href="#"><img src="/resources/img/logo_1.png"
						width="100px" height="100px"></a></li>
				<li class="nav-item"><a href="/Manage">관리</a></li>
				<li class="nav-item"><a href="/Regist">등록</a></li>
				<li class="nav-item"><a href="javascript:leave();">퇴근하기</a></li>

			</ul>

		</div>


		<div class="two">

			<div class="test2">
				<div class="list" onClick="inquiery()">알바조회</div>
				<div class="list" onClick="pay()">급여조회</div>
				<div class="list">일정조회 * 등록</div>
				<div class="list">이력서 관리</div>
				<div class="list">업무 리스트</div>
				<div class="list">정보수정</div>

			</div>

			<div id="test3" class="test3" style="position: relative;">

			</div>

		</div>
	</div>

</body>

<script>
	
	var lCode="${lCode}";
	
	var popupWidth = 690;
	var popupHeight = 590;

	var popupX = (window.screen.width / 2) - (popupWidth / 2);
	// 만들 팝업창 width 크기의 1/2 만큼 보정값으로 빼주었음

	var popupY= (window.screen.height / 2) - (popupHeight / 2) - 100;
	// 만들 팝업창 height 크기의 1/2 만큼 보정값으로 빼주었음
	
	function workDiary(){
		window.open("/TestWork?lCode=${lCode}&tCode=start","근무일지",'status=no , height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);
	}

	function leave(){
		window.open("/LeaveWork?lCode=${lCode}&tCode=end","근무일지",'status=no , height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);
	}
	
	function ajax(action){
		
	    $.ajax({
	        type:"GET",
	        url:action,
	        dataType : "html",
	        success: function(data){
	            $(".test3").html(data);
	            init();
	        }
	    });      

		
		
	}
	
	function inquiery(){
		
		ajax("/AlbaList");
		
	}
	
	function pay(){
		
		ajax("/payCheck");
	}
	
	
	
	


</script>

</html>