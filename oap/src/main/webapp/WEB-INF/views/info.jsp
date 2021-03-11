<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
<style>
</style>
<link href="/resources/css/info.css" rel="stylesheet" />
</head>
<body onLoad="alist()">
	<!-- 검색 버튼 -->
	<!-- this.style.backgroundImage="url()"; javascript 백그라운드 이미지 클릭시 onClick 작동 구문 활용 -->
	<br/> 
<!-- 	<div class="search" > -->
	<div class="div-absel">
		<select id="absel" class="absel" onChange="goShCode()">
			<option>-- 매장을 선택하세요 --</option>
		</select>
	</div>
<!-- 		<input type="text" id="namesearch" onClick="searchimg()"placeholder="이름 검색" /> -->
<!-- 		<button onClick="searchimg()" >조회하기</button> -->
<!-- 	</div> -->
	<br/><br/>

		

		<div class="al" id="al"></div>
	
	<br/>

</body>

<script>
	function goalbaInfo(abinfo, index) {
		shCode = abinfo[index].shCode;
		abCode = abinfo[index].abCode;

		window.open("", "pop","width=800,height=950,left=600,top=900,toolbar=no,status=no,resizable=no");

		var form = document.createElement("form");
		form.action = "accessDetail?sCode=accessDetail" + "&shCode=" + shCode
				+ "&abCode=" + abCode;
		form.method = "POST";
		form.target = "pop";
		document.body.appendChild(form);

		form.submit();

	}

	
	var allData;
	function abinfoList(test1){
		document.getElementById("al").innerHTML = "";
		let al = document.getElementById('al');
		
		let abList = document.createElement('Div');
		abList.className = "ttt";
		al.appendChild(abList);
		let abinfo = test1
		
		for (i = 0; i < abinfo.length; i++) {
			
			let index = i;

			let div = document.createElement("Div");
			div.className = "profile-one";
			div.style.cursor = "pointer";
			div.value = abinfo[i].abCode;
			div.addEventListener('click', function() {
				goalbaInfo(abinfo, index);
			});
			abList.appendChild(div);

			let div1 = document.createElement("Div");
			div1.className = "profile-left"
			div.appendChild(div1);

			let div2 = document.createElement("Div");
			div2.className = "div2"
			div.appendChild(div2);

			if (abinfo[i].abGender == "M") {
				let div3 = document.createElement("img");
				div3.className = "profile-pic"
				div3.src = "/resources/img/M.png";
				div1.appendChild(div3);
			} else if (abinfo[i].abGender == "F") {
				let div3 = document.createElement("img");
				div3.className = "profile-pic"
				div3.src = "/resources/img/F.png";
				div1.appendChild(div3);
			}

			let abName = document.createElement("Div")
			abName.textContent = abinfo[i].abName;
			abName.className = "alba1";
			div1.appendChild(abName);

			let sTime = document.createElement('p');
			sTime.textContent = "근무시간 : "
					+ abinfo[i].sTime.substr(
							abinfo[i].sTime.lastIndexOf(" ") + 1).substr(0, 2)
					+ ":"
					+ abinfo[i].sTime.substr(
							abinfo[i].sTime.lastIndexOf(" ") + 1).substr(2, 5)
					+ " ~ "
					+ abinfo[i].eTime.substr(
							abinfo[i].eTime.lastIndexOf(" ") + 1).substr(0, 2)
					+ ":"
					+ abinfo[i].eTime.substr(
							abinfo[i].eTime.lastIndexOf(" ") + 1).substr(2, 5);
			sTime.className = "alba11";
			div2.appendChild(sTime);

			let aPay = document.createElement('p');
			aPay.textContent = "시급 : " + abinfo[i].aPay + " 원";
			aPay.className = "alba111";
			div2.appendChild(aPay);

			let aPhone = document.createElement('p');
			aPhone.textContent = "전화번호 : " + abinfo[i].aPhone.substr(0, 3)
					+ "-" + abinfo[i].aPhone.substr(3, 4) + "-"
					+ abinfo[i].aPhone.substr(7, 8);
			aPhone.className = "alba1111";
			div2.appendChild(aPhone);

		}
	}
	
	function goShCode(){
		shCode = absel.value;
		let request = new XMLHttpRequest();
	    request.onreadystatechange = function() {
	       if (this.readyState == 4 && this.status == 200) {
	    	   let json = decodeURIComponent(request.response);
			  let test1 = JSON.parse(json);
			   allData = test1;
			   abinfoList(test1);
	       }
		}
		 	request.open("POST","info",true);
   		 	request.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
    		request.send("sCode=info&shCode=" + shCode);
	}
	
	function alist() {

		let ab = JSON.parse('${ab}');
		let absel = document.getElementById('absel');
		for (i = 0; i < ab.length; i++) {
			let op = document.createElement('option');

			op.value = ab[i].shCode;
			op.text = ab[i].shName;

			absel.appendChild(op);
		}
		
	} 
</script>
</html>
