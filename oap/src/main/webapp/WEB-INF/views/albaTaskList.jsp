<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link href="/resources/css/albaTaskList.css" rel="stylesheet"
	media="screen" />
<script src="http://code.jquery.com/jquery-latest.js"></script>

<title>업무 리스트</title>
</head>

<body onLoad="init()">
	<select id="selectShCode" onChange="selectShCode()">
		<option>매장을 선택해주세요.</option>
	</select>

	<div id="taskBoxDiv"></div>
	<!-- 
		<div id="taskBoxDivHidden" style="display:none">
		
		</div>
		 -->
</body>

<script>
	function init() {
		let albaTaskList = JSON.parse('${albaTaskList}');
		//console.log(albaTaskList);

		let albaShopList = JSON.parse('${albaShopList}');
		//console.log(albaShopList);

		for (i = 0; i < albaShopList.length; i++) {
			let selectShCode = document.getElementById("selectShCode");

			let option = document.createElement('option');
			option.value = albaShopList[i].shCode;
			option.text = albaShopList[i].shName;

			selectShCode.appendChild(option);
		}

	}

	var taskInfo;
	
	function selectShCode() {
		let shCode = document.getElementById("selectShCode").value;
		let abCode = "100000000";
		//console.log(shCode);
		//console.log(abCode);

		let request = new XMLHttpRequest();
		request.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				//alert("전송완료");
				let jsonData = decodeURIComponent(request.response);
				let jsonArr = jsonData.split("_");
				taskInfo = JSON.parse(jsonArr[0]);
				let taskIndex = jsonArr[1];
				//console.log(taskInfo);

				$('#taskBoxDiv').empty();
				selectTask(taskInfo, taskIndex);
			}
		};
		request.open("POST", "AlbaTaskListSelect", true);
		request.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded;charset=UTF-8");
		request.send("action=AlbaTaskListSelect" + "&shCode=" + shCode
				+ "&abCode=" + abCode);
	}

	function selectTask(albaTaskListSelect, taskIndex) {

		//console.log(albaTaskListSelect);
		//console.log('${albaTaskListSelectCount }');
		let taskBoxDiv = document.getElementById('taskBoxDiv');

		let countTask = document.createElement('div');
		countTask.className = "countTask";
		countTask.textContent = "총 " + taskIndex + "개의 업무가 있습니다.";

		taskBoxDiv.appendChild(countTask);

		let taskTitle = document.createElement('div');
		taskTitle.className = "taskTitle";

		let shName = document.createElement('div');
		shName.textContent = albaTaskListSelect[0].shName;
		shName.className = "chooseTime";

		taskTitle.appendChild(shName);

		taskBoxDiv.appendChild(taskTitle);

		for (i = 0; i < albaTaskListSelect.length; i++) {

			let num = i;
			let taskIndex = i;

			let taskBox = document.createElement('div');
			taskBox.className = "taskBox";

			let timeTask = document.createElement('div');
			timeTask.className = "timeTask";
			timeTask.textContent = (i + 1) + ". ";

			taskBox.appendChild(timeTask);

			let chooseTime = document.createElement('div');
			chooseTime.className = "chooseTime";
			chooseTime.textContent = albaTaskListSelect[i].tlComment;
			chooseTime.value = albaTaskListSelect[i].tlNumber;
			chooseTime.id = "chooseTime" + i;

			taskBox.appendChild(chooseTime);

			let taskContent = document.createElement('div');
			taskContent.className = "taskContent";
			taskContent.textContent = albaTaskListSelect[i].mtDetail.replace(
					/\+/g, " ");
			taskContent.id = "taskName" + i;
			taskContent.value = albaTaskListSelect[i].mtDetail;

			taskBox.appendChild(taskContent);

			taskBoxDiv.appendChild(taskBox); // 새로추가한 taskBox를 묶는 큰 div

		}

	}
</script>

</html>