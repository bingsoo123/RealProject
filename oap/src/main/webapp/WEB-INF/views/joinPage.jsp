<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알바생님 환영합니다 !</title>
<link href="/resources/css/joinPage2.css" rel="stylesheet"/> 
</head>
<body>

<form action="Join" method="post" id="joinInfo"  name="joinInfo">

<div class="regist_content">
<div class="imgclass">
<img src="/resources/img/regist_step3.png" style="width:1200px; height:200px;">
</div>
<br/><br/><br/>

	<div class="sp">
	<span class="regist_title"> 
		<label for="Id">아이디</label> 
	</span>
		<input type="text" class="regist_info" name="sId" minlength="3" maxlength="12" title="아이디" required>

	 
	<span class="regist_title"> 
		<label for="Pw">비밀번호</label>
	</span>
		<input type="password" class="regist_info" name="sPw" minlength="3" maxlength="12" title="비밀번호" required>

	 
	<span class="regist_title"> 
		<label for="Pw2">비밀번호 재확인</label>
	</span>
		<input type="password" class="regist_info" name="pCheck" minlength="3" maxlength="12" title="비밀번호 재확인 입력" onBlur="pwdCheck()" required>

	 
	<span class="regist_title"> 
		<label for="name">이름</label>
	</span>
		<input type="text" class="regist_info" name="sName" minlength="2" maxlength="6" title="이름" required>

	<span class="regist_title"> 
		<label for="email">이메일</label>
	</span>
		<input type="text" class="regist_info_email" name="email"  title="이메일계정" required>@
		<input type="text" class="regist_info_email" name="email"  title="이메일주소" required>
		
	<span class="regist_title"> 
		<label for="email">주소</label>
	</span>
		<input type="text" maxlength="30" id= "regist_info_addr" name="sAddr" class="regist_info_addr" name="shAddr" value="${ Road}${detail}" />
		<input type="button" value="주소찾기" onClick="search_store()" class="regist_info_addr_btn">
	 
	<div class="birthday">
		<span class="regist_title">
			<label for="birthday">생년월일</label>
		</span>
		<input type="text" class="regist_info_birth" name="aInfo" maxlength="4" placeholder="년(4자)">
			<select class="regist_info_birth_select" name="aInfo">
	             <option value="Month">월</option>
	             <option value="01">01</option>
	             <option value="02">02</option>
	             <option value="03">03</option>
	             <option value="04">04</option>
	             <option value="05">05</option>
	             <option value="06">06</option>
	             <option value="07">07</option>
	             <option value="08">08</option>
	             <option value="09">09</option>
	             <option value="10">10</option>
	             <option value="11">11</option>
	       		 <option value="12">12</option>
	        </select>
	     <input type="text" class="regist_info_birth" name="aInfo" maxlength="2" placeholder="일">
	</div>
	 
	<div class="gender">
		<span class="regist_title">
			<label for="gender">성별</label>
		</span>
		<select class="regist_info_gender" name="sGender" id="gender">
	             <option value="gender">성별</option>
	             <option value="M">남자</option>
	             <option value="F">여자</option>
	    </select>
	</div>
	
	<span class="regist_title"> 
		<label for="phone">휴대폰 번호</label>
	</span>
		<input type="text" class="regist_info" name="sPhone" minlength="11" maxlength="11" title="휴대폰번호" required>
	 
	 
	 
	<div class="account">
		<span class="regist_title"> 
			<label for="account">계좌번호</label>
		</span>
		<select class="regist_info_account" name="bankName">
	             <option value="KB">국민</option>
	             <option value="NH">농협</option>
	             <option value="신한">신한</option>
	             <option value="우리">우리</option>
	             <option value="KEB">하나</option>
	             <option value="Kakao">카카오</option>
	    </select>
	    <input class="regist_info_account_input" type="text" name="sAccount">
	</div>
	
	<input type="button" value="가입하기" class="join" onClick="sub()">
	</div>
</div>
</form>

</body>
<script>

	function pwdCheck() {
		// 패스워드와 패스워드재확인의 데이터가 일치하는지 확인
		var pwd = document.getElementsByName("sPw")[0];
		var pwd2 = document.getElementsByName("pCheck")[0];

		if (pwd.value != pwd2.value) {
			pwd.value = "";
			pwd2.value = "";
			pwd.placeholder = "패스워드가 일치하지 않습니다 !";
			pwd.focus();
		}
	}
	
	
	function search_store(){

		let form = document.createElement("form");
		form.setAttribute("method","get");
		form.setAttribute("action",'searchMapJoin');
		form.setAttribute("target","regist_info_addr");
		

		document.body.appendChild(form);
			

		window.open('searchMap_join.jsp','regist_info_addr','top=10,left=10,width=600,height=600,status=no,menubar=no,toolbar=no,resizable=no');

		form.submit();
				
		}
	
	
	function sub(){
		var data = document.getElementsByName("aInfo");
		var account = document.getElementsByName("account");
		var tt = document.getElementById("joinInfo");
		
		var input = document.createElement("input");
		input.type="type";
		input.name="sBirth";
		input.value=data[0].value + data[1].value + data[2].value;
		tt.appendChild(input);
		
		var input2 = document.createElement("input");
		input2.type="type";
		input2.name="sCode";
		input2.value="${sCode}";
		tt.appendChild(input2);
		
		document.joinInfo.submit();
	}
	
</script>
</html>