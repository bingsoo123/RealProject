<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE HTML>
<html>
<head>
<title>myWorkZone</title>
<link href="/resources/css/myWorkZone.css" rel="stylesheet" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">


</head>
<body onload="init()">
	<div class="buttons">
		<i class="fas fa-store"></i>
		<div class="addwork_btn">
			<i class="fas fa-store"></i><i class="fas fa-ad"></i><input
				type="button" class="addstore" value="매장추가" onClick="addstore()">
		</div>
		<div class="deletework_btn">
			<i class="fas fa-store"></i><input type="button" value="매장삭제"
				onClick="deletestore()">
		</div>
	</div>
	<section id="workZone" class="workZone">

		<div id="workInfo"></div>
	</section>
	<br />
	<br />
</body>
<script>
	function applyStateUpdate(shCode, applyState) {
		let request = new XMLHttpRequest();
		request.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				let updateState = decodeURIComponent(request.response);
				if (updateState == "noSession") {
					location.href = "/LogInForm?lCode=manage";
				}
				if (updateState == "applyStateUpdate") {
					alert("구인 상태를 정상적으로 변경하였습니다.");
					$('#workZone').empty();
				} else {
					alert("서버가 불안정 합니다.");
				}
			}
		};
		request.open("POST", "updateApplyCode", true);
		request.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded;charset=UTF-8");
		request.send("sCode=updateApplyCode&" + "shCode=" + shCode
				+ "&applyState=" + applyState);

	}

	function init() {
		let section = document.getElementById("workZone");
		let workInfo = document.getElementById("workInfo");
		let log = '${WL}';
		let workrep = log.replace(/\n/g, '\\n');
		let work = JSON.parse(workrep);

		for (i = 0; i < work.length; i++) {
			let index = i;
			let div = document.createElement('Div');
			div.className = "workzone";
			div.style.margin = "40px 0px";
			section.appendChild(div);
			let shName = document.createElement('h3');
			shName.textContent = work[i].shName + "[" + work[i].stComment + "]";
			shName.className = "workInfo";

			let shtype = document.createElement('div');
			shtype.textContent = work[i].shType;
			shtype.className = "kname";
			let workman = document.createElement('h4');
			workman.textContent = "직원수 : " + work[i].workman + "명";
			workman.style.margin = "10px 0px";
			workman.className = "kmember";
			let workimg = document.createElement('Div');
			workimg.style.backgroundImage = "url(/resources/workZoneImg/" +work[i].shImg + ")";
			workimg.style.backgroundSize = "contain";
			workimg.className = "workimg";

			// applyState 변경하는 버튼
			let stComment = document.createElement('button');
			stComment.textContent = work[i].stComment;
			stComment.className = "apply_btn";
			stComment.addEventListener('click', function() {
				applyStateUpdate(work[index].shCode, work[index].applyState);
			});
			div.appendChild(stComment);

			div.appendChild(workimg);
			div.appendChild(workman);
			div.appendChild(shtype);
			div.appendChild(shName);

		}
	}
	function addstore() {
		
		window.open('','pop','top=10,left=10,width=800,height=600,status=no,menubar=no,toolbar=no,resizable=no');
		
		let form = document.createElement("form");
		form.setAttribute("method", "POST");
		form.setAttribute("action", 'AddWorkZone?mnCode=' + mnCode);
		form.setAttribute("target", "pop");
		
		document.body.appendChild(form);

		form.submit();
	}
</script>
</html>