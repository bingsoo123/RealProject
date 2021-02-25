<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0 ,minimum-scale=1.0">
<title>Insert title here</title>
<link href="/resources/css/agree.css" rel="stylesheet" />
</head>
<body>
<div class="wrap">
<img  src="/resources/img/regist_step2.png">
<div class="userbox">
<div class="userpromise"><div class="promisebox">이용약관</div> 
<div class="userpromise2"><textarea cols="80" rows="6" readonly>
제1조(목적)
이 약관은 알바어때가 운영하는 웹사이트에서 제공하는 인터넷 관련 서비스(이하 "서비스"라 한다)를
이용함에 있어서 이용자의 권리,의무 및 책임사항을 규정함을 목적으로 합니다,

제2조(정의)
①"이용자"란 알바어때의 접속하여 이 약관에 따라 "알바어때"가 제공하는 서비스를 받는
"알바생"과 "사장님" 말합니다.
②집은 집입니다.
③라떼는 말이야...

제3조(약관 동의 명시와 설명 개정)
.
. 저녁 메뉴는? 
.
제4조(서비스의 제공 및 변경)
.
.점심 나가서 먹을거 같아
.</textarea></div>
<div class="agree">회원가입 약관의 내용에 동의합니다<input type="checkbox" name="chk"></div>
</div>
<div class="userprivate"><div class="promisebox2">개인정보보호처리방침안내</div>
<div class="userprivate2"><textarea cols="80" rows="6" readonly>
제1조(목적)
이 약관은 알바어때가 운영하는 웹사이트에서 제공하는 인터넷 관련 서비스(이하 "서비스"라 한다)를
이용함에 있어서 이용자의 권리,의무 및 책임사항을 규정함을 목적으로 합니다,

제2조(정의)
①"이용자"란 알바어때의 접속하여 이 약관에 따라 "알바어때"가 제공하는 서비스를 받는
"알바생"과 "사장님" 말합니다.
②집은 집입니다.
③라떼는 말이야...

제3조(약관 동의 명시와 설명 개정)
.
. 저녁 메뉴는? 
.
제4조(서비스의 제공 및 변경)
.
.점심 나가서 먹을거 같아
.
</textarea></div>
<div class="agree">개인정보처리방침안내의 내용에 동의합니다<input type="checkbox" name="chk"></div>
</div>
</div>
<div class="allcheck">모든 약관을 확인하고 동의합니다.<input type="checkbox" id= "chk_all"onClick="chk_all()"></div>
</div>

<div class="gobox">
<input class="gonext"type="button"  onClick="checkform()" value="다음">
<input class="gomain" type="button" value="메인으로 이동">
</div>


</body>
<script>
function chk_all(){
	var chk=document.getElementsByName("chk");
	var len= chk.length;
	   if(document.getElementById("chk_all").checked==true){ 
	         for(var i=0;i<len;i++) document.getElementsByName("chk")[i].checked=true;  
	      }
	      if(document.getElementById("chk_all").checked==false){
	         for(var i=0;i<len;i++) document.getElementsByName("chk")[i].checked=false;  
	      }
	}
	
function checkform(){
 var chk= document.getElementsByName("chk");

 for(var i =0;i<chk.length; i++){
	 if(chk[i].checked==false){
		 alert("모든 약관에 동의하여 주시기 바랍니다.");
		 return false;
	 }
 }
 alert("회원가입페이지로 이동합니다.");
 return true;
	 }
	 
 
 


 
</script>
</html>