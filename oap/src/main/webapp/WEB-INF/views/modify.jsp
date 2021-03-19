<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Modify</title>
<link href="/resources/css/modify.css" rel="stylesheet" />
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>

<body onload="init()">
	<div class="large" id="large">
		<!-- 아이디 -->
		<div class="space">
			<div class="title">아이디</div>

			<div class="spaceright">
			
				<span id="idDat">
			
				</span>
			
			</div>
		</div>
		<!-- 비밀번호 -->
		<div class="space">
			<div class="title">비밀번호</div>

			<div class="spaceright">
					<span  id="pwDat"></span>
				<div id="myButton1">
					<input onClick="editPassword()" class="button1" type="button"
						value="수정">
				</div>

				<!-- 안보이게 숨겨둠 -->
				<span id="passwordEdit">
					<input type="password" id="editValue1" value="${editN}" 	placeholder="변경할 비밀번호를 입력하세요">
						 <input class="button1"
						onClick="sendData1()" type="button" value="수정완료">
				</span>
			</div>
		</div>
	
		<!-- 이름 -->
		<div class="space">
			<div class="title">이름</div>

			<div class="spaceright">
			
				<span id="nameDat">
				</span>
				
				<span id="myButton2">
					<input class="button1" onClick="editName()" type="button" value="수정">
				</span>
				
			</div>

			<!-- 안보이게 숨겨둠 -->
			<span id="nameEdit"> 
				<input type="text" id="editValue2" placeholder="변경할 이름을 입력하세요">
				<input class="button1" onClick="sendData2()" type="button"
					value="수정완료">
			</span>
		</div>
		

		<!-- 생년월일 -->
		<div class="space">
			<div class="title">생년월일</div>

			<div class="spaceright">
				<span id="birthDat"></span>
			</div>
		</div>
		<!-- 성별 -->
		<div class="space">
			<div class="title">성별</div>

			<div class="spaceright">
				<span id="genderDat"></span>
			</div>
		</div>
		<!-- 계좌번호 -->
		<div class="space" id="space">
			<div class="title">계좌번호</div>
			
			<div class="littleSpace" id="littleSpace">
			
				<!-- 안보이게 숨겨둠 -->
				<div id="accountEdit">
					<select id="bankName" name="bankName"  >
						<option value="은행이름">은행이름</option>
						<option value="농협은행">농협은행</option>
						<option value="기업은행">기업은행</option>
						<option value="우리은행">우리은행</option>
						<option value="국민은행">국민은행</option>
						<option value="카카오뱅크">카카오뱅크</option>
						<option value="케이뱅크">케이뱅크</option>
					</select>
					<input type="text" id="editValue3"  placeholder="변경할 계좌를 입력하세요">
				</div>
				
				
				
				<!-- 계좌 추가 숨겨진 인풋박스 -->
				<div id="accountAdd">
					<select id="addbankName" name="addbankName"  >
						<option value="은행이름">은행이름</option>
						<option value="농협은행">농협은행</option>
						<option value="기업은행">기업은행</option>
						<option value="우리은행">우리은행</option>
						<option value="국민은행">국민은행</option>
						<option value="카카오뱅크">카카오뱅크</option>
						<option value="케이뱅크">케이뱅크</option>
					</select>
					<input type="text" id="addValue"  placeholder="추가할 계좌를 입력하세요">
				</div>
			
			</div>
			
			
		</div>
		
		
	</div>
</body>

<script>

	let albaInfo = '${memInfo}';
	
	

	let memberInfo = JSON.parse(albaInfo);	
	function init() {
		
		
		//아이디

		let idNameDat = document.getElementById('idDat');
		idNameDat.className = "spaceright";
		idNameDat.textContent = memberInfo[0].abId;

		//비밀번호
		let pwcon = document.getElementById('pwDat');
		pwcon.className = "spaceright";
		let pwNameDat = document.createElement('input');
		pwNameDat.readOnly = true;
		pwNameDat.type="password";
		pwNameDat.className="noborder"
		pwNameDat.value=memberInfo[0].abPw;
		pwcon.appendChild(pwNameDat);
		//이름
		let nameDat = document.getElementById('nameDat');
		nameDat.className = "spaceright";
		nameDat.textContent = memberInfo[0].abName;
	
		//생년월일
		let birthDat = document.getElementById('birthDat');
		birthDat.className = "spaceright";
		birthDat.textContent = memberInfo[0].abBirth.substring(0,4)+"년"
		+ memberInfo[0].abBirth.substring(4,6) +"월"
		 +memberInfo[0].abBirth.substring(6,8)+"일";
		
		//성별
		let genderDat = document.getElementById('genderDat');
		genderDat.className = "spaceright";
		if (memberInfo[0].abGender == "M") {
			genderDat.textContent = "남자";
		} else {
			genderDat.textContent = "여자";
		}

		//계좌정보
		for (i = 0; i < memberInfo.length; i++) {
			let num = i;
			
			let space = document.getElementById("space");
			
			let littleSpace = document.getElementById("littleSpace");
			
			let groupDiv = document.createElement('div');
			groupDiv.id = "groupDiv";
			
			let spaceright = document.createElement("div");
			spaceright.id = "spaceright";
			spaceright.className = "spaceright";
			
			// 계좌정보 수정 삭제 다 묶는 div
			let accountDiv = document.createElement("div");
			accountDiv.id = "accountDiv";
			
			let accountDat = document.createElement("div");
			accountDat.id = "accountDat" + i;
			accountDat.className = "accountDat";
			accountDat.innerText = memberInfo[i].acBankName + " " + memberInfo[i].acAccount;
			
			accountDiv.appendChild(accountDat);
			spaceright.appendChild(accountDiv);
			
			// 수정 버튼
			let editAccount = document.createElement('div');
			editAccount.id = "myButton3";
			
			let editAccountButton = document.createElement('input');
			editAccountButton.className = "button2";
			editAccountButton.type = "button";
			editAccountButton.value = "수정";
 			editAccountButton.addEventListener('click', function(){
 				editAccountInfo(num);
 			});
			
			editAccount.appendChild(editAccountButton);
		
			accountDiv.appendChild(editAccount);
			
			// 삭제버튼
			let deleteAccount = document.createElement('div');
			deleteAccount.id = "myButton3";
			
			let deleteAccountButton = document.createElement('input');
			deleteAccountButton.className = "button2";
			deleteAccountButton.type = "button";
			deleteAccountButton.value = "삭제";
			deleteAccountButton.addEventListener('click', function(){
				deleteAccountInfo(num);
 			});
			
			deleteAccount.appendChild(deleteAccountButton);
		
			accountDiv.appendChild(deleteAccount);
			
			spaceright.appendChild(accountDiv);
			
			groupDiv.appendChild(spaceright);
			
			littleSpace.appendChild(groupDiv);
		}
		//<input type="button" value="계좌 추가" onClick="">
		let space = document.getElementById("space");
		
		let spaceright = document.createElement("div");
		spaceright.id = "spaceright";
		spaceright.className = "spaceright";
		
		let addAccountDiv = document.createElement('div');
		addAccountDiv.id = "myButton4";
		
		let addAccount = document.createElement('input');
		addAccount.className = "button1";
		addAccount.type = "button";
		addAccount.value = "계좌 추가";
		addAccount.addEventListener('click', function(){
				addAccountInfo();
		});
		addAccountDiv.appendChild(addAccount);
			
		spaceright.appendChild(addAccountDiv);
		
		littleSpace.appendChild(spaceright);
		
	}

	function editPassword() {
		var myButton1 = document.getElementById("myButton1");
		var passwordEdit = document.getElementById("passwordEdit");

		myButton1.style.display = 'none';
		passwordEdit.style.display = 'block';
	}

	function editName() {
		let myButton2 = document.getElementById("myButton2");
		let nameEdit = document.getElementById("nameEdit");

		myButton2.style.display = 'none';
		nameEdit.style.display = 'block';

	}

	function editAccountInfo(num) {
		console.log("수정 버튼 클릭 완료");
		
		let myButton3 = document.getElementById("myButton3");
		let accountEdit = document.getElementById("accountEdit");
		
		myButton3.style.display = 'none';
		accountEdit.style.display = 'block';
		
		let accountEditTest = document.getElementById("accountEdit");
		
		let accountInfoComplete = document.createElement('input');
		accountInfoComplete.className = "button1";
		accountInfoComplete.type = "button";
		accountInfoComplete.value = "수정완료";
		accountInfoComplete.addEventListener('click', function(){
			sendData3(num);
		});
		accountEditTest.appendChild(accountInfoComplete);
		
	}

	// 비밀번호
	function sendData1() {
		var editValue1 = document.getElementById("editValue1");
		alert(editValue1.value);

		let pwInfo = editValue1.value;
		let pwEdit = document.createElement('input');
		pwEdit.type = "hidden";
		pwEdit.value = memberInfo[0].abCode;
		let codeInfo = pwEdit.value;

		let form = document.createElement('form');
		form.action = "ModifyComplete?abCode=" + codeInfo + "&abPw=" + pwInfo;
		form.method = "POST";
		document.body.appendChild(form);
		form.appendChild(accountEdit);

		form.submit();

	}

	// 이름 수정
	function sendData2() {
		var editValue2 = document.getElementById("editValue2");
		let infoCode = document.getElementById("nameDat");
		let nameInfo = editValue2.value;
		let nameEdit = document.createElement('input');
		nameEdit.type = "hidden";
		nameEdit.value = memberInfo[0].abCode;
		let codeInfo = nameEdit.value;

		let form = document.createElement('form');
		form.action = "ModifyComplete2?abCode=" + codeInfo + "&abName=" + nameInfo;
		form.method = "POST";
		document.body.appendChild(form);
		form.appendChild(nameEdit);
		
		form.submit();

		alert(nameInfo);

	}

	// 계좌 수정
	function sendData3(num) {
		console.log("sendData3 진입완료");
		
		let b = document.getElementById("bankName");
		
		let editAcBankName = b.options[b.selectedIndex].text; // 변결할 은행 이름 
		let editAcAccount = document.getElementById("editValue3").value; // 변경할 계좌 번호
		let acAccount = memberInfo[num].acAccount; // 기존 계좌 번호
		//let acAccount = document.getElementById("accountDat" + num).innerHTML; // 기존 계좌 번호
 		
 		
 		let accountEdit = document.createElement('input');
 		accountEdit.type = "hidden";
 		accountEdit.value = memberInfo[0].abCode; 
 		let abCode = accountEdit.value; // abCode
 		
 		console.log("알바코드::" + abCode + " " + "변경할은행이름::" + editAcBankName + " "
 						+ "변경할계좌번호::" + editAcAccount + " " + "기존계좌번호::" + acAccount);
 		
 		
 		let request = new XMLHttpRequest();
		request.onreadystatechange = function(){
			if(this.readyState == 4 && this.status == 200){
				let messageData = decodeURIComponent(request.response);
				let message = messageData.replace(/\+/g, " ");
				console.log(message);
				if(message != "") {
					alert(message);
					location.reload();
				}
			}
		};
		 
		request.open("POST", "ModifyComplete3" , true);
		request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
		request.send("sCode=ModifyComplete3&"+ "abCode=" + abCode + "&editAcBankName=" + editAcBankName + "&editAcAccount=" + editAcAccount
					+ "&acAccount=" + acAccount);
 		
 		

// 		let form = document.createElement('form');
// 		form.action = "ModifyComplete3?abCode=" + abCode + "&editAcBankName=" + editAcBankName + "&editAcAccount=" + editAcAccount
// 						+ "&acAccount=" + acAccount;
// 		form.method = "POST";
// 		form.appendChild(accountEdit);
// 		document.body.appendChild(form);

// 		form.submit();
		
// 		alert("수정이 완료되었습니다.");

	}
	
	// 계좌 삭제
	function deleteAccountInfo(num) {
		let accountDelete = document.createElement('input');
		accountDelete.type = "hidden";
		accountDelete.value = memberInfo[0].abCode; 
 		let abCode = accountDelete.value; // abCode
 		
 		let acAccount = memberInfo[num].acAccount; // 기존 계좌 번호
		
 		console.log("삭제할 abCode: " + abCode + "삭제할 계좌번호: " + acAccount);
 		
 		let request = new XMLHttpRequest();
		request.onreadystatechange = function(){
			if(this.readyState == 4 && this.status == 200){
				let messageData = decodeURIComponent(request.response);
				let message = messageData.replace(/\+/g, " ");
				console.log(message);
				if(message != "") {
					alert(message);
					location.reload();
				}
			}
		};
		 
		 request.open("POST", "DeleteAccountInfo" , true);
		 request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
		 request.send("sCode=DeleteAccountInfo&" + "abCode=" + abCode + "&acAccount=" + acAccount);
 		
		
	}
	
	
	// 계좌 추가
	function addAccountInfo() {
		
		let myButton3 = document.getElementById("myButton4");
		let accountAdd = document.getElementById("accountAdd");
		
		myButton3.style.display = 'none';
		accountAdd.style.display = 'block';
		console.log("업무추가 진입");
		
		let accountAddTest = document.getElementById("accountAdd");
		
		let accountInfoAdd = document.createElement('input');
		accountInfoAdd.className = "button1";
		accountInfoAdd.type = "button";
		accountInfoAdd.value = "추가";
		accountInfoAdd.addEventListener('click', function(){
			addAccountComplete();
		});
		accountAddTest.appendChild(accountInfoAdd);
		
		

	}
	
	function addAccountComplete() {
		console.log("추가 완료 테스트");
		
		let accountEdit = document.createElement('input');
 		accountEdit.type = "hidden";
 		accountEdit.value = memberInfo[0].abCode; 
 		let abCode = accountEdit.value; // abCode
		
		let b = document.getElementById("addbankName");
		let acBankName = b.options[b.selectedIndex].text; // 추가할 은행 이름 bankName
		
		let acAccount = document.getElementById("addValue").value; // 추가할 계좌 번호
		
		console.log("abCode:: " + abCode + "acBankName:: " + acBankName + "acAccount:: " + acAccount);
		
		// where 절 보내야함
		let form = document.createElement('form');
		form.action = "AddAccountInfo?abCode=" + abCode + "&acBankName=" + acBankName + "&acAccount=" + acAccount;
		form.method = "POST";
		form.appendChild(accountEdit);
		document.body.appendChild(form);
		
		form.submit();
		
		alert("계좌 추가를 완료하였습니다.");
	}
	
</script>

</html>