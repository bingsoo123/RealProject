<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Home</title>
<link href="/resources/css/manage.css" rel="stylesheet" />
<link href="/resources/css/labor.css" rel="stylesheet" />
<link href="/resources/css/laborContents.css" rel="stylesheet" />
<link href="/resources/css/commute.css" rel="stylesheet" />
<script  src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<!--  캔버스 라이브러리  -->
<script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>

</head>
<body onLoad="zoneList()">

    <div class="two">
        <div class="test2">
            <div class="head"><img alt="알바어때 ?" src="/resources/img/Main_logo.png"></div>
            <div class="serve">
                <div class="list" onclick="www();"><img alt="매장 관리" src="/resources/img/nav1.png"></div>
                <div class="list"><img alt="알바생 관리" src="/resources/img/nav2.png"></div>
                <div class="list" onClick="CommutingManagement()"><img alt="출퇴근 관리" src="/resources/img/nav3.png"></div>
                <div class="list"><img alt="업무 관리" src="/resources/img/nav4.png"></div>
            </div>
            <div class="serve2">
                <div class="list" onClick="pay()"><img alt="급여 관리" src="/resources/img/nav5.png"></div>
                <div class="list" onClick="Schedule()"><img alt="일정 관리" src="/resources/img/nav6.png"></div>
                <div class="list"><img alt="근무일지" src="/resources/img/nav7.png"></div>
                <div class="list" onClick="laborContract()"><img alt="근로계약서" src="/resources/img/nav8.png"></div>
            </div>
        </div>

        <div class="info">
                <div class="detail_info_img"><img alt="detail_logo" src="/resources/img/manager_logo.png"></div>
                <div class="detail_if">서알바 사장님&nbsp&nbsp<img src="/resources/img/work_check.png" width="25px" height="25px"/></div>
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

<script type = "text/javascript">

	function zoneList() {
		managerInfo();
	}

	function managerInfo() {
		let request = new XMLHttpRequest();
		request.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				let jsonData = decodeURIComponent(request.response);
				let manageDataParam = JSON.parse(jsonData);
				shopSelect(manageDataParam);
			}
		};
		let mnCode = '10000000'; // 로그인한 정보 (아마 세션에있는거) 임의로 넣음
		request.open("POST", "managerInfo", true);
		request.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded;charset=UTF-8");
		request.send("sCode=managerInfo&" + "mnCode=" + mnCode);
	}
	
	function Schedule(){
		
		$.ajax({
			type : "POST",
			url : "/Schedule",
			dataType : "html",
			success : function(data) {
				$(".test3").html(data);
			}
		});
	}

	function shopSelect(manageData) {
		// 로그인하고나서 선택을 해야하나..? 암튼 기본 선택값 (input hidden 에다가 넣어서 그걸 받아올거임.)	
		let shopHiddenInput = document.getElementById('shopCode');
		let mangerName = document.getElementById('mangerName');

		// let shCode = '100000000';

		mangerName.innerHTML = manageData[0].mnName + "사장님 어서오세요";

		let shopSelectContents = document.getElementById('shopSelect');
		let shopSelectBox = document.createElement('select');
		shopSelectBox.id = "shop_select_box"
		shopSelectBox.className = "shop_select_box";

		shopSelectBox.addEventListener('change', function() {
			manaOnchangeTest(this);
		});

		//	 	let shopSelectOption = document.createElement("option");
		//	 	shopSelectOption.value = " "; //
		//	 	shopSelectOption.text = "매장 선택"; //
		//	 	shopSelectBox.appendChild(shopSelectOption);

		// 서버에서 로그인 한사람의 shop 코드를 가져온다. (사장님의 매장이 여러개 일 수 있으니..)

		for (index = 0; index < manageData.length; index++) {
			let shopOptionIn = document.createElement("option");
			shopOptionIn.className = "shop_select_option1";
			shopOptionIn.value = manageData[index].shCode;
			shopOptionIn.text = manageData[index].shName;
			shopSelectBox.appendChild(shopOptionIn);
		}
		shopSelectContents.appendChild(shopSelectBox);

		if (shopHiddenInput.value == "0") {
			shopHiddenInput.value = manageData[0].shCode;
		}

	}

	function manaOnchangeTest(obj) {
		let shopHiddenInput = document.getElementById('shopCode');
		shopHiddenInput.value = obj.value;
		alert("shCode HiddenInput :: " + obj.value);
	}

	function pay() {
		$.ajax({
			type : "POST",
			url : "/pay",
			dataType : "html",
			success : function(data) {
				$(".test3").html(data);
				init();
			}
		});
	}

	function www() {
		$.ajax({
			type : "GET",
			url : "http://localhost/MyWorkZone",
			dataType : "html",
			success : function(data) {
				$(".test3").html(data);
				init();
			}
		});
	}

	function init() {

		let section = document.getElementById("workZone");
		//db값 안에  \n 이 있어서 \\n으로 치환해야지 파싱이된다.
		let workInfo = document.getElementById("workInfo");
		let log = '${WL}';
		let workrep = log.replace(/\n/g, '\\n');
		let work = JSON.parse(workrep);

		for (i = 0; i < work.length; i++) {
			//매장정보칸
			let div = document.createElement('Div');
			div.className = "workzone";
			div.style.margin = "40px 20px";
			section.appendChild(div)
			//매장명
			let shName = document.createElement('h2');
			shName.textContent = work[i].shName;
			shName.className = "workInfo";
			//업종 출력
			let shtype = document.createElement('h4');
			shtype.textContent = "업종 : " + work[i].shType;
			shtype.className = "kname";

			// 			총근무자수
			let workman = document.createElement('h4');
			workman.textContent = "직원수 : " + work[i].workman + "명";
			workman.style.margin = "10px 0px";
			workman.className = "kmember";
			// 			이미지 추가시 사용할 구문
			//			let workimg = document.createElement('Div');
			//			workimg.style.backgroundImage = "url(/resources/image/" +work[i].workimg + ")";
			//			workimg.style.backgroundSize = "contain";
			//			workimg.className="workimg";

			//			div.appendChild(workimg);
			div.appendChild(workman);
			div.appendChild(shtype);
			div.appendChild(shName);

		}
	}
	function addstore() {
		let form = document.createElement("form");
		form.setAttribute("method", "get");
		form.setAttribute("action", 'addWorkZone');
		form.setAttribute("target", "매장등록");

		document.body.appendChild(form);

		window
				.open(
						'addWorkZone.jsp',
						'매장등록',
						'top=10,left=10,width=800,height=600,status=no,menubar=no,toolbar=no,resizable=no');

		form.submit();

	}

	function search_store() {

		let form = document.createElement("form");
		form.setAttribute("method", "get");
		form.setAttribute("action", 'searchMap');
		form.setAttribute("target", "newMap");

		document.body.appendChild(form);

		window
				.open(
						'searchMap.jsp',
						'newMap',
						'top=10,left=10,width=600,height=600,status=no,menubar=no,toolbar=no,resizable=no');

		form.submit();

	}

	function checkshop() {
		let name = document.getElementById("shopName2").value;
		let addrs = document.getElementById("shopResult").value;
		let number = document.getElementById("shopNumber2").value;
		let phone = document.getElementById("shopPhone2").value;
		let kind = document.getElementById("shopkind").value;
		let img = document.getElementById("imgresult").value;
		let form = document.createElement("form");
		form.method = "post";
		document.body.appendChild(form);
		form.submit();

		alert(name);
		alert(addrs);
		alert(number);
		alert(phone);
		alert(kind);
		alert(img);

	}

	function imgadd() {
		var fname = document.getElementById('imgresult');
		var tt = document.getElementById('addimg2').value;
		var ab = tt.split("\\");
		fname.value += ab[2];
	}

	// 근로 계약서 

	//출퇴근 관리 눌렀을때. 현재 매장에 있는 알바생 이름들 가져와야함
	function CommutingManagement() {
		let request = new XMLHttpRequest();
		request.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				let jsonData = decodeURIComponent(request.response);
				let albaDataParam = JSON.parse(jsonData);
				commuteContents(albaDataParam);
			}
		};
		let shCode = '100000000';
		request.open("POST", "albaList1", true);
		request.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded;charset=UTF-8");
		request.send("sCode=albaList1&" + "shCode=" + shCode);
	}
	function commuteContents(albaData) {
		$(function divClear() {
			$('#test3').empty();
		}); // 내용 비우기

		let test3 = document.getElementById('test3');

		let dateContainer = document.createElement('div');
		dateContainer.className = "date_container";

		let dateContents = document.createElement('div');
		dateContents.className = "date_contents";

		dateContainer.appendChild(dateContents);

		let commuteSelectDateText = document.createElement('div');
		commuteSelectDateText.className = "commute_select_dateText";
		commuteSelectDateText.textContent = "알바생 & 날짜선택";

		dateContents.appendChild(commuteSelectDateText);
		// select 박스 만들기.

		let albaSelect = document.createElement('select');
		albaSelect.id = "alba_select_box"
		albaSelect.className = "alba_select_box";

		//최상위 알바생 선택 option 삽입
		let albaOption = document.createElement("option");
		albaOption.value = "t1";
		albaOption.text = "-- 알바생 선택 --";
		albaSelect.appendChild(albaOption);

		for (index = 0; index < albaData.length; index++) {
			let albaOptionIn = document.createElement("option");
			albaOptionIn.className = "alba_select_box1";
			albaOptionIn.value = albaData[index].abCode;
			albaOptionIn.text = albaData[index].abName;
			albaSelect.appendChild(albaOptionIn);
		}

		///

		let dateContents1 = document.createElement('input');
		dateContents1.type = "date";
		dateContents1.className = "datebox";
		dateContents1.id = "commutDateStart";

		let dateText1 = document.createElement('div');
		dateText1.className = "dateText1";

		let dateContents2 = document.createElement('input');
		dateContents2.type = "date";
		dateContents2.className = "datebox";
		dateContents2.id = "commutDateEnd";

		let commuteInquiryBtn = document.createElement('input'); // addEventListener
		commuteInquiryBtn.type = "button";
		commuteInquiryBtn.value = "조회";
		commuteInquiryBtn.className = "commuteInquiryBtn";
		commuteInquiryBtn.addEventListener('click', function() {
			commuteInquiry(); // shCode 불러오면 됌
			// commuteTest();
		});

		dateContents.appendChild(albaSelect);
		dateContents.appendChild(dateContents1);
		dateContents.appendChild(dateText1);
		dateContents.appendChild(dateContents2);
		dateContents.appendChild(commuteInquiryBtn);

		test3.appendChild(dateContainer);
	}

	// 출퇴근 관리를 누른 후 시작 날짜와 마지막 날짜를 골라 그 사이의 데이터 값을 들고옴. ajax 처리
	function commuteInquiry() {
		let startDate = document.getElementById("commutDateStart").value;
		let endDate = document.getElementById("commutDateEnd").value;
		let albaSelectBox = document.getElementById("alba_select_box");
		let abCode = albaSelectBox.options[albaSelectBox.selectedIndex].value;
		alert(startDate + "  ~  " + endDate);

		let request = new XMLHttpRequest();
		request.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				let jsonData = decodeURIComponent(request.response);
				let commuteDataParam = JSON.parse(jsonData);
				commuteList(commuteDataParam);
			}
		};
		let shCode = '100000000';
		request.open("POST", "Commute", true);
		request.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded;charset=UTF-8");
		request.send("sCode=Commute&" + "shCode=" + shCode + '&abCode='
				+ abCode + '&startDate=' + startDate + '&endDate=' + endDate);
	}
	// 원하는 날짜사이의 데이터를 가져옴 . 가져온 데이터를 스크립트 처리한것.
	function commuteList(commuteData) {
		let lc = document.getElementById('test3');
		// alert("commuteData:: " + commuteData);
		let cmTemp;
		let cmType; // 출퇴근이 쌍인지?
		let dateTemp;
		let indexTemp;
		for (index = 0; index < commuteData.length - 1; index++) { // 같은날짜일떄는 하나로 묶으려고 만듬.
			cmTemp = commuteData[index].cmTime.split('_'); // 20210304 10:30 cmTemp[0] 은 20210304 (날짜) cmTemp[1]은 cmTime
			cmStartWorkTime = cmTemp[1];
			console.log(commuteData[index + 1].cmTime);
			cmTemp1 = commuteData[index + 1].cmTime.split('_');
			cmTempLeaveWorkTime = cmTemp1[1];

			cmType = 0;
			cmType = parseInt(commuteData[index].cmType)
					+ parseInt(commuteData[index + 1].cmType);
			// alert("commuteData.length:: " + commuteData.length + "  index:: " + index + "cmType::" +cmType + " :: " + commuteData[index].cmType);
			if (cmType != '0' || commuteData[index].cmType == '-1') { // 출퇴근이 쌍이면..

			} else {
				if (dateTemp == cmTemp[0]) {
					//index -= 1;
				} else {
					let dateText2 = document.createElement('div');
					dateText2.className = "dateText2";
					dateTemp = cmTemp[0];
					dateText2.textContent = dateTemp; // starttime으로 날짜 만들기.
					lc.appendChild(dateText2);
				}
				let commuteRow = document.createElement('div');
				commuteRow.className = "commute_row";

				let commuteRowLeft = document.createElement('div');
				commuteRowLeft.className = "commute_row_left";

				let commuteWorker = document.createElement('div');
				commuteWorker.className = "commute_worker";
				commuteWorker.textContent = commuteData[index].abName;

				commuteRow.appendChild(commuteRowLeft);
				commuteRowLeft.appendChild(commuteWorker);
				commuteRow.appendChild(commuteRowLeft);

				let commuteRowRight = document.createElement('div');
				commuteRowRight.className = "commute_row_right";

				let commuteRowRightContent1 = document.createElement('div');
				commuteRowRightContent1.className = "commute_row_right_content";

				let commuteTimeText1 = document.createElement('div');
				let commuteTimeStart1 = document.createElement('div');
				let dateTextThree1 = document.createElement('div');
				let commuteTimeEnd1 = document.createElement('div');
				commuteTimeText1.className = "commute_time_text";
				commuteTimeStart1.className = "commute_time";
				dateTextThree1.className = "dateText3";
				commuteTimeEnd1.className = "commute_time";
				commuteTimeText1.textContent = " 근무 시간";
				commuteTimeStart1.textContent = commuteData[index].startTime;
				dateTextThree1.textContent = "~";
				commuteTimeEnd1.textContent = commuteData[index].endTime;

				commuteRowRight.appendChild(commuteRowRightContent1);
				commuteRowRightContent1.appendChild(commuteTimeText1);
				commuteRowRightContent1.appendChild(commuteTimeStart1);
				commuteRowRightContent1.appendChild(dateTextThree1);
				commuteRowRightContent1.appendChild(commuteTimeEnd1);

				let commuteRowRightContent2 = document.createElement('div');
				commuteRowRightContent2.className = "commute_row_right_content";

				let commuteTimeText2 = document.createElement('div');
				let commuteTimeStart2 = document.createElement('div');
				let dateTextThree2 = document.createElement('div');
				let commuteTimeEnd2 = document.createElement('div');
				commuteTimeText2.className = "commute_time_text";
				commuteTimeStart2.className = "commute_time";
				dateTextThree2.className = "dateText3";
				commuteTimeEnd2.className = "commute_time";
				commuteTimeText2.textContent = "출퇴근 시간";
				//commuteTimeStart2.textContent = cmStartWorkTime + "( "+commuteData[index].cmType + " )"; // 출근
				commuteTimeStart2.textContent = cmStartWorkTime; // 출근
				dateTextThree2.textContent = "~";
				// commuteTimeEnd2.textContent = cmTempLeaveWorkTime + "( "+commuteData[index+1].cmType + " )"; // 퇴근
				commuteTimeEnd2.textContent = cmTempLeaveWorkTime; // 퇴근
				commuteRowRight.appendChild(commuteRowRightContent2);
				commuteRowRightContent2.appendChild(commuteTimeText2);
				commuteRowRightContent2.appendChild(commuteTimeStart2);
				commuteRowRightContent2.appendChild(dateTextThree2);
				commuteRowRightContent2.appendChild(commuteTimeEnd2);
				commuteRow.appendChild(commuteRowRightContent1);
				commuteRow.appendChild(commuteRowRightContent2);
				lc.appendChild(commuteRow);
			}
		}

	}

	// 근로 계약서 눌렀을때 리스트 ajax 처리(labor step1)
	function laborContract() {
		$(function divClear() {
			$('#test3').empty();
		}); // 내용 비우기
		let request = new XMLHttpRequest();
		request.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				let jsonData = decodeURIComponent(request.response);
				let laborDataParam = JSON.parse(jsonData);
				laborContractList(laborDataParam);
			}
		};
		let shCode = '100000000';
		request.open("POST", "labor", true);
		request.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded;charset=UTF-8");
		request.send("sCode=labor&" + "shCode=" + shCode);
	}

	var laborFlag; // delete를 누르지 않았을 상태는 0으로 칭하고. delete 버튼을 눌럿을때는 -1로 칭한다. 흠.. 전역변수로 돌릴까
	////데이터 불러와서 스크립트 처리 하는 곳
	//근로계약서 리스트 스크립트 (labor step1)
	function laborContractList(laborDataParam) {
		let lc = document.getElementById('test3');

		if (laborDataParam == null || laborDataParam == "") {
			let laborAdd = document.createElement('button');
			let laborAddText = document.createTextNode('추가');
			laborAdd.className = "labor_add_btn";
			laborAdd.addEventListener('click', function() {
				laborContractAddPage('100000000'); // shCode 불러오면 됌
			});
			laborAdd.appendChild(laborAddText);
			lc.appendChild(laborAdd);
		} else {
			// list가 없을때 처리를 안했음.
			laborFlag = 0
			let isDeletePressed = 0; // 한번 눌렀냐 안눌렀냐 (delete할때 _select 에따른 스타일 지정을 위해)
			// alert("laborContractList laborFlag:: " + laborFlag);
			let laborData = laborDataParam;

			let shCodeParam = laborData[0].shCode; //  로그인 후 매장 선택한거에 대한 정보가나오는거니까 0번째 배열이여도 상관없음.	

			let laborAdd = document.createElement('button');
			let laborAddText = document.createTextNode('추가');
			laborAdd.className = "labor_add_btn";
			laborAdd.addEventListener('click', function() {
				laborContractAddPage(shCodeParam);
			});
			laborAdd.appendChild(laborAddText);

			let laborDelete = document.createElement('button');
			let laborDeleteText = document.createTextNode('삭제'); // 토글로 만들 예정
			laborDelete.className = "labor_delete_btn";

			let laborDeleteConfirm = document.createElement('button');
			let laborDeleteConfirmText = document.createTextNode('삭제 완료');
			laborDeleteConfirm.className = "labor_delete_complete";
			laborDeleteConfirm.style = "display:none";

			laborDeleteConfirm.addEventListener('click', function() { // 삭제 완료
				laborContractDelete(shCodeParam, index);
			});

			laborDelete.addEventListener('click', function() { // 삭제
				laborFlag = -1;
				alert("삭제 버튼 활성화(laborFlag) ::" + laborFlag);
			});

			laborDelete.appendChild(laborDeleteText);
			laborDeleteConfirm.appendChild(laborDeleteConfirmText);

			lc.appendChild(laborAdd);
			lc.appendChild(laborDelete);
			lc.appendChild(laborDeleteConfirm);

			for (index = 0; index < laborData.length; index++) {
				let laborRow = document.createElement('div');
				laborRow.className = "labor_contract_contents_row";

				let abCodeParam = laborData[index].abCode;
				let laborCheck = document.createElement('input');
				laborCheck.setAttribute("type", "checkbox");
				laborCheck.setAttribute("value", laborData[index].abCode);
				laborCheck.setAttribute("name", "laborCheck");
				laborCheck.checked = false;
				laborCheck.style = "display:none"; // 삭제 체크박스 보이게.. 

				laborRow
						.addEventListener(
								'click',
								function() { // !!!! 중요 !!!! isDeletePressed 로 해버리면 두번클릭해야 적용되서 다시 로직짜야함 ㅠ
									if (laborFlag == -1) { // 삭제 버튼이 눌렸을때.
										laborDeleteConfirm.style = "display:inline";
										if (isDeletePressed == 0) {

											laborCheck.checked = true;
											laborRow.className = "labor_contract_contents_row_select";
											isDeletePressed = 1;
										} else {
											laborCheck.checked = false;
											laborRow.className = "labor_contract_contents_row";
											isDeletePressed = 0;

										}
									} else {
										laborDetail(shCodeParam, abCodeParam);
									}
								});

				let laborImgContents = document.createElement('div');
				laborImgContents.className = "labor_contract_img_contents";

				let laborImg = document.createElement('img');
				laborImg.className = "labor_contract_img";
				laborImg.src = "/resources/img/labor_contract.png";

				let laborContents = document.createElement('div');
				laborContents.className = "labor_contract_contents";

				let laborName = document.createElement('div');
				laborName.className = "labor_contract_name";
				laborName.textContent = "근로계약서";

				let laborAbName = document.createElement('div');
				laborAbName.className = "labor_contract_albaname";
				laborAbName.textContent = "근로자 : " + laborData[index].abName;

				let laborDate = document.createElement('div');
				laborDate.className = "labor_contract_date_create";
				laborDate.textContent = "작성일 : " + "2021년 02월 27일"; // laborData[index].abDate

				laborRow.appendChild(laborImgContents);
				laborImgContents.appendChild(laborImg);
				laborRow.appendChild(laborContents);

				laborContents.appendChild(laborName);
				laborContents.appendChild(laborAbName);
				laborContents.appendChild(laborDate);

				laborRow.appendChild(laborCheck);

				lc.appendChild(laborRow);
			}
		}
	}

	// 근로계약서 선택한거 삭제 ...
	function laborContractDelete(shCode, index) {
		let laborArr = laborSelectCheck();
		alert(laborArr);
		// alert("shCode:: " + shCode + "   abCodeArr" + laborArr);
		// [삭제] 버튼 누르고 check 한 값들만 가져왔음. (laborArr)
		let request = new XMLHttpRequest();
		request.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				let deleteState = decodeURIComponent(request.response);
				if (deleteState == 1) {
					alert("선택하신 계약서를 정상적으로 삭제 완료 하였습니다.");
				} else if (deleteState == 0) {
					alert("계약서 삭제 실패");
				} else {
					alert("서버가 불안정 합니다.");
				}
			}

		};
		request.open("POST", "laborDelete", true);
		request.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded;charset=UTF-8");
		request.send("sCode=laborDelete&shCode=" + shCode + "&abCode="
				+ laborArr);

	}

	function laborSelectCheck() {
		let laborCheckbox = document.getElementsByName("laborCheck");
		var laborArr = new Array();
		let checked = 0;
		for (i = 0; i < laborCheckbox.length; i++) {
			if (laborCheckbox[i].checked == true) {
				laborArr[checked] = laborCheckbox[checked].value;
				checked += 1;
			}
		}
		return laborArr;
	}

	// Ajax
	// 근로계약서에서 하나를 클릭했을때 해당하는 근로계약서 조회 (shCode, abCode) // laborDetail
	// laborType이 -1일떄는 delete 에 관한 EventListener 버튼 할거임.. style을 준다던가. 선택해서 삭제.
	function laborDetail(shCode, abCode) { // 
		let request = new XMLHttpRequest();
		request.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				let jsonData = decodeURIComponent(request.response);
				let laborDataParam = JSON.parse(jsonData);
				laborDetailInfo(laborDataParam);
			}
		};
		request.open("POST", "laborDetail", true);
		request.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded;charset=UTF-8");
		request
				.send("sCode=laborDetail&shCode=" + shCode + "&abCode="
						+ abCode);
	}

	function laborDetailInfo(laborDataParam) {
		$(function divClear() {
			$('#test3').empty();
		}); // 내용 비우기
		let laborDetailData = laborDataParam;
		let lc = document.getElementById('test3');
		let laborImg = document.createElement('img');

		// 선택한 lcRoot = 물리적 경로 + 파일명
		let laborContractPath = "/resources/laborContract/"; // 서버 내 근로계약서 폴더
		// 문자 스플릿 후 맨끝 배열 가져오기.
		let laborPngName = laborDetailData.lcRoot.split('/').reverse()[0];
		laborImg.src = laborContractPath + laborPngName;
		alert(laborContractPath + laborPngName);
		lc.appendChild(laborImg);
	}

	/////

	// 근로계약서에서 [추가] 버튼 눌렀을때.
	function laborContractAddPage(shCode) {
		alert(shCode + "   addPage 실행");
		$(function divClear() {
			$('#test3').empty();
		}); // 내용 비우기
		let request = new XMLHttpRequest();
		request.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				let jsonData = decodeURIComponent(request.response);
				let albaDataParam = JSON.parse(jsonData);
				laborContractCanvas(albaDataParam);
			}
		};
		request.open("POST", "ShopInfoAndAlba", true);
		request.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded;charset=UTF-8");
		request.send("sCode=ShopInfoAndAlba&" + "shCode=" + shCode);
		// 이거 나중에 음... 근로자 상세정보랑 매장 상세정보 다 가져와서
		// input box에 처리하면 조을거같음!!! 

	}

	//// 근로 계약서 작성 및 서명 (canvas)
	function laborContents(albaData) {
		let test = document.getElementById('test3');

		//	let albaSelect = document.createElement('select');
		//	albaSelect.id = "alba_select_box"
		//	albaSelect.className = "alba_select_box";
		//	let albaOption = document.createElement("option");
		//	albaOption.value = " ";
		//	albaOption.text = "-- 알바생 선택 --";
		//	albaSelect.appendChild(albaOption);

		//	for(index = 0; index < albaData.length; index++){
		//		let albaOptionIn = document.createElement("option");
		//		albaOptionIn.className = "alba_select_box1";
		//		albaOptionIn.value = albaData[index].abCode;
		//		albaOptionIn.text = albaData[index].abName;
		//		albaSelect.appendChild(albaOptionIn);
		//	}
		//	test.appendChild(albaSelect);

		let labor = '<select id="alba_select_box" class="alba_select_box" onChange=laborSelectBox(this);>';
		labor += '<option value ="none">알바생 선택</option>';
		for (index = 0; index < albaData.length; index++) {
			labor += '<option value=' + albaData[index].abCode + '>'
					+ albaData[index].abName + '</option>';
		}
		labor += '</select>';
		labor += '<input type="hidden" id = "labor_shCode" value=' +albaData[0].shCode +'>'
		labor += '<button id ="laborComplete" class = "labor_complete_btn" >작성 완료</button>';
		labor += '<div class = "laborDiv" id="laborDiv">';
		labor += '<span class= "labor_contract_title">근 로 계 약 서</span> <br>';
		labor += '<span class = "labor_contract_contents_step2">';
		labor += '<input type="text" class="labor_contents" value = "'+ albaData[0].mnName + '"disabled/> (이하 "사업주"라 함)과(와) <input type="text" id="labor_worker" class="labor_contents" disabled/>(이하 "근로자"라 함)은 <br>';
		labor += '다음과 같이 근로계약을 체결한다. <br><br>';
		labor += '1. 근로계약 기간 : <input type="text" class="labor_contents"/>년<input type="text" class="labor_contents_style1"/>월<input type="text" class="labor_contents_style1"/>일부터<input type="text" class="labor_contents"/>년<input type="text" class="labor_contents_style1"/>월<input type="text" class="labor_contents_style1"/>일까지 <br>';
		labor += '※ 근로 계약기간을 정하지 않는 경우에는 "근로개시일"만 기재 <br>';
		labor += '2. 근 무 장 소 : <input type="text" class="labor_contents_style2" value="' + albaData[0].shAddr+ '"disabled/> <br>';
		labor += '3. 업무의 내용 : <br>';
		labor += '4. 소정근로시간 : <input type="text" class="labor_contents_style1"/>시<input type="text" class="labor_contents_style1"/>분부터 <input type="text" class="labor_contents_style1"/>시 <input type="text" class="labor_contents_style1"/>분까지 (휴게시간 :<input type="text" class="labor_contents_style1"/>시 <input type="text" class="labor_contents_style1"/>분 ~  <input type="text" class="labor_contents_style1"/>시  <input type="text" class="labor_contents_style1"/>분) <br>';
		labor += '5. 근무일/휴일 : 매주 <input type="text" class="labor_contents_style1"/>일(또는 매일단위)근무, 주휴일 매주 <input type="text" class="labor_contents_style1"/>요일 <br>';
		labor += '6. 임 금 <br>';
		labor += '- 월(일, 시간)급 : <input type="text" class="labor_contents"> 원 <br>';
		labor += '- 상여금 : 있음 ( <input type="radio" name = "provisionCheck0" class="radio_btn"/> ) <input type="text" class="labor_contents">원, 없음 ( <input type="radio" name = "provisionCheck0" class="radio_btn"/> ) <br>';
		labor += '- 기타급여(제수당 등) : 있음 ( <input type="radio" name = "provisionCheck1" class="radio_btn"/> ),   없음 ( <input type="radio" name = "provisionCheck1" class="radio_btn"/> ) <br>';
		labor += '* <input type="text" class="labor_contents"> 원,    <input type="text" class="labor_contents"> 원 <br>';
		labor += '* <input type="text" class="labor_contents"> 원,    <input type="text" class="labor_contents"> 원 <br>';
		labor += '- 임금지급일 : 매월(매주 또는 매일) <input type="text" class="labor_contents_style1"/>일 (휴일의 경우는 전일 지급) <br>';
		labor += '- 지급방법 : 근로자에게 직접지금 ( <input type="radio" name = "provisionCheck2" class="radio_btn"/>  ) , 근로자 명의 예금통장에 입금( <input type="radio" name = "provisionCheck2"/> ) <br><br>';
		labor += '7. 연차유급휴가 <br>';
		labor += '- 연차유급휴가는 근로기준법에서 정하는 바에 따라 부여함 <br>';
		labor += '8. 근로계약서 교부 <br>';
		labor += '- 사업주는 근로계야을 체결함과 동시에 본 계약서를 사본하여 근로자의 <br>';
		labor += '교부요구와 관계없이 근로자에게 교부함(근로기준법 제17조 이행) <br>';
		labor += '9. 기  타 <br>';
		labor += '- 이 계약에 정함이 없는 사항은 근로기준법령에 의함 <br>';
		let today = new Date();
		let year = today.getFullYear(); // 년도
		let month = today.getMonth() + 1; // 월
		let date = today.getDate(); // 날짜
		labor += '<div class="day_contents"><input type="text" class="labor_contents" value ="'+ year +'"disabled/>년    <input type="text" class="labor_contents_style1" value ="'+ month +'"disabled/>월    <input type="text" class="labor_contents_style1" value ="'+ date +'"disabled/>일 </div>';
		labor += '(사업주) 사업체명 :<input type="text" class="labor_contents_style2" value="' + albaData[0].shName+ '"disabled/>  (전화 :<input type="text" class="labor_contents_style4" value="' + albaData[0].shTel+ '"disabled/> )  <br>';
		labor += '주    소 :<input type="text" class="labor_contents_style3" value="' + albaData[0].shAddr+ '"disabled/>                                                  <br>';
		labor += '대 표 자 :<input type="text" class="labor_contents" value="' + albaData[0].mnName+ '"disabled/> <br>(서명)<br>';
		labor += '<canvas id="signAdmin" style="border: 1px solid black"></canvas>';
		labor += ' <br><button class = "labor_clear" onclick="canvasClear(0)">초기화</button><br>';
		labor += '(근로자)  주    소 :<input type="text" id = "labor_abAddr" class="labor_contents_style3" disabled/> (전화 :<input type="text"  class="labor_contents_style4">)  <br>';
		labor += '          연 락 처 :<input type="text" id = "labor_abPhone" class="labor_contents_style2" disabled/><br>';
		labor += '          성    명 :<input type="text" id = "labor_abName" class="labor_contents" disabled/> <br>(서명)<br>';
		labor += '		<canvas id="signAlba" style="border: 1px solid black"></canvas>';
		labor += '		<br><button class = "labor_clear" onclick="canvasClear(1)" class = "labor_clear_btn">초기화</button><br>';
		labor += '</span>';
		labor += '</div>';
		test.innerHTML = labor;

	}

	function laborSelectBox(obj) {

		if (obj.value == 'none') {
		} // 알바생선택] 이면 아무것도 안하겠다.
		else {
			let laborWorker = document.getElementById("labor_worker");
			laborWorker.value = obj.options[obj.selectedIndex].text;
			let shCode = document.getElementById("labor_shCode").value;
			let abCode = obj.value;

			let request = new XMLHttpRequest();
			request.onreadystatechange = function() {
				if (this.readyState == 4 || this.status == 200) {
					let jsonData = decodeURIComponent(request.response);
					let albaDataParam = JSON.parse(jsonData);
					laborContractAlbaInfoWrite(albaDataParam);
				}
			};
			request.open("POST", "laborAlbaInfo", true);
			request.setRequestHeader("Content-Type",
					"application/x-www-form-urlencoded;charset=UTF-8");
			request.send("sCode=laborAlbaInfo&" + "shCode=" + shCode
					+ "&abCode=" + abCode);
		}
	}

	function laborContractAlbaInfoWrite(albaData) {
		let laborAbAddr = document.getElementById("labor_abAddr");
		let laborAbPhone = document.getElementById("labor_abPhone");
		let laborAbName = document.getElementById("labor_abName");

		laborAbAddr.value = albaData[0].abAddr.replace(/\n/gi, ' ');
		laborAbPhone.value = albaData[0].abPhone;
		laborAbName.value = albaData[0].abName;
	}

	// 서명 초기화 버튼
	function canvasClear(select_clear) {
		var canvasContent = select_clear == 0 ? "signAdmin" : "signAlba";
		var canvas = document.getElementById(canvasContent);
		canvas.getContext("2d").clearRect(0, 0, canvas.width, canvas.height);
	}
	// canvas 처리
	var canvas, canvas1, context, context1;
	function laborContractCanvas(albaData) {
		laborContents(albaData);
		canvas = document.getElementById("signAdmin");
		canvas1 = document.getElementById("signAlba");
		context = canvas.getContext("2d");
		context1 = canvas1.getContext("2d");

		context.lineWidth = 2; // 선 굵기를 2로 설정
		context.strokeStyle = "black";
		context1.lineWidth = 2;
		context1.strokeStyle = "black";

		// 마우스 리스너 등록. e는 MouseEvent 객체
		canvas.addEventListener("mousemove", function(e) {
			move(e)
		}, false);
		canvas.addEventListener("mousedown", function(e) {
			down(e)
		}, false);
		canvas.addEventListener("mouseup", function(e) {
			up(e)
		}, false);
		canvas.addEventListener("mouseout", function(e) {
			out(e)
		}, false);

		canvas1.addEventListener("mousemove", function(e) {
			move1(e)
		}, false);
		canvas1.addEventListener("mousedown", function(e) {
			down(e)
		}, false);
		canvas1.addEventListener("mouseup", function(e) {
			up(e)
		}, false);
		canvas1.addEventListener("mouseout", function(e) {
			out(e)
		}, false);

	}
	var startX = 0, startY = 0; // start mouse curser
	var drawing = false;
	function draw(curX, curY) { // canvas - 사장
		context.beginPath();
		context.moveTo(startX, startY);
		context.lineTo(curX, curY);
		context.stroke();
	}

	function draw1(curX, curY) { // canvas1 - 알바생
		context1.beginPath();
		context1.moveTo(startX, startY);
		context1.lineTo(curX, curY);
		context1.stroke();
	}

	function down(e) {
		startX = e.offsetX;
		startY = e.offsetY;
		drawing = true;
	}
	function up(e) {
		drawing = false;
	}
	function move(e) {
		if (!drawing)
			return; // 마우스가 눌러지지 않았으면 리턴
		var curX = e.offsetX, curY = e.offsetY;
		draw(curX, curY);
		startX = curX;
		startY = curY;
	}
	function out(e) {
		drawing = false;
	}
	function move1(e) {
		if (!drawing)
			return; // 마우스가 눌러지지 않았으면 리턴
		var curX = e.offsetX, curY = e.offsetY;
		draw1(curX, curY);
		startX = curX;
		startY = curY;
	}
	// canvas end

	// 근로계약서 다 작성 후 완료 눌럿을때 서버에 저장 . ajax 처리
	$(document).on(
			"click",
			"#laborComplete",
			function() {
				$('.labor_clear').css("display", "none");
				sreenShot($("#laborDiv"), $('#labor_shCode').val(), $(
						"#alba_select_box option:selected").val());
			});

	function sreenShot(target, shCode, abCode) {
		alert("laborComplete" + target + shCode + abCode);
		if (target != null && target.length > 0) {
			var t = target[0];
			html2canvas(t).then(function(canvas) {
				var laborPng = canvas.toDataURL("image/png");
				laborPng = laborPng.replace("data:image/png;base64,", "");
				$.ajax({
					type : "POST",
					data : {
						"lcName" : laborPng,
						"sCode" : "laborAdd",
						"shCode" : shCode,
						"abCode" : abCode
					},
					dataType : "text",
					url : "laborAdd",
					success : function(data) {
						console.log(data);
						laborContract();
					},
					error : function(a) {
						console.log("error labor");
					}
				});
			});
		}
	}
	//
</script>

</html>



