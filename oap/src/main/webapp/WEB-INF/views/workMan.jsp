<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/workmanTest.css" rel="stylesheet" />
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body onLoad="workDiary()">


    <div class="two">
        <div class="test2">
            <div class="head"><img alt="알바어때 ?" src="/resources/img/Main_logo.png"></div>
            <div class="serve">
                <div class="list" onclick="inquiery()"><img alt="알바 조회" src="/resources/img/alba_nav1.png"></div>
                <div class="list" onClick="pay()"><img alt="급여 조회" src="/resources/img/alba_nav2.png"></div>
                <div class="list" onClick=""><img alt="일정조회등록" src="/resources/img/alba_nav3.png"></div>
            </div>
            <div class="serve2">
                <div class="list" onClick="loadAlbaTaskList()"><img alt="업무리스트" src="/resources/img/alba_nav4.png"></div>
                <div class="list" onClick=""><img alt="이력서 관리" src="/resources/img/alba_nav5.png"></div>
                <div class="list" onClick=""><img alt="정보 수정" src="/resources/img/alba_nav6.png"></div>
            </div>
        </div>

        <div class="info">
                <div class="detail_info_img"><img alt="detail_logo" src="/resources/img/manager_logo.png"></div>
                <div class="detail_if">서알바 알바생님&nbsp&nbsp<img src="/resources/img/work_check.png" width="25px" height="25px"/></div>
                <div class="detail_if">ICIA 인천일보 &nbsp&nbsp ▼</div>
                <div class="detail_logOut">로그아웃</div>
                <div id="mangerName"></div>
                <div class="shopSelect" id="shopSelect"></div>
                <input type="hidden" id="shopCode" value="0">
        </div>

        <div id="test3" class="test3">

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
	        type:"POST",
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
		ajax("/payCheck?abCode=${abCode}");
	}
	
	
	// 업무리스트 클릭했을 때 알바가 일하는 매장의 전체 업무리스트 가져오기
	function loadAlbaTaskList() {
		
		ajax("/AlbaTaskList");
		
	}
	
	
	
	


</script>

</html>