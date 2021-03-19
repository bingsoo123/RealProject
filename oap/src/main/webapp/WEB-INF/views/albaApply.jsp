<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>albaApply</title>
<link href="/resources/css/albaApply.css" rel="stylesheet" />
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
</head>
<body onload="albaApplyShopDetailInfo()">
	<div class="albaApplyDiv" id="albaApplyDiv"></div>
</body>

<script>

	function albaApplyMyInfoUpdateComplete(albaInfo, selectData) {
		let selectSplit = selectData.split("_");
		let acBankName = selectSplit[0];
		let acAccount = selectSplit[1];
		let shCode = albaInfo[0].shCode;
		let abCode = albaInfo[0].abCode;
		
		let request = new XMLHttpRequest();
		request.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				let jsonData = decodeURIComponent(request.response);
		    	if(jsonData=="noSession"){
		    		 location.href="/LogInForm?lCode=alba";
		        }		
				let updateState = JSON.parse(jsonData);
				if(updateState == "updateComplete"){
					alert("계좌 수정이 완료 되었습니다.")
				}else{
					alert("시스템이 불안정합니다. 다시 시도해주세요.");
				}
				console.log(updateState);
				window.close();
			}
		}
		request.open("POST", "albaApplyMyAccountUpdate", true);
		request.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded;charset=UTF-8");
		request.send("action=albaApplyMyAccountUpdate&shCode=" + shCode + "&abCode="+ abCode +"&acBankName="+acBankName + "&acAccount=" + acAccount);
	}
	
	function albaApplyMyInfoUpdateStep(shCode,abCode) {
		let request = new XMLHttpRequest();
		request.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				let jsonData = decodeURIComponent(request.response);
		    	if(jsonData=="noSession"){
		    		 location.href="/LogInForm?lCode=alba";
		        }		
				let albaInfo = JSON.parse(jsonData);
				console.log(albaInfo);
				albaApplyMyInfoUpdateStep2(albaInfo);
			}
		}
		request.open("POST", "albaApplyShopMyInfo", true);
		request.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded;charset=UTF-8");
		request.send("action=albaApplyShopMyInfo&shCode=" + shCode + "&abCode="+ abCode);
	
	}
	function albaApplyMyInfoUpdateStep2(albaInfo) {
		$('#albaApplyDiv').empty();
		console.log(albaInfo);
		let al = document.getElementById('albaApplyDiv');
		let albaAddContents = document.createElement('div');
		albaAddContents.className = "albaAdd_contents1";

		let albaAddContentsLeft = document.createElement('div');
		albaAddContentsLeft.className = "albaAdd_left_content";

		let albaGender = document.createElement("img");
		albaGender.className = "albaAddImg";
		if (albaInfo[0].abGender == "M") {
			albaGender.src = "/resources/img/M.png";
		} else if (albaInfo[0].abGender == "F") {
			albaGender.src = "/resources/img/F.png";
		}

		let albaAddName = document.createElement("p");
		albaAddName.className = "albaAdd_name";
		albaAddName.textContent = albaInfo[0].abName;

		albaAddContentsLeft.appendChild(albaGender);
		albaAddContentsLeft.appendChild(albaAddName);
		albaAddContents.appendChild(albaAddContentsLeft);

		let albaAddContentsRight = document.createElement('div');
		albaAddContentsRight.className = "albaAdd_right_content";

		let albaAddTitle = document.createElement('div');
		albaAddTitle.className = "albaAdd_naeyong_title";
		albaAddTitle.textContent = "생년월일";
		let albaAddNaeyong = document.createElement('div');
		albaAddNaeyong.className = "albaAdd_naeyong";
		albaAddNaeyong.textContent = albaInfo[0].abBirth;

		albaAddContentsRight.appendChild(albaAddTitle);
		albaAddContentsRight.appendChild(albaAddNaeyong);

		let albaAddTitle1 = document.createElement('div');
		albaAddTitle1.className = "albaAdd_naeyong_title";
		albaAddTitle1.textContent = "전화번호";
		let albaAddNaeyong1 = document.createElement('div');
		albaAddNaeyong1.className = "albaAdd_naeyong";
		albaAddNaeyong1.textContent = albaInfo[0].abPhone;

		albaAddContentsRight.appendChild(albaAddTitle1);
		albaAddContentsRight.appendChild(albaAddNaeyong1);

		let albaAddTitle2 = document.createElement('div');
		albaAddTitle2.className = "albaAdd_naeyong_title";
		albaAddTitle2.textContent = "주소";
		let albaAddNaeyong2 = document.createElement('div');
		albaAddNaeyong2.className = "albaAdd_naeyong";
		albaAddNaeyong2.textContent = albaInfo[0].abAddr.replace(/\+/gi, " ");

		albaAddContentsRight.appendChild(albaAddTitle2);
		albaAddContentsRight.appendChild(albaAddNaeyong2);

		let albaAddTitle3 = document.createElement('div');
		albaAddTitle3.className = "albaAdd_naeyong_title";
		albaAddTitle3.textContent = "이메일";
		let albaAddNaeyong3 = document.createElement('div');
		albaAddNaeyong3.className = "albaAdd_naeyong";
		albaAddNaeyong3.textContent = albaInfo[0].abEmail;

		albaAddContentsRight.appendChild(albaAddTitle3);
		albaAddContentsRight.appendChild(albaAddNaeyong3);

		let albaAddTitle8 = document.createElement('div');
		albaAddTitle8.className = "albaAdd_naeyong_title";
		albaAddTitle8.textContent = "계좌 번호";
		let albaAddNaeyong8 = document.createElement('div');
		albaAddNaeyong8.className = "albaAdd_naeyong";
		albaAddNaeyong8.textContent = "[" + albaInfo[0].ssBankName + "]   "
		+ albaInfo[0].ssAccount;

		albaAddContentsRight.appendChild(albaAddTitle8);
		albaAddContentsRight.appendChild(albaAddNaeyong8);
		
		
		let albaBtnContent = document.createElement('div');
		albaBtnContent.className = "albaAdd_btn_content1";

		let albaPrevBtn = document.createElement('button');
		albaPrevBtn.className = "albaAdd_prev_btn";
		let albaPrevBtnText = document.createTextNode('이전 페이지');
		albaPrevBtn.appendChild(albaPrevBtnText);

		albaPrevBtn.addEventListener('click', function() { // 이전..
			window.location.reload();
		});
		
		
		let albaUpdateBtn = document.createElement('button');
		albaUpdateBtn.className = "albaAdd_btn";
		albaUpdateBtn.id = "albaUpdateBtn";
		let albaUpdateBtnText = document.createTextNode('계좌 수정');
		albaUpdateBtn.appendChild(albaUpdateBtnText);
		

		albaUpdateBtn.addEventListener('click',function() {
			$('#albaUpdateBtn').remove();
			$('#accountSelect').remove();
			let albaAddTitle7 = document.createElement('div');
			albaAddTitle7.className = "albaAdd_naeyong_title";
			albaAddTitle7.textContent = "수정할 나의 계좌 번호";

			let accountSelect = document.createElement('select');
			accountSelect.className = "accountSelect";
			accountSelect.id = "accountSelect";
			
			for (index = 0; index < albaInfo.length; index++) {
				let i = index;
				let albaOptionIn = document.createElement("option");
				albaOptionIn.value = albaInfo[index].acBankName + "_"
						+ albaInfo[index].acAccount;
				albaOptionIn.text = "[" + albaInfo[index].acBankName + "]   "
						+ albaInfo[index].acAccount;
				accountSelect.appendChild(albaOptionIn);
			}

			albaAddContentsRight.appendChild(albaAddTitle7);
			albaAddContentsRight.appendChild(accountSelect);

			///////////////
			
			let albaAddBtn = document.createElement('button');
			albaAddBtn.className = "albaAdd_btn";
			let albaAddBtnText = document.createTextNode('수정 완료');
			albaAddBtn.appendChild(albaAddBtnText);

			albaAddBtn.addEventListener('click',function() { // 추가
				let accountSelectBox = document.getElementById("accountSelect");
				let selectData = accountSelectBox.options[accountSelectBox.selectedIndex].value;
				// selectData
				albaApplyMyInfoUpdateComplete(albaInfo, selectData);
			});
			albaBtnContent.appendChild(albaAddBtn);
			
			
		});
		
		
		albaAddContents.appendChild(albaAddContentsRight);
		albaBtnContent.appendChild(albaPrevBtn);
		albaBtnContent.appendChild(albaUpdateBtn);


		albaAddContents.appendChild(albaBtnContent);
		al.appendChild(albaAddContents);

	}
	
	

	function albaApplyMyInfo(shCode, abCode) {
		let request = new XMLHttpRequest();
		request.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				let json = decodeURIComponent(request.response);
		    	if(json=="noSession"){
		    		 location.href="/LogInForm?lCode=alba";
		        }		
				let jsonData = JSON.parse(json);

				albaApplyMyLastStep(jsonData);

			}
		}
		request.open("POST", "albaApplyMyInfo", true);
		request.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded;charset=UTF-8");
		request.send("action=albaApplyMyInfo&shCode=" + shCode + "&abCode="
				+ abCode);
	}

	function albaApplyMyLastStep(albaInfo) {
		$('#albaApplyDiv').empty();
		console.log(albaInfo);
		let al = document.getElementById('albaApplyDiv');
		let albaAddContents = document.createElement('div');
		albaAddContents.className = "albaAdd_contents1";

		let albaAddContentsLeft = document.createElement('div');
		albaAddContentsLeft.className = "albaAdd_left_content";

		let albaGender = document.createElement("img");
		albaGender.className = "albaAddImg";
		if (albaInfo[0].abGender == "M") {
			albaGender.src = "/resources/img/M.png";
		} else if (albaInfo[0].abGender == "F") {
			albaGender.src = "/resources/img/F.png";
		}

		let albaAddName = document.createElement("p");
		albaAddName.className = "albaAdd_name";
		albaAddName.textContent = albaInfo[0].abName;

		albaAddContentsLeft.appendChild(albaGender);
		albaAddContentsLeft.appendChild(albaAddName);
		albaAddContents.appendChild(albaAddContentsLeft);

		let albaAddContentsRight = document.createElement('div');
		albaAddContentsRight.className = "albaAdd_right_content";

		let albaAddTitle = document.createElement('div');
		albaAddTitle.className = "albaAdd_naeyong_title";
		albaAddTitle.textContent = "생년월일";
		let albaAddNaeyong = document.createElement('div');
		albaAddNaeyong.className = "albaAdd_naeyong";
		albaAddNaeyong.textContent = albaInfo[0].abBirth;

		albaAddContentsRight.appendChild(albaAddTitle);
		albaAddContentsRight.appendChild(albaAddNaeyong);

		let albaAddTitle1 = document.createElement('div');
		albaAddTitle1.className = "albaAdd_naeyong_title";
		albaAddTitle1.textContent = "전화번호";
		let albaAddNaeyong1 = document.createElement('div');
		albaAddNaeyong1.className = "albaAdd_naeyong";
		albaAddNaeyong1.textContent = albaInfo[0].abPhone;

		albaAddContentsRight.appendChild(albaAddTitle1);
		albaAddContentsRight.appendChild(albaAddNaeyong1);

		let albaAddTitle2 = document.createElement('div');
		albaAddTitle2.className = "albaAdd_naeyong_title";
		albaAddTitle2.textContent = "주소";
		let albaAddNaeyong2 = document.createElement('div');
		albaAddNaeyong2.className = "albaAdd_naeyong";
		albaAddNaeyong2.textContent = albaInfo[0].abAddr.replace(/\+/gi, " ");

		albaAddContentsRight.appendChild(albaAddTitle2);
		albaAddContentsRight.appendChild(albaAddNaeyong2);

		let albaAddTitle3 = document.createElement('div');
		albaAddTitle3.className = "albaAdd_naeyong_title";
		albaAddTitle3.textContent = "이메일";
		let albaAddNaeyong3 = document.createElement('div');
		albaAddNaeyong3.className = "albaAdd_naeyong";
		albaAddNaeyong3.textContent = albaInfo[0].abEmail;

		albaAddContentsRight.appendChild(albaAddTitle3);
		albaAddContentsRight.appendChild(albaAddNaeyong3);

		let albaAddTitle7 = document.createElement('div');
		albaAddTitle7.className = "albaAdd_naeyong_title";
		albaAddTitle7.textContent = "나의 계좌 번호";

		let accountSelect = document.createElement('select');
		accountSelect.className = "accountSelect";
		accountSelect.id = "accountSelect";
		for (index = 0; index < albaInfo.length; index++) {
			let i = index;
			let albaOptionIn = document.createElement("option");
			albaOptionIn.value = albaInfo[index].acBankName + "_"
					+ albaInfo[index].acAccount;
			albaOptionIn.text = "[" + albaInfo[index].acBankName + "]   "
					+ albaInfo[index].acAccount;
			accountSelect.appendChild(albaOptionIn);
		}

		albaAddContentsRight.appendChild(albaAddTitle7);
		albaAddContentsRight.appendChild(accountSelect);

		albaAddContents.appendChild(albaAddContentsRight);

		let albaBtnContent = document.createElement('div');
		albaBtnContent.className = "albaAdd_btn_content1";

		let albaPrevBtn = document.createElement('button');
		albaPrevBtn.className = "albaAdd_prev_btn";
		let albaPrevBtnText = document.createTextNode('이전 페이지');
		albaPrevBtn.appendChild(albaPrevBtnText);

		albaPrevBtn.addEventListener('click', function() { // 이전..
			window.location.reload();
		});
		
		let albaAddBtn = document.createElement('button');
		albaAddBtn.className = "albaAdd_btn";
		let albaAddBtnText = document.createTextNode('완료');
		albaAddBtn.appendChild(albaAddBtnText);
		
		albaAddBtn.addEventListener('click',function() { // 추가
			let accountSelectBox = document.getElementById("accountSelect");
			let selectData = accountSelectBox.options[accountSelectBox.selectedIndex].value;
			// selectData
			albaApplyComplete(albaInfo, selectData);
		});
		albaBtnContent.appendChild(albaPrevBtn);
		albaBtnContent.appendChild(albaAddBtn);
		albaAddContents.appendChild(albaBtnContent);
		al.appendChild(albaAddContents);

	}
	
	function albaApplyComplete(albaInfo, selectData) {
		let selectSplit = selectData.split("_");
		let acBankName = selectSplit[0];
		let acAccount = selectSplit[1];
		let shCode = albaInfo[0].shCode;
		let abCode = albaInfo[0].abCode;
		let request = new XMLHttpRequest();
		request.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				let insertState = decodeURIComponent(request.response);
		    	if(insertState=="noSession"){
		    		 location.href="/LogInForm?lCode=alba";
		        }		
				if(insertState == "1"){
					alert("알바 지원을 성공하셨습니다. " + albaInfo[0].abName +"님 합격을 기원합니다!")
					window.close();
				}else if(insertState == "-1"){
					alert(albaInfo[0].shName + "는 이미 근무중인 장소 입니다. 이 창을 닫습니다.");
					window.close();
				}else{
					alert("서비스가 불안정합니니니다. 다시 시도해주세요.");
					window.location.reload();
				}
			}
		}
		request.open("POST", "albaApplyComplete", true);
		request.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
		request.send("action=albaApplyComplete&shCode=" + shCode + "&abCode=" + abCode + "&acBankName=" + acBankName + "&acAccount="+ acAccount);
		
		
	}
	

	function albaApplyShopDetailInfo() {
		let JsonData = '${albaShopDetailInfo }';
		let shopData = JSON.parse(JsonData);
		if (shopData == "alreayApplyClose") {
			alert("이미 지원한 매장입니다.");
			window.close();
		} else {
			// 	$('#albaApplyDiv').empty();
			let al = document.getElementById('albaApplyDiv');
			let albaAddContents = document.createElement('div');
			albaAddContents.className = "albaAdd_contents1";

			let albaAddContentsLeft = document.createElement('div');
			albaAddContentsLeft.className = "albaAdd_left_content";

			let shopImg = document.createElement("img");
			shopImg.className = "albaAddImg";
			shopImg.src = "/resources/img/alba_nav7_hover.png"; // shopData.shImg // 샵 이미지 추가 후.

			// 	let albaAddName = document.createElement("p");
			// 	albaAddName.className = "albaAdd_name";
			// 	albaAddName.textContent = shopData.abName;
			// 	albaAddContentsLeft.appendChild(albaAddName);

			albaAddContentsLeft.appendChild(shopImg);

			albaAddContents.appendChild(albaAddContentsLeft);

			let albaAddContentsRight = document.createElement('div');
			albaAddContentsRight.className = "albaAdd_right_content";

			let albaAddTitle = document.createElement('div');
			albaAddTitle.className = "albaAdd_naeyong_title";
			albaAddTitle.textContent = "매장 이름";
			let albaAddNaeyong = document.createElement('div');
			albaAddNaeyong.className = "albaAdd_naeyong";
			albaAddNaeyong.textContent = shopData.shName;

			albaAddContentsRight.appendChild(albaAddTitle);
			albaAddContentsRight.appendChild(albaAddNaeyong);

			let albaAddTitle1 = document.createElement('div');
			albaAddTitle1.className = "albaAdd_naeyong_title";
			albaAddTitle1.textContent = "업종";
			let albaAddNaeyong1 = document.createElement('div');
			albaAddNaeyong1.className = "albaAdd_naeyong";
			albaAddNaeyong1.textContent = shopData.shType;

			albaAddContentsRight.appendChild(albaAddTitle1);
			albaAddContentsRight.appendChild(albaAddNaeyong1);

			let albaAddTitle2 = document.createElement('div');
			albaAddTitle2.className = "albaAdd_naeyong_title";
			albaAddTitle2.textContent = "주소";
			let albaAddNaeyong2 = document.createElement('div');
			albaAddNaeyong2.className = "albaAdd_naeyong";
			albaAddNaeyong2.textContent = shopData.shAddr;

			albaAddContentsRight.appendChild(albaAddTitle2);
			albaAddContentsRight.appendChild(albaAddNaeyong2);

			let albaAddTitle3 = document.createElement('div');
			albaAddTitle3.className = "albaAdd_naeyong_title";
			albaAddTitle3.textContent = "번호";
			let albaAddNaeyong3 = document.createElement('div');
			albaAddNaeyong3.className = "albaAdd_naeyong";
			albaAddNaeyong3.textContent = shopData.shTel;

			albaAddContentsRight.appendChild(albaAddTitle3);
			albaAddContentsRight.appendChild(albaAddNaeyong3);

			let albaAddTitle7 = document.createElement('div');
			albaAddTitle7.className = "albaAdd_naeyong_title";
			albaAddTitle7.textContent = "대표 이름";
			let albaAddNaeyong7 = document.createElement('div');
			albaAddNaeyong7.className = "albaAdd_naeyong";
			albaAddNaeyong7.textContent = shopData.mnName;

			albaAddContentsRight.appendChild(albaAddTitle7);
			albaAddContentsRight.appendChild(albaAddNaeyong7);

			let albaAddTitle8 = document.createElement('div');
			albaAddTitle8.className = "albaAdd_naeyong_title";
			albaAddTitle8.textContent = "대표 전화번호";
			let albaAddNaeyong8 = document.createElement('div');
			albaAddNaeyong8.className = "albaAdd_naeyong";
			albaAddNaeyong8.textContent = shopData.mnPhone;

			albaAddContentsRight.appendChild(albaAddTitle8);
			albaAddContentsRight.appendChild(albaAddNaeyong8);

			albaAddContents.appendChild(albaAddContentsRight);

			
// 			///// 버튼 영역
			let albaBtnContent = document.createElement('div');
			albaBtnContent.className = "albaApplyShopDetail_btn_content";
// 			let albaPrevBtn = document.createElement('button');
// 			albaPrevBtn.className = "albaAdd_prev_btn";
// 			let albaPrevBtnText = document.createTextNode('닫기');
// 			albaPrevBtn.appendChild(albaPrevBtnText);
	
// 			albaPrevBtn.addEventListener('click', function() { // 이전..
// 				window.close();
// 			});
			if(shopData.applyState ==  "myShopInquiry"){	
				let albaDeleteBtn = document.createElement('button');
				albaDeleteBtn.className = "albaAdd_prev_btn";
				let albaDeleteBtnText = document.createTextNode('지원 취소');
				albaDeleteBtn.appendChild(albaDeleteBtnText);
		
				albaDeleteBtn.addEventListener('click', function() { // 추가
					albaApplyDelete(shopData.shCode,shopData.abCode);
				});
				albaBtnContent.appendChild(albaDeleteBtn);
				
				let albaUpdateBtn = document.createElement('button');
				albaUpdateBtn.className = "albaAdd_btn";
				let albaUpdateBtnText = document.createTextNode('지원한 정보');
				albaUpdateBtn.appendChild(albaUpdateBtnText);

				albaUpdateBtn.addEventListener('click', function() { // 내 정보보기;
					albaApplyMyInfoUpdateStep(shopData.shCode, shopData.abCode);
				});
				albaBtnContent.appendChild(albaUpdateBtn);
				
				
			}else{
				let albaAddBtn = document.createElement('button');
				albaAddBtn.className = "albaAdd_btn";
				let albaAddBtnText = document.createTextNode('지원하기');
				albaAddBtn.appendChild(albaAddBtnText);
		
				albaAddBtn.addEventListener('click', function() {
					albaApplyMyInfo(shopData.shCode, shopData.abCode);
				});
				albaBtnContent.appendChild(albaAddBtn);
			}
			///
// 			albaBtnContent.appendChild(albaPrevBtn);
			albaAddContents.appendChild(albaBtnContent);
			/// 
			al.appendChild(albaAddContents);
		}
	}
	
	function albaApplyDelete(shCode, abCode) {
		let request = new XMLHttpRequest();
		request.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				let jsonData = decodeURIComponent(request.response);
		    	if(jsonData=="noSession"){
		    		 location.href="/LogInForm?lCode=alba";
		        }		
				let deleteState = JSON.parse(jsonData);
				
				if(deleteState == "deleteComplete"){
					alert("지원을 취소하였습니다.")
				}else{
					alert("시스템이 불안정합니다. 다시 시도해주세요.");
				}
				console.log(deleteState);
				window.close();
			}
		};
		request.open("POST", "albaApplyDelete", true);
		request.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
		request.send("action=albaApplyDelete&shCode="+ shCode + "&abCode=" + abCode);
		
	}
	
</script>


</html>