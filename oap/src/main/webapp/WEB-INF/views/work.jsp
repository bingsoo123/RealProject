<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Home</title>
	<link href="/resources/css/work.css" rel="stylesheet" media="screen"/>
	<link href="/resources/css/manage.css" rel="stylesheet" />
	<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body onLoad="init()">

	<div id="taskList">
	
	</div>
				
</body>

<script>
//work tlComment와 mtDetail 정보 가져오기
let task = JSON.parse('${allTaskList}');
		// taskBoxDiv 업무리스트를 묶는 큰틀
		function init(){	
			
			
			
				// title과 task를 div를 한 번 더 묶는 div -> test3에 꽂음
				let taskList = document.getElementById("taskList");
					
					// title 하나로 묶는 div
					let title = document.createElement('div');
					title.className = "title";
					
					taskList.appendChild(title);
			
						
						let countTask = document.createElement('div');
						countTask.className = "countTask";
						countTask.textContent = "총  ${countTask } 개의 업무가 있습니다.";
						countTask.id = "countTask";
						
							let addTask = document.createElement('input');
							addTask.type = "button";
							addTask.style.cursor = "pointer";
							addTask.addEventListener('click', function(){
								 window.open("/WorkAdd", "업무 추가", "width=550, height=450, left=450, top=100, menubar=no, status=no, toolbar=no")
							});
							addTask.value = "업무 추가";
							addTask.className = "addTask";
							addTask.style.backgroundImage = "url('/resources/img/plus.png')";
							addTask.style.backgroundPosition = "92px 1px";
							addTask.style.backgroundSize = "30px 30px";
							addTask.style.backgroundRepeat = "no-repeat";
							
							
						countTask.appendChild(addTask);
						
					title.appendChild(countTask);
						
						let selectTime = document.createElement('div');
						selectTime.className = "selectTime";
						
							let timeClickAll = document.createElement('div');
							timeClickAll.className = "timeClick";
							timeClickAll.textContent = "전체";
							timeClickAll.addEventListener('click', function(){
								$('.taskBoxDiv').empty();
								initAll();
							});
							
							selectTime.appendChild(timeClickAll);
							
							let timeClick1 = document.createElement('div');
							timeClick1.className = "timeClick";
							timeClick1.textContent = "매장청소";
//		 					timeClick1.setAttribute("value","1");
							timeClick1.id = "timeClick1";
							timeClick1.addEventListener('click', function(){
								$('.taskBoxDiv').empty();
								 taskListAll("1");
							});
							
							selectTime.appendChild(timeClick1);
							
							let timeClick2 = document.createElement('div');
							timeClick2.className = "timeClick";
							timeClick2.textContent = "재고관리";
//		 					timeClick2.setAttribute("value","2");
							timeClick2.id = "timeClick2";
							timeClick2.addEventListener('click', function(){
								$('.taskBoxDiv').empty();
								 taskListAll("2");
							});
							
							selectTime.appendChild(timeClick2);
							
							let timeClick3 = document.createElement('div');
							timeClick3.className = "timeClick";
							timeClick3.textContent = "캐셔";
//		 					timeClick3.setAttribute("value","3");
							timeClick3.id = "timeClick3";
							timeClick3.addEventListener('click', function(){
								$('.taskBoxDiv').empty();
								 taskListAll("3");
							});
							
							selectTime.appendChild(timeClick3);
							
							let timeClick4 = document.createElement('div');
							timeClick4.className = "timeClick";
							timeClick4.textContent = "안내데스크";
//		 					timeClick4.setAttribute("value","4");
							timeClick4.id = "timeClick4";
							timeClick4.addEventListener('click', function(){
								$('.taskBoxDiv').empty();
								 taskListAll("4");
							});
							
							selectTime.appendChild(timeClick4);
							
							let timeClick5 = document.createElement('div');
							timeClick5.className = "timeClick";
							timeClick5.textContent = "주방";
//		 					timeClick5.setAttribute("value","5");
							timeClick5.id = "timeClick5";
							
							timeClick5.addEventListener('click', function(){
								$('.taskBoxDiv').empty();
								 taskListAll("5");
							});
							
							selectTime.appendChild(timeClick5);
						
						title.appendChild(selectTime);
				
				
			let taskBoxDiv = document.createElement('div');
			taskBoxDiv.className = "taskBoxDiv";
			
				
				for (i = 0; i < task.length; i++) {
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
							chooseTime.textContent = task[i].tlComment;
							chooseTime.value = task[i].tlNumber;
							chooseTime.id = "chooseTime" + i;
		
							taskBox.appendChild(chooseTime);
	
							let taskContent = document.createElement('div');
							taskContent.className = "taskContent";
							taskContent.textContent = task[i].mtDetail;
							taskContent.id = "taskName" + i;
							taskContent.value = task[i].mtDetail;
							
							taskBox.appendChild(taskContent);
							
							
							let together = document.createElement('div');
							together.className = "together";
		
							let setting = document.createElement('div');
							setting.className = "setting";
		
								let button = document.createElement('button');
								button.className = "settingButton";
			
								let settingImg = document.createElement('img');
								settingImg.src = "/resources/img/bolt.jpg";
								settingImg.style = "width:30px";
								settingImg.style = "height:30px";
			
								button.appendChild(settingImg);
			
								setting.appendChild(button);
		
									let settingContent = document.createElement('div');
									settingContent.className = "settingContent";
									
									let editInfo = document.createElement('a');
									editInfo.style.cursor = "pointer";
									editInfo.textContent = "수정하기";
									editInfo.addEventListener('click', function(){
										
										eTest(num);

									});

									settingContent.appendChild(editInfo);
						
									let deleteInfo = document.createElement('a');
									deleteInfo.style.cursor = "pointer";
									deleteInfo.textContent = "삭제하기";
									deleteInfo.addEventListener('click', function() {
										
										goDelete(taskIndex);
										
									});

									settingContent.appendChild(deleteInfo);

								setting.appendChild(settingContent);

							together.appendChild(setting);

						taskBox.appendChild(together);

					taskBoxDiv.appendChild(taskBox); // 새로추가한 taskBox를 묶는 큰 div

				taskList.appendChild(taskBoxDiv);

		}
	}
	
	// 전체 업무 리스트 수정하기 띄우기
	function eTest(num){
		//alert(num);
		
		var form = document.createElement("form");
		form.action = "/Change";
		form.method = "post";
		form.target = "pop";
		
		// 보낼 값 input 박스에 숨김 -> 업무 내용
		var box1 = document.createElement("input");
		box1.type = "hidden";
		box1.name = "mtDetail";
		box1.value = task[num].mtDetail;
		box1.id = "mtDetail";
		
		// 보낼 값 input 박스에 숨김 -> 업무 번호 넘기기
		var box2 = document.createElement("input");
		box2.type = "hidden";
		box2.name = "tlNumber";
		box2.value = task[num].tlNumber;
		box2.id = "tlNumber";
		
		form.appendChild(box1);
		form.appendChild(box2);

		document.body.appendChild(form);
		
		window.open("", "pop","width=550, height=450, menubar=no, left=450, top=100, status=no, toolbar=no");
		form.submit();
		
	}
	
	// 근무타입별 수정하기 띄우기
	function taskTypeSelect(num){
		//console.log(taskInfo[0].mtDetail);
		var form = document.createElement("form");
		form.action = "/Change";
		form.method = "post";
		form.target = "pop";
		
		// 보낼 값 input 박스에 숨김
		var box1 = document.createElement("input");
		box1.type = "hidden";
		box1.name = "mtDetail";
		box1.value = taskInfo[num].mtDetail;
		box1.id = "mtDetail";
		
		// 보낼 값 input 박스에 숨김 -> 업무 번호 넘기기
		var box2 = document.createElement("input");
		box2.type = "hidden";
		box2.name = "tlNumber";
		box2.value = task[num].tlNumber;
		box2.id = "tlNumber";

		form.appendChild(box1);
		form.appendChild(box2);

		document.body.appendChild(form);
		
		window.open("", "pop","width=550, height=450, left=450, top=100, menubar=no, status=no, toolbar=no");
		form.submit();
		
	}
	
	// 근무타입별 select client 정보 값 보내기
	var taskInfo;
	function taskListAll(tlNumber) {
		let request = new XMLHttpRequest();
		request.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				let jsonData = decodeURIComponent(request.response);
				taskInfo = JSON.parse(jsonData);
				console.log(taskInfo);
				taskType(taskInfo);

			}
		};
		request.open("POST", "WorkType", true);
		request.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
		request.send("sCode=WorkType" + "&tlNumber=" + tlNumber + "&shCode=${shCode}");
		
	}
	
	// 근무타입별 검색하기
	function taskType(tlCommentData) {
		
		for (i = 0; i < tlCommentData.length; i++) {
		let num = i;
		let taskIndex = i;
		
		
		let countTask2 = document.getElementById('countTask');
		countTask2.className = "countTask";
		countTask2.textContent = "총 " + tlCommentData.length + " 개의 업무가 있습니다.";
		
		
			let addTask = document.createElement('input');
			addTask.type = "button";
			addTask.style.cursor = "pointer";
			addTask.addEventListener('click', function(){
				 window.open("/WorkAdd", "업무 추가", "width=550, height=450, left=450, top=100, menubar=no, status=no, toolbar=no")
			});
			addTask.value = "업무 추가";
			addTask.className = "addTask";
			addTask.style.backgroundImage = "url('/resources/img/plus.png')";
			addTask.style.backgroundPosition = "92px 1px";
			addTask.style.backgroundSize = "30px 30px";
			addTask.style.backgroundRepeat = "no-repeat";
			
			
		countTask.appendChild(addTask);
		
		

			let taskBoxDiv = document.createElement('div');
			taskBoxDiv.className = "taskBoxDiv";

			let taskBox = document.createElement('div');
			taskBox.className = "taskBox";

			let timeTask = document.createElement('div');
			timeTask.className = "timeTask";
			timeTask.textContent = (i + 1) + ". ";

			taskBox.appendChild(timeTask);

			let chooseTime = document.createElement('div');
			chooseTime.className = "chooseTime";
			chooseTime.textContent = tlCommentData[i].tlComment;
			chooseTime.value = task[i].tlNumber;
			chooseTime.id = "chooseTime" + i;

			taskBox.appendChild(chooseTime);

			let taskContent = document.createElement('div');
			taskContent.className = "taskContent";
			taskContent.textContent = tlCommentData[i].mtDetail.replace(/\+/g, " ");// 추가했음 replace
			taskContent.id = "taskName" + i;
			taskContent.value = task[i].mtDetail;

			taskBox.appendChild(taskContent);

			let together = document.createElement('div');
			together.className = "together";

			let setting = document.createElement('div');
			setting.className = "setting";

			let button = document.createElement('button');
			button.className = "settingButton";

			let settingImg = document.createElement('img');
			settingImg.src = "/resources/img/bolt.jpg";
			settingImg.style = "width:30px";
			settingImg.style = "height:30px";

			button.appendChild(settingImg);

			setting.appendChild(button);

			let settingContent = document.createElement('div');
			settingContent.className = "settingContent";

				let editInfo = document.createElement('a');
				editInfo.style.cursor = "pointer";
				editInfo.textContent = "수정하기";
				editInfo.addEventListener('click', function(){
					
					taskTypeSelect(num);
	
				});
	
				settingContent.appendChild(editInfo);
	
				let deleteInfo = document.createElement('a');
				deleteInfo.style.cursor = "pointer";
				deleteInfo.textContent = "삭제하기";
				deleteInfo.addEventListener('click', function() {
					
					goTypeDelete(taskIndex);
					
				});
	
				settingContent.appendChild(deleteInfo);

			setting.appendChild(settingContent);

			together.appendChild(setting);

			taskBox.appendChild(together);

			taskBoxDiv.appendChild(taskBox); // 새로추가한 taskBox를 묶는 큰 div

			taskList.appendChild(taskBoxDiv);
		}
	}

	// 삭제하기 기능
	function goDelete(index) {
		let shCode = "100000000";
		let tlNumber = document.getElementById("chooseTime" + index).value;
		let mtDetail = document.getElementById("taskName" + index).value;
		//let testIndex = 0;

		let request = new XMLHttpRequest();
		request.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				let deleteState = decodeURIComponent(request.response);

				console.log(deleteState);
				console.log(mtDetail);
				console.log(tlNumber);
				if (deleteState == 1) {
					alert("업무 삭제가 완료 되었습니다.");
					location.reload();
				} else if (deleteState == 0) {
					alert("업무 삭제를 실패 하였습니다.");
				}

			}
		};
		request.open("POST", "Drop", true);
		request.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
		request.send("sCode=Drop" + "&shCode=" + shCode + "&tlNumber="	+ tlNumber + "&mtDetail=" + mtDetail);
	}
	
	// 근무 타입별 삭제하기
	function goTypeDelete(index) {
		let shCode = "100000000";
		let tlNumber = document.getElementById("chooseTime" + index).value;
		let mtDetail = document.getElementById("taskName" + index).value;
		//let testIndex = 0;

		let request = new XMLHttpRequest();
		request.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				let deleteState = decodeURIComponent(request.response);

				console.log(deleteState);
				console.log(mtDetail);
				console.log(tlNumber);
				if (deleteState == 1) {
					alert("업무 삭제가 완료 되었습니다.");
					location.reload();
				} else if (deleteState == 0) {
					alert("업무 삭제를 실패 하였습니다.");
				}

			}
		};
		request.open("POST", "Drop", true);
		request.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
		request.send("sCode=Drop" + "&shCode=" + shCode + "&tlNumber="	+ tlNumber + "&mtDetail=" + mtDetail);
	}
	
	function initAll() 
	{
		
		let countTask2 = document.getElementById('countTask');
		countTask2.className = "countTask";
		countTask2.textContent = "총 " + task.length + " 개의 업무가 있습니다.";
		
		let addTask = document.createElement('input');
		addTask.type = "button";
		addTask.style.cursor = "pointer";
		addTask.addEventListener('click', function(){
			 window.open("/WorkAdd", "업무 추가", "width=550, height=450, left=450, top=100, menubar=no, status=no, toolbar=no")
		});
		addTask.value = "업무 추가";
		addTask.className = "addTask";
		addTask.style.backgroundImage = "url('/resources/img/plus.png')";
		addTask.style.backgroundPosition = "92px 1px";
		addTask.style.backgroundSize = "30px 30px";
		addTask.style.backgroundRepeat = "no-repeat";
		
		
		countTask.appendChild(addTask);
		
		for (i = 0; i < task.length; i++) {
			let num = i;
			let taskIndex = i;

			let taskBoxDiv = document.createElement('div');
			taskBoxDiv.className = "taskBoxDiv";

			let taskBox = document.createElement('div');
			taskBox.className = "taskBox";

			let timeTask = document.createElement('div');
			timeTask.className = "timeTask";
			timeTask.textContent = (i + 1) + ". ";

			taskBox.appendChild(timeTask);

			let chooseTime = document.createElement('div');
			chooseTime.className = "chooseTime";
			chooseTime.textContent = task[i].tlComment;
			chooseTime.value = task[i].tlNumber;
			chooseTime.id = "chooseTime" + i;

			taskBox.appendChild(chooseTime);

			let taskContent = document.createElement('div');
			taskContent.className = "taskContent";
			taskContent.textContent = task[i].mtDetail.replace(/\+/g, " ");// 추가했음 replace
			taskContent.id = "taskName" + i;
			taskContent.value = task[i].mtDetail;

			taskBox.appendChild(taskContent);

			let together = document.createElement('div');
			together.className = "together";

			let setting = document.createElement('div');
			setting.className = "setting";

			let button = document.createElement('button');
			button.className = "settingButton";

			let settingImg = document.createElement('img');
			settingImg.src = "/resources/img/bolt.jpg";
			settingImg.style = "width:30px";
			settingImg.style = "height:30px";

			button.appendChild(settingImg);

			setting.appendChild(button);

			let settingContent = document.createElement('div');
			settingContent.className = "settingContent";

			let editInfo = document.createElement('a');
			editInfo.style.cursor = "pointer";
			editInfo.textContent = "수정하기";
			editInfo.addEventListener('click', function() {

				taskTypeSelect(num);

			});

			settingContent.appendChild(editInfo);

			let deleteInfo = document.createElement('a');
			deleteInfo.style.cursor = "pointer";
			deleteInfo.textContent = "삭제하기";
			deleteInfo.addEventListener('click', function() {

				goTypeDelete(taskIndex);

			});

			settingContent.appendChild(deleteInfo);

			setting.appendChild(settingContent);

			together.appendChild(setting);

			taskBox.appendChild(together);

			taskBoxDiv.appendChild(taskBox); // 새로추가한 taskBox를 묶는 큰 div

			taskList.appendChild(taskBoxDiv);
		}
	}
</script>
</html>