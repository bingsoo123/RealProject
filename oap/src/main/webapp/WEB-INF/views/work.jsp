<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Home</title>
<link href="/resources/css/work.css" rel="stylesheet" media="screen"/>
</head>
<body>

	<input type="button" class="task" value="업무 추가" onClick="goAdd()">
	<div onload="counttask()" class="taskcon">총 3개의 업무가 있습니다</div>

	<div class="choiceTime">
		<div class="timeclick">전체</div>
		<div class="timeclick">오전</div>
		<div class="timeclick">오후</div>
		<div class="timeclick">야간</div>
	</div>

	<div class="taskbox1">
		<div class="timetask">1.</div>
		<div class="choosetime">오전</div>
		<div class="task-content">창문 열기</div>
		<div class="addimg">사진</div>
		<div class="addmail">매일</div>
		<div class="setting" >
			<button class="settingbutton" >
				<img src="/resources/img/bolt.jpg" style="width:30px; height:30px;">
			</button>
			<div class="settingcontent" >
				<a href='#' onClick="javascript:init('수정하기ok')">수정하기</a> 
				<a href='#' onClick="javascript:init('삭제하기ok')">삭제하기</a>
			</div>
		</div>

	</div>
	<br>

	<div class="taskbox2">
		<div class="timetask">2.</div>
		<div class="choosetime">오후</div>
		<div class="task-content">사장님이 원하는 일1</div>
		<div class="addimg">사진</div>
		<div class="addmail">매일</div>
		<div class="setting">
			<button class="settingbutton" >
				<img src="/resources/img/bolt.jpg" style="width:30px; height:30px;">
			</button>
			<div class="settingcontent">
				<a href='#' onClick="javascript:init('수정하기ok')">수정하기</a> 
				<a href='#' onClick="javascript:init('삭제하기ok')">삭제하기</a>
			</div>
		</div>
	</div>
	<br>

	<div class="taskbox3">
		<div class="timetask">3.</div>
		<div class="choosetime">야간</div>
		<div class="task-content">업무추가는 오른쪽 위에서 할 수 있습니다.</div>
		<div class="addimg">사진</div>
		<div class="addmail">매일</div>
		<div class="setting">
			<button class="settingbutton" >
				<img src="/resources/img/bolt.jpg" style="width:30px; height:30px;">
			</button>
			<div class="settingcontent">
				<a href='#' onClick="javascript:init('수정하기ok')">수정하기</a>
				<a href='#' onClick="javascript:init('삭제하기ok')">삭제하기</a>
			</div>
		</div>
	</div>
	<br>
</body>

<script>
function init(add){
	alert(add);
}

</script>