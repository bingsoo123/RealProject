<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/payDetail.css" rel="stylesheet" />
</head>
<body onLoad="pDetail()">

	<div id="tttt"></div>
</body>

<script>
function pDetail(){
	let tttt = document.getElementById('tttt');
	let pdinfo = JSON.parse('${detailinfo}');
	
	for(i=0;i<pdinfo.length;i++){
	let pdname = document.createElement('Div');
	pdname.className = "pdname";
	tttt.appendChild(pdname);
	
	let pdbox1 = document.createElement('Div');
	pdbox1.className = "pdbox1";
	pdname.appendChild(pdbox1);
	
	let pdname1 = document.createElement('h1');
	pdname1.textContent = pdinfo[i].paName;
	pdbox1.appendChild(pdname1);
	
	let abName = document.createElement('h4');
	abName.textContent = "이름 : " + pdinfo[i].abName;
	pdbox1.appendChild(abName);
	
	let pdbox2 = document.createElement('Div');
	pdbox2.className = "pdbox2";
	pdname.appendChild(pdbox2);
	
	let shType = document.createElement('p');
	shType.className = "pdbox2-p";
	shType.textContent = "직종 : " + pdinfo[i].shType;
	pdbox2.appendChild(shType);
	
	let aPay = document.createElement('p');
	aPay.className = "pdbox2-p";
	aPay.textContent = "시급 : " + pdinfo[0].aPay + "원" ;
	pdbox2.appendChild(aPay);
	
	let timeTotal = document.createElement('p');
	timeTotal.className = "pdbox2-p";
	timeTotal.textContent = "총 근무시간 : " + pdinfo[i].timeTotal + "시간";
	pdbox2.appendChild(timeTotal);
	
	let restTime = document.createElement('p');
	restTime.className = "pdbox2-p";
	restTime.textContent = "휴게시간 : " + pdinfo[i].restTime + "분";
	pdbox2.appendChild(restTime);
	
	let sanso = document.createElement('p');
	sanso.className = "pdbox2-p";
	sanso.textContent = "계산식 : " + pdinfo[i].restTime;
	pdbox2.appendChild(sanso);
	
	let payTotal = document.createElement('h3');
	payTotal.className = "pdbox2-h3";
	payTotal.textContent = "총금액 : " + pdinfo[i].payTotal + "원";
	pdbox2.appendChild(payTotal);
	}
}
	

</script>

</html>








	