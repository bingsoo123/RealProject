<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Modify</title>
		<link href="/resources/css/modify.css" rel="stylesheet" />
	</head>
	
	<body>
		<div class="large">
			<!-- 아이디 -->
			<div class="space">
				<div class="title">
					아이디
				</div>
				
				<div class="spaceright">
					icia2021
				</div>
			</div>
			
			<!-- 비밀번호 -->
			<div class="space">
				<div class="title">
					비밀번호
				</div>
				
				<div class="spaceright">
					<div id="myButton1">
						<input onClick="editPassword()" class="button1" type="button" value="수정">
					</div>
					
					<!-- 안보이게 숨겨둠 -->
					<div id="passwordEdit">
						<input type="password" id="editValue1" placeholder="변경할 비밀번호를 입력하세요">
						<input class="button1" onClick="sendData1()" type="button" value="수정완료">
					</div>
				</div>
			</div>
			
			<!-- 이름 -->
			<div class="space">
				<div class="title">
					이름
				</div>
				
				<div class="spaceright">
					홍길동
					<div id="myButton2">
						<input class="button1" onClick="editName()" type="button" value="수정">
					</div>
					
					<!-- 안보이게 숨겨둠 -->
					<div id="nameEdit">
						<input type="text" id="editValue2" placeholder="변경할 이름을 입력하세요">
						<input class="button1" onClick="sendData2()" type="button" value="수정완료">
					</div>
				</div>
			</div>
			
			<!-- 생년월일 -->
			<div class="space">
				<div class="title">
					생년월일
				</div>
				
				<div class="spaceright">
					1995년 11월 11일 
				</div>
			</div>
			
			<!-- 성별 -->
			<div class="space">
				<div class="title">
					성별
				</div>
				
				<div class="spaceright">
					남자
				</div>
			</div>
			
			<!-- 계좌번호 -->
			<div class="space">
				<div class="title">
					계좌번호
				</div>
				
				<div class="spaceright">
					농협은행 111-2222-3333-44
					<div id="myButton3">
						<input class="button1" onClick="editAccount()" type="button" value="수정">
					</div>
					
					<!-- 안보이게 숨겨둠 -->
					<div id="accountEdit">
						<select id="bankName" name="bankName">
							<option value="은행이름">은행이름</option>
							<option value="농협은행">농협은행</option>
							<option value="기업은행">기업은행</option>
							<option value="우리은행">우리은행</option>
							<option value="국민은행">국민은행</option>
							<option value="카카오뱅크">카카오뱅크</option>
							<option value="케이뱅크">케이뱅크</option>
						</select>
						
						<input type="text" id="editValue3" placeholder="변경할 계좌를 입력하세요"><br>
						<input class="button1" onClick="sendData3()" type="button" value="수정완료">
					</div>
				</div>
			</div>
		</div>
		
		<!-- 수정 완료
			<div class="buttonlocation">
				<input class="button1" type="button" value="수정완료">
			</div>
		-->
	</body>
	
	<script>
		function editPassword(){
			var myButton1 = document.getElementById("myButton1");
			var passwordEdit = document.getElementById("passwordEdit");
			
			myButton1.style.display = 'none';
			passwordEdit.style.display = 'block';
 		}
		
		function editName(){
			var myButton2 = document.getElementById("myButton2");
			var nameEdit = document.getElementById("nameEdit");
			
			myButton2.style.display = 'none';
			nameEdit.style.display = 'block';
 		}
		
		function editAccount(){
			var myButton3 = document.getElementById("myButton3");
			var accountEdit = document.getElementById("accountEdit");
			
			myButton3.style.display = 'none';
			accountEdit.style.display = 'block';
 		}
		
		function sendData1(){
			var editValue1 = document.getElementById("editValue1");
			alert(editValue1.value);
		}
		
		function sendData2(){
			var editValue2 = document.getElementById("editValue2");
			alert(editValue2.value);
		}
		
		function sendData3(){
			var b = document.getElementById("bankName");
			var bankName = b.options[b.selectedIndex].text;
			var editValue3 = document.getElementById("editValue3");
			alert("은행명: "+ bankName + " 계좌번호: " + editValue3.value);
		}
		
		
	</script>
	
</html>