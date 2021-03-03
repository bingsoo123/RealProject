<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Home</title>
<link href="/resources/css/manage.css" rel="stylesheet" />

</head>
<body>

	<div>

		<div class="test1">

			<ul class="nav-container">

				<li><a href="#"><img src="/resources/img/logo_1.png"
						width="100px" height="100px"></a></li>
				<li class="nav-item"><a href="/Manage">관리</a></li>
				<li class="nav-item"><a href="/Regist">등록</a></li>

			</ul>

		</div>


		<div class="two">

			<div class="test2">
				<div class="list" onclick= "www();">매장 관리</div>	
				<div class="list">알바생 관리</div>
				<div class="list">출퇴근 관리</div>
				<div class="list">급여 관리</div>
				<div class="list">일정 관리</div>
				<div class="list">근무 일지</div>

			</div>

			<div class="test3">

			</div>

		</div>
	</div>
</body>
<!-- ajax를 오류로 인해 jquery문 스크립트 사용 -->
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<script type = "text/javascript">
function www(){
	$.ajax({
	type:"GET",
	url:"http://localhost/MyWorkZone",
	dataType:"html",
	success:function(data){
		$(".test3").html(data);
		init();
	}
	});
	}
	
function init() {
	
	   let section = document.getElementById("workZone");
		//db값 안에  \n 이 있어서 \\n으로 치환해야지 파싱이된다.
	   let workInfo = document.getElementById("workInfo");
		let log = '${WL}';
		let workrep = log.replace(/\n/g,'\\n');
		let work = JSON.parse(workrep);

		
		for(i = 0; i<work.length; i++){
			//매장정보칸
			let div = document.createElement('Div');
			div.className = "workzone";
			div.style.margin ="40px 20px";
			section.appendChild(div)
			//매장명
			let shName = document.createElement('h2');
			shName.textContent = work[i].shName;
			shName.className="workInfo";
			//업종 출력
			let shtype = document.createElement('h4');
			shtype.textContent = "업종 : " +work[i].shType;
			shtype.className="kname";
			
// 			총근무자수
			let workman = document.createElement('h4');
			workman.textContent = "직원수 : " +work[i].workman +"명";
			workman.style.margin ="10px 0px";
			workman.className="kmember";
// 			이미지 추가시 사용할 구문
//			let workimg = document.createElement('Div');
//			workimg.style.backgroundImage = "url(/resources/image/" +work[i].workimg + ")";
//			workimg.style.backgroundSize = "contain";
//			workimg.className="workimg";
			
//			div.appendChild(workimg);
			div.appendChild(workman);
			div.appendChild(shtype);
			div.appendChild(shName);
			
		}
}
	function addstore(){
		let form = document.createElement("form");
		form.setAttribute("method","get");
		form.setAttribute("action",'addWorkZone');
		form.setAttribute("target","매장등록");
		
		document.body.appendChild(form);
			
			
			  window.open('addWorkZone.jsp','매장등록','top=10,left=10,width=800,height=600,status=no,menubar=no,toolbar=no,resizable=no');
			
			 
			 form.submit();
			
		}
	

	
	
	function search_store(){

	let form = document.createElement("form");
	form.setAttribute("method","get");
	form.setAttribute("action",'searchMap');
	form.setAttribute("target","newMap");
	

	document.body.appendChild(form);
		

		window.open('searchMap.jsp','newMap','top=10,left=10,width=600,height=600,status=no,menubar=no,toolbar=no,resizable=no');
		

	


		 
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
		
	}

function imgadd(){
	var fname = document.getElementById('imgresult');
	var tt = document.getElementById('addimg2').value;
	var ab = tt.split("\\");
	fname.value += ab[2];
}


</script>

</html>



