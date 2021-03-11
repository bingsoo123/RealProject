<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>accessDetail</title>
		<link href="/resources/css/accessDetail.css" rel="stylesheet" />
	</head>
	
	<body>
	<div class="all">
	
		<div class="one">
			<div class="img-one">
				<img src="/resources/img/logo.png" style="width:350px;height:100px;">
				<div style="width:100%;height:10px;background-color:#FEE300;"></div>
			</div>
		</div>
		
		<div class="two">
			<div class="img-two" id="imgtwo">
			</div>
		</div>
		
		<div class="three">
			<lable class="lable">아이디</lable>
			<div class="info" id="id"></div><br/>
			
			<lable class="lable">이름</lable>
			<div class="info" id="name"></div><br/>
			
			<lable class="lable">생년월일</lable>
			<div class="info" id="birth"></div><br/>
			
			<lable class="lable">계좌번호</lable>
			<div class="info" id="account"></div><br/>
			
			<lable class="lable">이력서</lable>
			<div class="info" id="rsname"></div>
		</div>
		
	</div>
	</body>
	
	<script>
	let albaInfo = JSON.parse('${abDetail}');
	
	let imgtwo = document.getElementById('imgtwo');
	
	
		for (i = 0; i < albaInfo.length; i++) {
			if (albaInfo[i].abGender == "M") {
				let img2 = document.createElement("img");
				img2.className = "img2"
				img2.src = "/resources/img/M.png";
				imgtwo.appendChild(img2);
			} else if (albaInfo[i].abGender == "F") {
				let img2 = document.createElement("img");
				img2.className = "img2"
				img2.src = "/resources/img/F.png";
				imgtwo.appendChild(img2);
			}
		}
		//id값
		let id = document.getElementById('id');
		id.textContent = albaInfo[0].abId;
		//알바생 이름
		let name = document.getElementById('name');
		name.textContent = albaInfo[0].abName;
		//알바생 생년월일
		let birth = document.getElementById('birth');
		birth.textContent = albaInfo[0].abBirth.substring(0, 4) + "년"
				+ albaInfo[0].abBirth.substring(4, 6) + "월"
				+ albaInfo[0].abBirth.substring(6, 8) + "일";
		
		//계좌번호(다 가져오기)
		for (i = 0; i < albaInfo.length; i++) {
			let account = document.getElementById('account');
			account.textContent = albaInfo[i].Account + " ("
					+ albaInfo[i].bName + ")";
		}
		//알바생 이력서
		let rsname = document.getElementById('rsname');
		rsname.textContent = albaInfo[0].rsName;
	</script>
</html>