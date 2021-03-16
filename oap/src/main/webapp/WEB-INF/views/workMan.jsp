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
                <div class="list" onclick="inquiery()"><img alt="알바 조회" src="/resources/img/alba_nav1.png"> <img alt="알바 조회" src="/resources/img/alba_nav1_hover.png"></div>
                <div class="list" onClick="pay()"><img alt="급여 조회" src="/resources/img/alba_nav2.png"><img alt="급여 조회" src="/resources/img/alba_nav2_hover.png"></div>
                <div class="list" onClick=""><img alt="일정조회등록" src="/resources/img/alba_nav3.png"><img alt="일정조회등록" src="/resources/img/alba_nav3_hover.png"></div>
            </div>
            <div class="serve2">
                <div class="list" onClick="loadAlbaTaskList()"><img alt="업무리스트" src="/resources/img/alba_nav4.png"><img alt="업무리스트" src="/resources/img/alba_nav4_hover.png"></div>
                <div class="list" onClick=""><img alt="이력서 관리" src="/resources/img/alba_nav5.png"><img alt="이력서 관리" src="/resources/img/alba_nav5_hover.png"></div>
                <div class="list" onClick=""><img alt="정보 수정" src="/resources/img/alba_nav6.png"><img alt="정보 수정" src="/resources/img/alba_nav6_hover.png"></div>
            </div>
        </div>

        <div class="info">
                <div class="detail_info_img"><img alt="detail_logo" src="/resources/img/manager_logo.png"></div>
                <div class="detail_if" id="albaName"></div>
                <div id="shopSelect"></div>
                <div class="detail_logOut">퇴근하기</div>
                <div class="detail_logOut">로그아웃</div>
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
		menuIndex = "inquiery";
		ajax("/AlbaList");
		
	}
	
	function pay(){
		menuIndex = "pay";
		ajax("/payCheck?abCode=${abCode}");
	}
	
	
	// 업무리스트 클릭했을 때 알바가 일하는 매장의 전체 업무리스트 가져오기
	function loadAlbaTaskList() {
		menuIndex = "loadAlbaTaskList";
		ajax("/AlbaTaskList");
		
	}
	
	
	var menuIndex = -1;
	albaInclueShopInfo(); // 이거 init에 집어넣을거임. 로그인하자마자 select에 값을 넣어줘야하니까.
	// 매장에 있는 알바생 매장 정보.

	function albaInclueShopInfo() {
		//
		let abCode = "${abCode}"; // 임의. 세션에 있는 abCode 가져오면 됌.
		let request = new XMLHttpRequest();
		request.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				let serverData = decodeURIComponent(request.response);
				let jsonData = serverData.split("_");
				
				let albaData = JSON.parse(jsonData[0]);
				let state = jsonData[1];
				
				
				console.log(albaData + "________" + jsonData[1]);
				if(state == 1){ // 알바생이 갖고있는 매장이 있을때 (일하고있는 곳이 있을때.) 
 	 				shopSelect(albaData);		
				}else{  // 알바생이 갖고있는 매장이 없을때. (0일경우..)
					albaNameDiv(albaData);
				}
				
				

			}
		};
		let mnCode = '10000000'; // 로그인한 정보 (아마 세션에있는거) 임의로 넣음
		request.open("POST", "albaInclueShopInfo", true);
		request.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
		request.send("action=albaInclueShopInfo&" + "abCode=" + abCode);
	}


	function shopSelect(albaData) {
	      // 로그인하고나서 선택을 해야하나..? 암튼 기본 선택값 (input hidden 에다가 넣어서 그걸 받아올거임.)   
	      let shopHiddenInput = document.getElementById('shopCode');
	      let albaName = document.getElementById('albaName');
	      
	      // let shCode = '100000000';
	      
	      albaName.innerHTML = albaData[0].abName + " 알바생님        <img src='/resources/img/work_check.png' width='25px' height='25px'/>";
	      
	      
	      let shopSelectContents = document.getElementById('shopSelect');
	      let shopSelectBox = document.createElement('select');
	      shopSelectBox.id = "shop_select_box"
	      shopSelectBox.className = "detail_if_select_box";
	      
	      shopSelectBox.addEventListener('change', function() {
	         albaMyShopSelectBoxOnchange(this);
	      });
		
		for(index = 0; index < albaData.length; index++){
			let shopOptionIn = document.createElement("option");
			shopOptionIn.className = "shop_select_option1";
			shopOptionIn.value = albaData[index].shCode;
			shopOptionIn.text = albaData[index].shName.replace(/\+/gi," ");
			shopSelectBox.appendChild(shopOptionIn);
		}
			shopSelectContents.appendChild(shopSelectBox);
		
		if(shopHiddenInput.value == "0"){
			shopHiddenInput.value = albaData[0].shCode;
		}

	}

	function albaMyShopSelectBoxOnchange(obj) { // shopSelect onChange
		let shopHiddenInput = document.getElementById('shopCode');
	    let shopName = obj.options[obj.selectedIndex].text;
		shopHiddenInput.value = obj.value;
		alert("shCode HiddenInput :: " + shopName + "("+ obj.value +")로 매장 변경 및 test3 영역 초기화. albaMyShopSelectBoxOnchange");
		$('#test3').empty();
		
		if(menuIndex == "inquiery"){
			inquiery();
		}else if(menuIndex == "pay"){
			pay();
		}else if(menuIndex == "loadAlbaTaskList"){
			loadAlbaTaskList();
		}
	}
	
	function albaNameDiv(albaData) {
	      let albaName = document.getElementById('albaName');
	      albaName.innerHTML = albaData[0].abName + " 알바생님        <img src='/resources/img/work_check.png' width='25px' height='25px'/>";
	}

	
	
	
	


</script>

</html>