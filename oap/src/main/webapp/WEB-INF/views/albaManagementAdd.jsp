<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/albaManagementAdd.css" rel="stylesheet" />
<script  src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
</head>
<body onload="albaManaInit();">
 <h5>매장에 지원한 알바 리스트 입니다.</h5>
	<div class = "albaMana" id="albaMana"></div>

</body>

<script>

	function albaApplyCancel(shCode,abCode) {
		let request = new XMLHttpRequest();
	    request.onreadystatechange = function() {
	       if (this.readyState == 4 && this.status == 200) {
	    	   let deleteState = decodeURIComponent(request.response);
		    	if(deleteState=="noSession"){
		    		 location.href="/LogInForm?lCode=manage";
		        }		
		       if(deleteState == "applyCancel"){
		    	   alert("해당 알바생의 지원 취소를 완료하였습니다.");
	    		   window.open('about:blank','_self').self.close();
		       }else{
		    	   alert("서버가 불안정합니다. 다시 시도해주세요.");
		       }
	       }
		}
		 	request.open("POST","albaApplyCancel",true);
			 	request.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
			request.send("sCode=albaApplyCancel&shCode=" + shCode +"&abCode=" + abCode);
		
	}

	function albaManaInit() {
		let al = document.getElementById('albaMana');
		let mAlbaList = '${mAlbaList }';
		let albaList = JSON.parse(mAlbaList);

		
		let albaAddContents = document.createElement('div');
		albaAddContents.className = "albaAdd_contents";
		for (i = 0; i < albaList.length; i++) {
			let index = i;	
			let albaRow1 = document.createElement('div');
			albaRow1.className = "albaAdd_contents_row1";

			let albaRow = document.createElement('div');
			albaRow.className = "albaAdd_contents_row";

			albaRow.addEventListener('click', function() {
				albaManageSelect(albaList[index].shCode,albaList[index].abCode);
			});
			
	
			let albaGender = document.createElement("img");
			albaGender.className = "albaAddImg1";
			if (albaList[i].abGender == "M") {
				albaGender.src = "/resources/img/M.png";
			} else if (albaList[i].abGender == "F") {
				albaGender.src = "/resources/img/F.png";
			}
			albaRow.appendChild(albaGender);
			let abName = document.createElement('p');
			abName.className = "albaAdd_name1";
			abName.textContent = albaList[i].abName + "(만 " + getAgeFromBirthDay(albaList[i].abBirth) + "세 )"; // abBirth는 date가아니라 String이여서 오라클에서 가공처리
			albaRow.appendChild(abName);

			let albaPhone = document.createElement('div');
			albaPhone.className = "albaAdd_phone";
			albaPhone.textContent = albaList[i].abPhone;
			albaRow.appendChild(albaPhone);

			let albaAddr = document.createElement('p');
			albaAddr.textContent = albaList[i].abAddr;
			albaRow.appendChild(albaAddr);
			
			
			albaRow1.appendChild(albaRow);
			
			albaAddContents.appendChild(albaRow1);

		}
		al.appendChild(albaAddContents);
	}
	
	
	
	function albaManageSelect(shCode, abCode) {
		alert(shCode + "    " + abCode);
		let request = new XMLHttpRequest();
	    request.onreadystatechange = function() {
	       if (this.readyState == 4 && this.status == 200) {
	    	   let json = decodeURIComponent(request.response);
		    	if(json=="noSession"){
		    		 location.href="/LogInForm?lCode=manage";
		        }		
			   let jsonData = JSON.parse(json);
			   albaManageSelectSetp2(jsonData);
	       }
		}
		 	request.open("POST","albaManagementAddSelect",true);
			 	request.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
			request.send("sCode=albaManagementAddSelect&shCode=" + shCode + "&abCode=" + abCode);
		

	}
	
	function albaManageSelectSetp2(albaInfo) {
		console.log(albaInfo);
		$('#albaMana').empty();
		let al = document.getElementById('albaMana');
		let albaAddContents = document.createElement('div');
		albaAddContents.className = "albaAdd_contents1";
		
		
		let albaAddContentsLeft = document.createElement('div');
		albaAddContentsLeft.className = "albaAdd_left_content";
		
		let albaGender = document.createElement("img");
		albaGender.className = "albaAddImg";
		if (albaInfo.abGender == "M") {
			albaGender.src = "/resources/img/M.png";
		} else if (albaInfo.abGender == "F") {
			albaGender.src = "/resources/img/F.png";
		}
		
		let albaAddName = document.createElement("p");
		albaAddName.className = "albaAdd_name";
		albaAddName.textContent = albaInfo.abName;
		
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
		albaAddNaeyong.textContent = albaInfo.abBirth;
		
		albaAddContentsRight.appendChild(albaAddTitle);
		albaAddContentsRight.appendChild(albaAddNaeyong);
		
		let albaAddTitle1 = document.createElement('div');
		albaAddTitle1.className = "albaAdd_naeyong_title";
		albaAddTitle1.textContent = "전화번호";
		let albaAddNaeyong1 = document.createElement('div');
		albaAddNaeyong1.className = "albaAdd_naeyong";
		albaAddNaeyong1.textContent = albaInfo.abPhone;
		
		albaAddContentsRight.appendChild(albaAddTitle1);
		albaAddContentsRight.appendChild(albaAddNaeyong1);
		
		let albaAddTitle2 = document.createElement('div');
		albaAddTitle2.className = "albaAdd_naeyong_title";
		albaAddTitle2.textContent = "주소";
		let albaAddNaeyong2 = document.createElement('div');
		albaAddNaeyong2.className = "albaAdd_naeyong";
		albaAddNaeyong2.textContent = albaInfo.abAddr.replace(/\+/gi," ");
		
		albaAddContentsRight.appendChild(albaAddTitle2);
		albaAddContentsRight.appendChild(albaAddNaeyong2);
		
		let albaAddTitle3 = document.createElement('div');
		albaAddTitle3.className = "albaAdd_naeyong_title";
		albaAddTitle3.textContent = "이메일";
		let albaAddNaeyong3 = document.createElement('div');
		albaAddNaeyong3.className = "albaAdd_naeyong";
		albaAddNaeyong3.textContent = albaInfo.abEmail;
		
		albaAddContentsRight.appendChild(albaAddTitle3);
		albaAddContentsRight.appendChild(albaAddNaeyong3);
		
		let albaAddTitle7 = document.createElement('div');
		albaAddTitle7.className = "albaAdd_naeyong_title";
		albaAddTitle7.textContent = "계좌번호";
		let albaAddNaeyong7 = document.createElement('div');
		albaAddNaeyong7.className = "albaAdd_naeyong";
		albaAddNaeyong7.textContent = albaInfo.ssBankName + "  " + albaInfo.ssAccount;
		
		albaAddContentsRight.appendChild(albaAddTitle7);
		albaAddContentsRight.appendChild(albaAddNaeyong7);
		
		
		let albaAddTitle4 = document.createElement('div');
		albaAddTitle4.className = "albaAdd_naeyong_title";
		albaAddTitle4.textContent = "시급";
		
		
		let albaAddNaeyong4_p = document.createElement('p');
		let albaAddNaeyong4 = document.createElement('input');
		albaAddNaeyong4.type = "text";
		albaAddNaeyong4.className = "albaAdd_naeyong_input";
		albaAddNaeyong4.setAttribute("id","albaPay");
		albaAddContentsRight.appendChild(albaAddTitle4);
		albaAddContentsRight.appendChild(albaAddNaeyong4);
		
		let albaAddTitle5 = document.createElement('div');
		albaAddTitle5.className = "albaAdd_naeyong_title";
		albaAddTitle5.textContent = "휴게 시간";
		
		
		let albaAddNaeyong5 = document.createElement('input');
		albaAddNaeyong5.type = "text";
		albaAddNaeyong5.className = "albaAdd_naeyong_input";
		albaAddNaeyong5.setAttribute("id","restTime");
		albaAddContentsRight.appendChild(albaAddTitle5);
		albaAddContentsRight.appendChild(albaAddNaeyong5);

		
		albaAddContents.appendChild(albaAddContentsRight);
		
		
		
		
		let albaBtnContent = document.createElement('div');
		albaBtnContent.className = "albaAdd_btn_content";
		
		let albaPrevBtn = document.createElement('button');
		albaPrevBtn.className = "albaAdd_prev_btn";
		let albaPrevBtnText = document.createTextNode('이전 페이지');
		albaPrevBtn.appendChild(albaPrevBtnText);

		albaPrevBtn.addEventListener('click', function() { // 이전..
			window.location.reload();
		});
		
		
		let albaDeleteBtn = document.createElement('button');
		albaDeleteBtn.className = "albaDelete_btn";
		let albaDeleteBtnText = document.createTextNode('지원 취소');
		albaDeleteBtn.appendChild(albaDeleteBtnText);
		
		albaDeleteBtn.addEventListener('click', function() { // 추가
			albaApplyCancel(albaInfo.shCode, albaInfo.abCode)
		});
		
		
		
		let albaAddBtn = document.createElement('button');
		albaAddBtn.className = "albaAdd_btn";
		let albaAddBtnText = document.createTextNode('추가');
		albaAddBtn.appendChild(albaAddBtnText);
		
		albaAddBtn.addEventListener('click', function() { // 추가
			albaAddComplete(albaInfo);
		});
		
		
		albaBtnContent.appendChild(albaDeleteBtn);
		albaBtnContent.appendChild(albaPrevBtn);
		albaBtnContent.appendChild(albaDeleteBtn);
		albaBtnContent.appendChild(albaAddBtn);
		
		albaAddContents.appendChild(albaBtnContent);
		
		al.appendChild(albaAddContents);
	}
	
	function albaAddComplete(albaInfo) {
		let siaPay = document.getElementById('albaPay').value;
		let restTime = document.getElementById('restTime').value;
		let shCode = albaInfo.shCode;
		let abCode = albaInfo.abCode;
		let ssAccount = albaInfo.ssAccount;
		let ssBankName = albaInfo.ssBankName;
		
		alert("siaPAy :: " + siaPay +  "resttime :: " + restTime + "ssAcount::" + ssAccount);
		
		let request = new XMLHttpRequest();
	    request.onreadystatechange = function() {
	       if (this.readyState == 4 && this.status == 200) {
	    	   let insertState = decodeURIComponent(request.response);
		    	if(insertState=="noSession"){
		    		 location.href="/LogInForm?lCode=manage";
		        }		
	    	   if(insertState == 1){
	    		   alert("정상적으로 알바생을 등록하였습니다.");
// 	    		   opener.parent.location.reload();
	    		   window.open('about:blank','_self').self.close();
					
	    	   }else{
	    		   alert("실패 하였습니다.");
	    	   }
	   			$('#albaMana').empty();
	       }
		}
		request.open("POST","albaManagementAddComplete",true);
		request.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
		request.send("sCode=albaManagementAddComplete&shCode=" + shCode +"&abCode=" + abCode +"&mrGrade=A&siaPay="+siaPay+"&restTime="+restTime +"&ssAccount=" + ssAccount + "&ssBankName=" + ssBankName);
		// + "&siaPay =" + siaPay + "&restTime = " + restTime + "&ssAccount = " + ssAccount
		
		
	}
	
	function getAgeFromBirthDay(birthdayPram) {
		var birthday = new Date(birthdayPram);
		var today = new Date(); // 오늘날짜 
		// 오늘날짜 - 생년월일 객체의 연도 빼기
		var years = today.getFullYear() - birthday.getFullYear();
		// years 의 값이 실질적으로 구해진 나이이다.
		console.log('계산 된 나이 : ' + years);
		/* 만 나이가 아닌 한국나이로 조회를 원한다면 태어난 해에 +1 살 먹기 때문에 +1 한 38 살로 리턴
		* 계속해서 만 나이 계산을 원하면 아래 처리를 계속해준다.
		* 연도가 같은 두 객체를 비교하여 생년월일 객체가 오늘 날짜 객체보다 크다면 -1 해준다.
		* (생일이 아직 지나지 않았다면 -1 을 한다.)
		*/
		// 생년월일 객체의 연도를 오늘 날짜 객체의 연도로 변경
		birthday.setFullYear(today.getFullYear());

		// 같은 연도가 된 객체를 비교하여 월일이 지났는 지 여부를 판단하여 years 를 뺀다.
		if (today < birthday){
			years--;
		}
		console.log('계산 된 만 나이 : ' + years);
	
		return years;
		}
		
	
</script>
</html>