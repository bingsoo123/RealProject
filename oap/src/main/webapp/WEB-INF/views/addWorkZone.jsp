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
<!--   <form name="file" action="UPLOAD" method="post" encType="multipart/form-data"> -->
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
				<input type="text" name="shImg" readonly>
			</div>
		</div>
		<input type="button" value="확인" onClick="checkshop()">
	</div>
<!--   </form> -->
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
		
		let shName = document.getElementsByName("shName")[0];
		let shAddr = document.getElementsByName("shAddr")[0];
		let shBusinessLi = document.getElementsByName("shBusinessLi")[0];
		let shTel = document.getElementsByName("shTel")[0];
		let shType = document.getElementsByName("shType")[0];
		let shImg = document.getElementsByName("shImg")[0];
		
		var form = document.createElement("form");
		form.method="POST";
		form.action="AddWorkZoneComplete";
		
		let mCode= document.createElement("input");
		mCode.type="hidden";
		mCode.name="mnCode";
		mCode.value="${mnCode}";
		
		form.appendChild(mCode);
		form.appendChild(shName);
		form.appendChild(shAddr);
		form.appendChild(shBusinessLi);
		form.appendChild(shTel);
		form.appendChild(shType);
		form.appendChild(shImg);
		
		
		document.body.appendChild(form);
		
		form.submit();

//		document.file.submit(); 파일업로드 관련
	}

	function imgadd(){
		var fname = document.getElementsByName('shImage')[0];
		var tt = document.getElementById('addimg2').value;
		var ab = tt.split("\\");
		fname.value += ab[2];
	}


</script>
</html>