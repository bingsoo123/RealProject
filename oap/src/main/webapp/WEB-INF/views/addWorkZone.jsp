<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/addWorkZone.css" rel="stylesheet">
</head>
<body>
<div class="shopbox">
<div class= "shopName">매장명 <input type="text" maxlength="15" placeholder="매장명을 입력하여주세요" id="shopName2" required></div>
<div class= "shopaddr"><input type="button" value="매장찾기" onClick="search_store()"  class="searchStore2"><input type="text" maxlength="30" class= "shopResult" id="shopResult" value ="${ Road}${detail}" /> </div>
<div class= "shopNumber">사업자번호<input type="text" maxlength="12" required class="shopNumber2" id="shopNumber2"> </div>
<div class = "shopPhone">매장 전화번호 <input type="text" class="shopPhone2" id="shopPhone2"></div>
<div class = "kindshop" >업종<select id="shopkind" >

<option></option>
<option>매장관리</option>
<option>서빙주방</option>
<option>서비스．미디어</option>
<option>생산．기능．운전．배달</option>
<option>사무회계</option>
<option>IT디자인</option>
<option>고객상담．영업．리서치</option>
<option>강사교육</option>
</select> 
<div class = "addimg" > <label for ="addimg2">사진추가</label><input type ="file" id="addimg2" onChange="imgadd()"></div>
<div class = "resultfile" ><input type="text" id="imgresult" readonly></div>


</div>
<input type="button" value="확인" onClick="checkshop()">

</body>
<script>

	
	
	function search_store(){

	let form = document.createElement("form");
	form.setAttribute("method","get");
	form.setAttribute("action",'searchMap');
	form.setAttribute("target","shopResult");
	

	document.body.appendChild(form);
		

		window.open('searchMap.jsp','shopResult','top=10,left=10,width=600,height=600,status=no,menubar=no,toolbar=no,resizable=no');
		

	


		 
		 form.submit();
			
	}
	

	function checkshop(){
		let name = document.getElementById("shopName2").value;
		let addrs = document.getElementById("shopResult").value;
		let number = document.getElementById("shopNumber2").value;
		let phone = document.getElementById("shopPhone2").value;
		let kind = document.getElementById("shopkind").value;
		let img = document.getElementById("imgresult").value;
		let form =document.createElement("form");
		form.method="post";
		document.body.appendChild(form);
		form.submit();
		
		alert(name);
		alert(addrs);
		alert(number);
		alert(phone);
		alert(kind);
		alert(img);
		window.close();
	}

function imgadd(){
	var fname = document.getElementById('imgresult');
	var tt = document.getElementById('addimg2').value;
	var ab = tt.split("\\");
	fname.value += ab[2];
}


</script>
</html>