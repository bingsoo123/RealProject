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
	<br/> 
<!-- 	<div class="search" > -->
	<div class="div-absel">
		<select id="absel" class="absel" onChange="goShCode()">
			<option>-- 매장을 선택하세요 --</option>
		</select>
		
		
	</div>
	<br/><br/>

		

		<div class="al" id="al"></div>
	
	<br/>

</body>

<script>
	var menuIndex = 0;

	function goalbaInfo(albaInfo, index) {
		shCode = albaInfo[index].shCode;
		abCode = albaInfo[index].abCode;

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
	function albaInfoList(test1){
		document.getElementById("al").innerHTML = "";
		let al = document.getElementById('al');
		
		let abList = document.createElement('Div');
		abList.className = "ttt";
		al.appendChild(abList);
		let albaInfo = test1
		
		for (i = 0; i < albaInfo.length; i++) {
			
			let index = i;

			let div = document.createElement("Div");
			div.className = "profile-one";
			div.style.cursor = "pointer";
			div.value = albaInfo[i].abCode;
			div.addEventListener('click', function() {
				goalbaInfo(albaInfo, index);
			});
			abList.appendChild(div);

			let div1 = document.createElement("Div");
			div1.className = "profile-left"
			div.appendChild(div1);

			let div2 = document.createElement("Div");
			div2.className = "div2"
			div.appendChild(div2);

			if (albaInfo[i].abGender == "M") {
				let div3 = document.createElement("img");
				div3.className = "profile-pic"
				div3.src = "/resources/img/M.png";
				div1.appendChild(div3);
			} else if (albaInfo[i].abGender == "F") {
				let div3 = document.createElement("img");
				div3.className = "profile-pic"
				div3.src = "/resources/img/F.png";
				div1.appendChild(div3);
			}

			let abName = document.createElement("Div")
			abName.textContent = albaInfo[i].abName;
			abName.className = "alba1";
			div1.appendChild(abName);

			let sTime = document.createElement('p');
			sTime.textContent = "근무시간 : "
					+ albaInfo[i].sTime.substr(
							albaInfo[i].sTime.lastIndexOf(" ") + 1).substr(0, 2)
					+ ":"
					+ albaInfo[i].sTime.substr(
							albaInfo[i].sTime.lastIndexOf(" ") + 1).substr(2, 5)
					+ " ~ "
					+ albaInfo[i].eTime.substr(
							albaInfo[i].eTime.lastIndexOf(" ") + 1).substr(0, 2)
					+ ":"
					+ albaInfo[i].eTime.substr(
							albaInfo[i].eTime.lastIndexOf(" ") + 1).substr(2, 5);
			sTime.className = "alba11";
			div2.appendChild(sTime);

			let aPay = document.createElement('p');
			aPay.textContent = "시급 : " + albaInfo[i].aPay + " 원";
			aPay.className = "alba111";
			div2.appendChild(aPay);

			let aPhone = document.createElement('p');
			aPhone.textContent = "전화번호 : " + albaInfo[i].aPhone.substr(0, 3)
					+ "-" + albaInfo[i].aPhone.substr(3, 4) + "-"
					+ albaInfo[i].aPhone.substr(7, 8);
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
		    	if(json=="noSession"){
		    		 location.href="/LogInForm?lCode=manage";
		        }		
			  let test1 = JSON.parse(json);
			   allData = test1;
			   albaInfoList(test1);
	       }
		}
		 	request.open("POST","info",true);
   		 	request.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
    		request.send("sCode=info&shCode=" + shCode);
	}
	
	function alist() {

		let ab = JSON.parse('${ab}'); // 
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
