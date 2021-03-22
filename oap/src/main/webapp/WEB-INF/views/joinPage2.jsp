<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자님 환영합니다 !</title>
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
	 
	<div class="birthday">
		<span class="regist_title"> 
			<label for="birthday">생년월일</label>
		</span>
		
		<input type="text" class="regist_info_birth" name="aInfo" maxlength="4" placeholder="년(4자)">
		
		<select class="regist_info_birth_select" name="aInfo" id="birthday">
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
        
	    <input type="text" class="regist_info_birth" name="aInfo" maxlength="2" placeholder="일(2자)">
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
	
	function sub(){
		var data = document.getElementsByName("aInfo");
		var mail = document.getElementsByName("email");
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
		
		var input3 = document.createElement("input");
		input3.type="type";
		input3.name="sEmail";
		input3.value=mail[0].value + "@" + mail[1].value;
		tt.appendChild(input3);
		
		document.joinInfo.submit();
	}
</script>
</html>