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
  <form name="file" action="UPLOAD" method="post" encType="multipart/form-data">
	<div class="shopbox">
		<div class="shopName">
			매장명 <input type="text" maxlength="15" placeholder="매장명을 입력하여주세요"
				name="shName" required>
		</div>
		<div class="shopaddr">
			<input type="button" value="매장찾기" onClick="search_store()"
				class="searchStore2"><input type="text" id="shopResult" maxlength="30"
				class="shopResult" name="shAddr" value="${ Road}${detail}" />
		</div>
		<div class="shopNumber">
			사업자번호<input type="text" maxlength="12" required class="shopNumber2"
				name="shBusinessLi">
		</div>
		<div class="shopPhone">
			매장 전화번호 <input type="text" class="shopPhone2" name="shTel">
		</div>
		<div class="kindshop">
			업종<select name="shType">

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
			<div class="addimg">
				<label for="addimg2">사진추가</label><input type="file" name="photo" id="addimg2"
					onChange="imgadd()" >
			</div>
			<div class="resultfile">
				<input type="text" name="shImage" readonly>
			</div>
		</div>
		<input type="button" value="확인" onClick="checkshop()">
	</div>
  </form>
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
//		let name = document.getElementsByName("shName").value;
//		let addrs = document.getElementsByName("shAddr").value;
//		let number = document.getElementsByName("shBusinessLi").value;
//		let phone = document.getElementsByName("shTel").value;
//		let kind = document.getElementsByName("shType").value;
//		let img = document.getElementsByName("imgresult").value;
//		let form =document.getElementsByName("form");
//		form.method="post";
//		document.body.appendChild(form);
//		form.submit();

		document.file.submit();
		
//		window.close();
	}

function imgadd(){
	var fname = document.getElementsByName('shImage')[0];
	var tt = document.getElementById('addimg2').value;
	var ab = tt.split("\\");
	fname.value += ab[2];
}


</script>
</html>