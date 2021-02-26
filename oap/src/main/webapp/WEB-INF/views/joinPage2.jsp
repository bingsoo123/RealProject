<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/joinPage2.css" rel="stylesheet"/> 
</head>
<body>

<div class="regist_content">
<div class="imgclass">
<img src="/resources/img/regist_step3.png" style="width:1200px; height:200px;">
</div>
<br/><br/><br/>
	<div class="sp">
	<span class="regist_title"> 
		<label for="Id">아이디</label> 
	</span>
		<input type="text" class="regist_info" name="aInfo" minlength="3" maxlength="12" title="아이디" required>

	 
	<span class="regist_title"> 
		<label for="Pw">비밀번호</label>
	</span>
		<input type="password" class="regist_info" name="aInfo" minlength="3" maxlength="12" title="비밀번호" required>

	 
	<span class="regist_title"> 
		<label for="Pw2">비밀번호 재확인</label>
	</span>
		<input type="password" class="regist_info" name="aInfo" minlength="3" maxlength="12" title="비밀번호 재확인 입력" required>

	 
	<span class="regist_title"> 
		<label for="name">이름</label>
	</span>
		<input type="text" class="regist_info" name="aInfo" minlength="2" maxlength="6" title="이름" required>

	 
	<div class="birthday">
		<span class="regist_title"> 
			<label for="birthday">생년월일</label>
		</span>
		<input type="text" class="regist_info_birth" id="birthday" maxlength="4" placeholder="년(4자)">
			<select class="regist_info_birth_select" name="aInfo" id="birthday">
	             <option value="Month">월</option>
	             <option value="January">1</option>
	             <option value="Febuary">2</option>
	             <option value="March">3</option>
	             <option value="April">4</option>
	             <option value="May">5</option>
	             <option value="June">6</option>
	             <option value="July">7</option>
	             <option value="Agust">8</option>
	             <option value="September">9</option>
	             <option value="October">10</option>
	             <option value="November">11</option>
	       		 <option value="December">12</option>
	        </select>
	     <input type="text" class="regist_info_birth" id="birthday" maxlength="2" placeholder="일">
	</div>
	 
	<div class="gender">
		<span class="regist_title">
			<label for="gender">성별</label>
		</span>
		<select class="regist_info_gender" name="aInfo" id="gender">
	             <option value="gender">성별</option>
	             <option value="male">남자</option>
	             <option value="female">여자</option>
	    </select>
	</div>
	
	<span class="regist_title"> 
		<label for="phone">휴대폰 번호</label>
	</span>
		<input type="text" class="regist_info" name="aInfo" minlength="11" maxlength="11" title="휴대폰번호" required>
	 
	<div class="account">
		<span class="regist_title"> 
			<label for="account">계좌번호</label>
		</span>
		<select class="regist_info_account" name="aInfo" id="account">
	             <option value="KB">국민</option>
	             <option value="NH">농협</option>
	             <option value="신한">신한</option>
	             <option value="우리">우리</option>
	             <option value="KEB">하나</option>
	             <option value="Kakao">카카오</option>
	    </select>
	    <input class="regist_info_account_input" type="text" id="account">
	</div>
	
	<input type="button" value="가입하기" class="join">
	</div>
</div>


</body>
<script>
	
</script>
</html>