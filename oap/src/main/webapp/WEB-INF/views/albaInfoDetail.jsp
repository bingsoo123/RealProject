<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알바생 상세 정보</title>
<link href="/resources/css/albaInfoDetail.css" rel="stylesheet" />
</head>
<!-- accessDetail 이엿던거 albaInfoDetail로 바꿈. -->
<body onload="albaInfoDetail()">
	<div class="all">

		<div class="one">
			<div class="img-one">
				<img src="/resources/img/logo.png"
					style="width: 350px; height: 100px;">
				<div style="width: 100%; height: 10px; background-color: #FEE300;"></div>
			</div>
		</div>

		<div class="two">
			<div class="img-two" id="imgtwo"></div>
		</div>

		<div class="three">

			<lable class="lable">이름</lable>
			<div class="info" id="albaDetailName"></div>
			<br>

			<lable class="lable">최근 출퇴근 시간</lable>
			<div class="info" id="albaDetailCommuteTime"></div>
			<br>

			<lable class="lable">시급</lable>
			<div class="info" id="albaDetailSiaPay"></div>
			<br>

			<lable class="lable">입사 날짜</lable>
			<div class="info" id="albaDetailSiaDate"></div>
			<br>

			<lable class="lable">생년월일</lable>
			<div class="info" id="albaDetailNameBirth"></div>
			<br>

			<lable class="lable">핸드폰 번호</lable>
			<div class="info" id="albaDetailPhone"></div>
			<br>

			<lable class="lable">주소</lable>
			<div class="info" id="albaDetailAddr"></div>
			<br>

			<lable class="lable">이메일</lable>
			<div class="info" id="albaDetailEmail"></div>
			<br>

			<lable class="lable">계좌번호</lable>
			<div class="info" id="albaDetailAccount"></div>
			<br>
			
			<lable id="lable_account_update"></lable>
			<div id ="albaDetailSelectBoxContents"></div>

			<div class="info" id="albaDetailAccount" style="display: none;"></div>
			</div>
			
			<div id="albaDetailRowBtn" class="albaDetailRowBtn">
			
		</div>
		<input type="hidden" id="shopCode">
		<input type="hidden" id="albaCode">
	</div>
</body>

<script>
	function albaInfoDetailAccountList(abCode) {
		let request = new XMLHttpRequest();
		request.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				let json = decodeURIComponent(request.response);
		    	if(json=="noSession"){
		    		 location.href="/LogInForm?lCode=manage";
		        }		
				let accountList = JSON.parse(json);
				albaInfoDetailAccountListSelect(accountList);
			}
		}
		request.open("POST", "albaInfoDetailAccountList", true);
		request.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
		request.send("sCode=albaInfoDetailAccountList&abCode=" + abCode);

	}
	
	function albaInfoDetailAccountListSelect(albaAccountList) {
		
		/// 여기에 lable 수정할 계좌 라는것을 만들것. seletbox 아래에 있는 class=info 사용하기.
		let lable_account_update = document.getElementById('lable_account_update');
		lable_account_update.className = "lable";
		lable_account_update.textContent = "수정할계좌";
		
		let albaDetailAccount = document.getElementById('albaDetailAccount');
		albaDetailAccount.setAttribute("style","display:block;");
		
		
		let albaDetailSelectBoxContents = document.getElementById('albaDetailSelectBoxContents');
		let accountSelect = document.createElement('select');
		accountSelect.className = "accountSelect";
		accountSelect.id = "accountSelect";
		for(index = 0; index < albaAccountList.length; index++){
			let albaOptionIn = document.createElement("option");
			albaOptionIn.value = albaAccountList[index].acBankName + "_" + albaAccountList[index].acAccount;
			albaOptionIn.text = "[" + albaAccountList[index].acBankName + "]   " + albaAccountList[index].acAccount;
			accountSelect.appendChild(albaOptionIn);
		}
		albaDetailSelectBoxContents.appendChild(accountSelect);
		
		let albaDetailRow = document.getElementById('albaDetailRowBtn');
		
		let albaDetailUpdateCompleteBtn = document.createElement('button');
		let albaDetailUpdateCompleteBtnText = document.createTextNode('수정 완료');
		albaDetailUpdateCompleteBtn.appendChild(albaDetailUpdateCompleteBtnText);
		albaDetailUpdateCompleteBtn.className = "albaDetail_btn_complete";
		albaDetailUpdateCompleteBtn.addEventListener('click', function() {
			
			albaDetailUpdateComplete();
			// 클릭할때 hidden input 만들어서 그때마다 값 변경시키고 그거 들고 update 처리	

		});
		albaDetailRow.appendChild(albaDetailUpdateCompleteBtn);
		
	}
	
	function albaDetailUpdateComplete() {
		
		let scCode = document.getElementById('shopCode').value;
		let abCode = document.getElementById('albaCode').value;
		
		let accountSelect = document.getElementById('accountSelect');
	    let accountSelectValue = accountSelect.options[accountSelect.selectedIndex].value;
	    
	    let accountSplit = accountSelectValue.split("_");
	    
	    let acBankName = accountSplit[0];
	    let acAccount = accountSplit[1];
	    
		alert(scCode + abCode + acBankName + acAccount);
		
		
		let shCode = document.getElementById('shopCode').value;
		 let request = new XMLHttpRequest();
		 request.onreadystatechange = function(){
		    if(this.readyState == 4 && this.status == 200){
		       let updateState = decodeURIComponent(request.response);
		    	if(updateState=="noSession"){
		    		 location.href="/LogInForm?lCode=manage";
		        }		
		       if(updateState == "1"){
		    	   alert("정상적으로 수정되었습니다");
		    	   window.location.reload();
		       }else{
		    	   alert("수정을 실패하였습니다.");
		       }
		    }
		 };
		 request.open("POST", "albaDetailUpdateComplete", true);
		 request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
		 request.send("sCode=albaDetailUpdateComplete&"+"shCode="+shCode + "&abCode=" + abCode +"&acBankName="+ acBankName + "&acAccount="+acAccount);
		
		 // 필요한 정보 -> shCode , abCode , acBankName, acAccount
		
	}
	

	function albaInfoDetail() {
		let shopHiddenInput = document.getElementById('shopCode');
		let albaHiddenInput = document.getElementById('albaCode');
		
		let albaInfo = JSON.parse('${albaInfo}');
		
		shopHiddenInput.value = albaInfo.shCode;
		albaHiddenInput.value = albaInfo.abCode;
		

		let imgContentsTwo = document.getElementById('imgtwo');
		let img2 = document.createElement("img");

		if (albaInfo.abGender == "M") {
			img2.src = "/resources/img/M.png";
		} else if (albaInfo.abGender == "F") {
			img2.src = "/resources/img/F.png";
		}
		imgContentsTwo.appendChild(img2);

		// 입사 날짜
		let albaDetailSiaDate = document.getElementById('albaDetailSiaDate');
		albaDetailSiaDate.textContent = albaInfo.siaDate;

		let albaDetailCommuteTime = document
				.getElementById('albaDetailCommuteTime');
		if (albaInfo.workCmTime != "0" || albaInfo.leaveCmTime != "0") {
			albaDetailCommuteTime.textContent = albaInfo.workCmTime.replace(
					"_", " ")
					+ "   ~   " + albaInfo.leaveCmTime.replace("_", " ");
		} else {
			albaDetailCommuteTime.textContent = "최근 출퇴근 이력이 없습니다.";
		}

		//알바생 이름
		let name = document.getElementById('albaDetailName');
		name.textContent = albaInfo.abName;

		//시급
		let albaDetailSiaPay = document.getElementById('albaDetailSiaPay');
		albaDetailSiaPay.textContent = albaInfo.siaPay + " 원";

		// 핸드폰 번호
		let albaDetailPhone = document.getElementById('albaDetailPhone');
		albaDetailPhone.textContent = albaInfo.abPhone;

		// 주소
		let albaDetailAddr = document.getElementById('albaDetailAddr');
		albaDetailAddr.textContent = albaInfo.abAddr;

		// 이메일
		let albaDetailEmail = document.getElementById('albaDetailEmail');
		albaDetailEmail.textContent = albaInfo.abEmail;

		//알바생 생년월일
		let birth = document.getElementById('albaDetailNameBirth');
		birth.textContent = albaInfo.abBirth.substring(0, 4) + "년 "
				+ albaInfo.abBirth.substring(4, 6) + "월 "
				+ albaInfo.abBirth.substring(6, 8) + "일";

		let account = document.getElementById('albaDetailAccount');
		account.textContent = "[" + albaInfo.ssBankName + "]  " + albaInfo.ssAccount;


		
		let albaDetailRow = document.getElementById('albaDetailRowBtn');
		
		let albaDetailUpdateBtn = document.createElement('button');
		let albaDetailUpdateBtnText = document.createTextNode('계좌 수정');
		albaDetailUpdateBtn.appendChild(albaDetailUpdateBtnText);
		albaDetailUpdateBtn.className = "albaDetail_btn";

		albaDetailUpdateBtn.addEventListener('click', function() {
			albaDetailUpdateBtn.setAttribute("style","display:none;")
			albaInfoDetailAccountList(albaInfo.abCode); // 
		});
		
		
		let albaDetailDeleteBtn = document.createElement('button');
		let albaDetailDeleteBtnText = document.createTextNode('회원 삭제');
		albaDetailDeleteBtn.appendChild(albaDetailDeleteBtnText);
		albaDetailDeleteBtn.className = "albaDetailDelete_btn";
		albaDetailDeleteBtn.addEventListener('click', function() {
			var confrimDelete = confirm(albaInfo.abName + "님을 정말로 삭제하시겠습니까?");
			if(confrimDelete == true){
				albaManagementDetailDelete(shopHiddenInput.value,albaHiddenInput.value);
			}
		});

		albaDetailRow.appendChild(albaDetailDeleteBtn);
		albaDetailRow.appendChild(albaDetailUpdateBtn);
	}
	
	function albaManagementDetailDelete(shCode, abCode) {
		alert("shcode = " + shCode + "  abCode = " + abCode);
		
		 let request = new XMLHttpRequest();
		 request.onreadystatechange = function(){
		    if(this.readyState == 4 && this.status == 200){
		       let deleteState = decodeURIComponent(request.response);
		    	if(deleteState=="noSession"){
		    		 location.href="/LogInForm?lCode=manage";
		        }		
		       if(deleteState == "1"){
		    	   alert("정상적으로 삭제 되었습니다");
		    	   window.close();
		       }else{
		    	   alert("삭제를 실패 하였습니다.");
		       }
		    }
		 };
		 request.open("POST", "albaManagementDetailDelete", true);
		 request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
		 request.send("sCode=albaManagementDetailDelete&"+"shCode="+shCode + "&abCode=" + abCode);
		
		
	}
	
</script>
</html>