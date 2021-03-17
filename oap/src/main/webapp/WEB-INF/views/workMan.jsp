<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/workmanTest.css" rel="stylesheet" />
<link href="/resources/css/albaApply.css" rel="stylesheet" />
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
                <div class="list" onClick="albaApply()"><img alt="알바 지원" src="/resources/img/alba_nav7.png"><img alt="알바 지원" src="/resources/img/alba_nav7_hover.png"></div>
                <div class="list" onClick=""><img alt="정보 수정" src="/resources/img/alba_nav6.png"><img alt="정보 수정" src="/resources/img/alba_nav6_hover.png"></div>
            </div>
        </div>

        <div class="info">
                <div class="detail_info_img"><img alt="detail_logo" src="/resources/img/manager_logo.png"></div>
                <div class="detail_if" id="albaName"></div>
                <div id="shopSelect"></div>
                <div class="detail_logOut" onClick="leave()">퇴근하기</div>
                <div class="detail_logOut">로그아웃</div>
                <input type="hidden" id="shopCode" value="0">
        </div>

        <div id="test3" class="test3">

        </div>

    </div>

</body>

<script>
	

	var menuIndex = -1;
	albaInclueShopInfo(); // 이거 init에 집어넣을거임. 로그인하자마자 select에 값을 넣어줘야하니까.
	// 매장에 있는 알바생 매장 정보.
	
	var lCode="${lCode}";
	var abCode = "${abCode}";
	
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
		var shCode=$("#shop_select_box option:selected").val();
		
		ajax("/AlbaTaskList?shCode="+shCode + "&abCode=" + abCode);
		
	}
	


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

	function albaApplyShopDetailInfo(shCode, applyState) {
		let abCode = '${abCode}';
//	 	alert("실행되니?" + shCode + "이건 abCode " +  abCode);
			window.open("", "pop","width=1000,height=550,left=600,top=900,toolbar=no,status=no,resizable=no");
			var form = document.createElement("form");
			form.action = "albaApplyShopDetailInfo?action=albaApplyShopDetailInfo" + "&abCode=" + abCode + "&shCode=" + shCode + "&applyState=" + applyState;
			form.method = "POST";
			form.target = "pop";
			document.body.appendChild(form);
			form.submit();
		}
		

		// 매장에 있는 알바생 매장 정보.
		
	// 내가 지원한 알바 리스트 가져오는 Ajax
	function myShopInquiry() {
		let abCode = '${abCode}'; // 세션에 있는 abCode 가져오면 됌.
		$('#alba_applyTableContent').remove();
		let request = new XMLHttpRequest();
		request.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				let jsonData = decodeURIComponent(request.response);
				let myApplyInfo = JSON.parse(jsonData);
				console.log(myApplyInfo);
				myShopInquiryList(myApplyInfo);
			}
		};
		request.open("POST", "albaApplyMyShopInquiry", true);
		request.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
		request.send("action=albaApplyMyShopInquiry&" + "abCode=" + abCode);
	}
	
	// 내가 지원한 알바 지원 리스트
	function myShopInquiryList(applyInfo) {
		$('#albaApply_contents').remove();
		let mainTest = document.getElementById('test3');
		
		let applyState = "myShopInquiry"; // 이미 지원한 리스트여서 수정,삭제 버튼만 뜨게 처리하려고 만듬.
		
		let albaAddContents = document.createElement('div');
		albaAddContents.className = "albaApply_contents";
		albaAddContents.setAttribute("id","albaApply_contents");
		for (i = 0; i < applyInfo.length; i++) {
			let index = i;	
			let albaRow1 = document.createElement('div');
			albaRow1.className = "albaAdd_contents_row1";

			let albaRow = document.createElement('div');
			albaRow.className = "albaAdd_contents_row";

			albaRow.addEventListener('click', function() {
				albaApplyShopDetailInfo(applyInfo[index].shCode,applyState);
			});
			
	
			let albaGender = document.createElement("img");
			albaGender.className = "albaAddImg1";
			albaGender.src = "/resources/img/alba_nav7_hover.png";
			albaRow.appendChild(albaGender);
			let abName = document.createElement('p');
			abName.className = "albaAdd_name1";
			abName.textContent = applyInfo[i].shName.replace(/\+/gi, " ");
			albaRow.appendChild(abName);

			let albaPhone = document.createElement('div');
			albaPhone.className = "albaAdd_phone";
			albaPhone.textContent = applyInfo[i].shTel;
			albaRow.appendChild(albaPhone);

			let albaAddr = document.createElement('p');
			albaAddr.textContent = applyInfo[i].shAddr.replace(/\+/gi, " ");
			albaRow.appendChild(albaAddr);
			
			
			albaRow1.appendChild(albaRow);
			
			albaAddContents.appendChild(albaRow1);

		}
		mainTest.appendChild(albaAddContents);
		
		
	}

	
	
	// 알바 지원 메뉴
	function albaApply() {
		menuIndex = "albaApply";
		let shopHiddenInput = document.getElementById('shopCode');
		
		let request = new XMLHttpRequest();
	    request.onreadystatechange = function() {
	       if (this.readyState == 4 && this.status == 200) {
	    	   let json = decodeURIComponent(request.response);
			   let shopData = JSON.parse(json);
			   albaApplyShopInfo(shopData);
	       }
		}
		request.open("POST","albaApply",true);
		request.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
		request.send("action=albaApply");
	}
	
	function albaApplyShopInfo(shopData) {
		$('#test3').empty();
		let applyState = "albaApplyShopInfo"; 
		let mainTest = document.getElementById('test3');
		
	    let applyNavDiv = document.createElement('div');
	    applyNavDiv.className = "apply_nav_div";
	    

	    
	    let applyUl = document.createElement('ul');
	    applyUl.className = "apply_ul";
	    let applyLi1 = document.createElement('li');
	    applyLi1.textContent = "전체 매장 리스트";
	    
	    applyLi1.addEventListener('click', function() {
	    	albaApply();
        });
	    
	    let applyLi2 = document.createElement('li');
	    applyLi2.textContent = "내가 지원한 매장 리스트";
	    
	    
	    applyLi2.addEventListener('click', function() {
	    	myShopInquiry();
        });
	    
	    applyUl.appendChild(applyLi1);
	    applyUl.appendChild(applyLi2);
	    
	    applyNavDiv.appendChild(applyUl);
	    mainTest.appendChild(applyNavDiv);
	    
	    let divTableContent = document.createElement('div');
	    divTableContent.className = "alba_apply_table_content";
	    divTableContent.setAttribute("id","alba_applyTableContent")
	    
	    let divTable = document.createElement('div');
	    divTable.className = "alba_apply_table";
	    
	    let divRow1 = document.createElement('div');
		divRow1.className = "alba_apply_table_head_row";
		
		
		
	    let divTCell1 = document.createElement('div');
	    divTCell1.setAttribute("style", "display:table-cell");
	    divTCell1.textContent = "매장명";
	    
	    
	    let divTCell3 = document.createElement('div');
	    divTCell3.setAttribute("style", "display:table-cell");
	    divTCell3.textContent = "주소";
	    let divTCell4 = document.createElement('div');
	    divTCell4.setAttribute("style", "display:table-cell");
	    divTCell4.textContent = "연락처";
	    
	    divRow1.appendChild(divTCell1);
	    divRow1.appendChild(divTCell3);
	    divRow1.appendChild(divTCell4);
	    
	    divTable.appendChild(divRow1);
	    
	    for (index = 0; index < shopData.length; index++){
			let i = index;
			let divRow = document.createElement('div');
			divRow.setAttribute("style", "display:table-row");
			divRow.className = "alba_apply_table_row";
			divRow.addEventListener('click', function() {
			var shopPrompt = confirm(shopData[i].shName + "에 지원하시겠습니까?");
				if(shopPrompt == true){
					albaApplyShopDetailInfo(shopData[i].shCode, applyState);
				}
				
			});
			
		    let testDiv = document.createElement('div');
		   	testDiv.className = "alba_apply_table_head_cell1";
		    testDiv.textContent = shopData[index].shType.replace(/\+/gi," ") + "\n";
		   
		    let divCell1 = document.createElement('div');
		    divCell1.textContent = shopData[index].shName.replace(/\+/gi," ");
		    divCell1.className = "alba_apply_table_head_cell1_shop_name";
		    testDiv.appendChild(divCell1);
		    
		    let divCell3 = document.createElement('div');
		    divCell3.setAttribute("style", "display:table-cell");
		    divCell3.textContent = shopData[index].shAddr.replace(/\+/gi," ");
		    divCell3.className = "alba_apply_table_head_cell3";
		    
		    let divCell4 = document.createElement('div');
		    divCell4.setAttribute("style", "display:table-cell");
		    divCell4.textContent = shopData[index].shTel;
		    divCell4.className = "alba_apply_table_head_cell4";
		    
		    divRow.appendChild(testDiv);
		    divRow.appendChild(divCell3);
		    divRow.appendChild(divCell4);
		    
		    divTable.appendChild(divRow);
		    
		}
	    
	    divTableContent.appendChild(divTable);
	    mainTest.appendChild(divTableContent);
		
	}	





</script>

</html>