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

	<div class="all">
	
		
		<div class="two">
			<img src="/resources/img/main.png" style="width:80px;height:80px;margin-left:8px;">
			<a id="paName"></a>
			<div style="width:430px;height:10px;background-color:#FEE300;"></div>
		</div>
		
		<div class="three">
			<h3 id="abName"></h3>
		</div>
		
		<div class="four">
			<h4 id="work"></h4>
		</div>
		
		<div class="five">
			<h4 id="aPay"></h4>
		</div>
		
		<div class="six">
			<h4 id="rest"></h4>
		</div>
		
		<div class="seven">
			<h4 id="wtime"></h4>
		</div>
		
		<div class="eight">
			<h4 id="ptotal"></h4>
		</div>
	
	</div>

	<div id="tttt"></div>
</body>

<script>
function pDetail(){
	let pdinfo = JSON.parse('${detailinfo}');
	
	for(i=0;i<pdinfo.length;i++){
	let paName = document.getElementById('paName');
	paName.textContent = pdinfo[i].paName;
	
	
	let abName = document.getElementById('abName');
	abName.textContent = "이름 : " + pdinfo[i].abName;
	
	let work = document.getElementById('work');
	work.textContent = "업종 : " + pdinfo[i].shType;
	
	let aPay = document.getElementById('aPay');
	aPay.textContent = "시급 : " + pdinfo[i].aPay + "원";
	
	let rest = document.getElementById('rest');
	rest.textContent = "휴게시간 : " + pdinfo[i].restTime + "분";
	
	let wtime = document.getElementById('wtime');
	wtime.textContent = "근무시간 : " + pdinfo[i].timeTotal + "분";
	
	let ptotal = document.getElementById('ptotal');
	ptotal.textContent = "지급액 : " + pdinfo[i].payTotal + "원"
	}
	
}
	

</script>

</html>








	