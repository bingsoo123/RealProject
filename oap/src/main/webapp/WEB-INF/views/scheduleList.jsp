<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/scheduleList.css" rel="stylesheet" media="screen"/>
<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body onLoad="scheduleList()">
	
	<div class="weekSchedule" id="weekSchedule">
	
	</div>

</body>

<script>

	function scheduleList(){
		
		var sList = JSON.parse('${scheduleList}');
		
		var str = sList[0].startTime;
		
		
		var mainDiv = document.getElementById("weekSchedule");
		
		var topDiv = document.createElement("Div");
		topDiv.className="scheduleList-top";
		topDiv.id="scheduleList";
		
		var topAlba = document.createElement("Div");
		var albaImg = document.createElement("Img");
		albaImg.src="/resources/img/"+sList[0].abGender+".png";
		albaImg.setAttribute("style","width:80px;height:80px;");
		topAlba.appendChild(albaImg);
		topDiv.appendChild(topAlba);
		
		var topContent = document.createElement("Div");
		topContent.className="schedule-content";
		var text = document.createTextNode(sList[0].abName + " 알바생의 근무시간표");
		topContent.appendChild(text);
		topDiv.appendChild(topContent);
		
		mainDiv.appendChild(topDiv);
		
		
		for(index = 0 ; index < sList.length ; index++){
			
			let startTime = sList[index].startTime;
			let endTime = sList[index].endTime;
			
			/* schedule-bottom 작성 */
			var bottomDiv = document.createElement("Div");
			bottomDiv.className="scheduleList-bottom";
			bottomDiv.id="scheduleList-bottom";

			var when = document.createElement("Div");
			when.className="schedule-when";
			when.id="schedule-when";
			var nText = document.createTextNode(sList[index].stComment + " - " + startTime.substr(0,2) + ":" + startTime.substr(2,2)  + " ~ " + endTime.substr(0,2) + ":" + endTime.substr(2,2));
			when.appendChild(nText);
			
			bottomDiv.appendChild(when);
		
			var logo = document.createElement("Img");
			logo.className="logo-img";
			logo.src="/resources/img/main_bee.png";
			bottomDiv.appendChild(logo);
			
			mainDiv.appendChild(bottomDiv);
			
		}
		
	}

</script>

</html>





