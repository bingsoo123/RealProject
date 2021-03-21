<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link href="/resources/css/albaTaskList.css" rel="stylesheet" media="screen"/>
<script src="http://code.jquery.com/jquery-latest.js"></script>

<title>업무 리스트</title>
</head>

<body onLoad="init()">
	
	<div id="taskBoxDiv">
		
	</div>
	
</body>
	
	<script>
		function init(){
			let albaTaskList = JSON.parse('${albaTaskList}');
			//console.log(albaTaskList);
			
			let albaShopList= JSON.parse('${albaShopList}');
			//console.log(albaShopList);

			
			// 페이지 onLoad 했을 때 전체리스트 지우기
			// body의 잡힌 div
			let taskBoxDiv = document.getElementById('taskBoxDiv');
			taskBoxDiv.className = "taskBoxDiv";
			
				let countTask = document.createElement('div');
				countTask.className = "countTask";
				countTask.textContent = "총 " + ${albaTaskListCount } + "개의 업무가 있습니다.";
				
				taskBoxDiv.appendChild(countTask);
				
				let taskTitle = document.createElement('div');
				taskTitle.className = "taskTitle";
				
// 				let shName = document.createElement('div');
// 				shName.textContent = albaTaskList[0].shName;
// 				shName.className = "chooseTime";
				
// 				taskTitle.appendChild(shName);
				
				taskBoxDiv.appendChild(taskTitle);
				
				taskTypeAll = document.createElement('div');
				taskTypeAll.className = "taskTypeAll";
				
				for (i = 0; i < albaTaskList.length; i++) {
						
						// 매장 이름 출력하는 div
						taskTitle = document.createElement('div');
						taskTitle.className = "taskTitle";
					
					// 매장의 업무리스트를 출력하는 div
					taskType = document.createElement('div');
					taskType.className = "taskType";
					
					let taskBox = document.createElement('div');
					taskBox.className = "taskBox";
					

						let timeTask = document.createElement('div');
						timeTask.className = "timeTask";
						timeTask.textContent = (i+1) +  ". ";
	
						taskBox.appendChild(timeTask);
	
						let chooseTime = document.createElement('div');
						chooseTime.className = "chooseTime";
						chooseTime.textContent = albaTaskList[i].tlComment;
						chooseTime.value = albaTaskList[i].tlNumber;
						chooseTime.id = "chooseTime" + i;
	
						taskBox.appendChild(chooseTime);

						let taskContent = document.createElement('div');
						taskContent.className = "taskContent";
						taskContent.textContent = albaTaskList[i].mtDetail;
						taskContent.id = "taskName" + i;
						taskContent.value = albaTaskList[i].mtDetail;
						
						taskBox.appendChild(taskContent);
					
					taskType.appendChild(taskBox);
					
				taskTypeAll.appendChild(taskType);

			taskBoxDiv.appendChild(taskTypeAll); // 새로추가한 taskBox를 묶는 큰 div
			
			
				}
				
			
		}
		
		var taskInfo;
		function selectShCode(){
			let shCode = $("#shop_select_box option:selected").val()
			let abCode = "100000000";
			//console.log(shCode);
			//console.log(abCode);

			let request = new XMLHttpRequest();
			request.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) {
					//alert("전송완료");
					let jsonData = decodeURIComponent(request.response);
			    	if(jsonData=="noSession"){
			    		 location.href="/LogInForm?lCode=alba";
			        }		
					let jsonArr = jsonData.split("_");
					taskInfo = JSON.parse(jsonArr[0]);
					let taskIndex = jsonArr[1];
					//console.log(taskInfo);
					
					$('#taskBoxDiv').empty();
					selectTask(taskInfo, taskIndex);
				}
			};
			request.open("POST", "AlbaTaskListSelect", true);
			request.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
			request.send("sCode=AlbaTaskListSelect" + "&shCode=" + shCode + "&abCode=" + abCode);
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
			
// 			let shName = document.createElement('div');
// 			shName.textContent = albaTaskListSelect[0].shName.replace(/\+/g, " ");
// 			shName.className = "chooseTime";
			
// 			taskTitle.appendChild(shName);
			
			taskBoxDiv.appendChild(taskTitle);
			
			
			for (i = 0; i < albaTaskListSelect.length; i++) {
				
				let num = i;
				let taskIndex = i;
				
				let taskBox = document.createElement('div');
				taskBox.className = "taskBox";

					let timeTask = document.createElement('div');
					timeTask.className = "timeTask";
					timeTask.textContent = (i + 1) +  ". ";

					taskBox.appendChild(timeTask);

					let chooseTime = document.createElement('div');
					chooseTime.className = "chooseTime";
					chooseTime.textContent = albaTaskListSelect[i].tlComment;
					chooseTime.value = albaTaskListSelect[i].tlNumber;
					chooseTime.id = "chooseTime" + i;

					taskBox.appendChild(chooseTime);

					let taskContent = document.createElement('div');
					taskContent.className = "taskContent";
					taskContent.textContent = albaTaskListSelect[i].mtDetail.replace(/\+/g, " ");
					taskContent.id = "taskName" + i;
					taskContent.value = albaTaskListSelect[i].mtDetail;
					
					taskBox.appendChild(taskContent);
					
				

				taskBoxDiv.appendChild(taskBox); // 새로추가한 taskBox를 묶는 큰 div

			}
			
		}
	</script>

</html>