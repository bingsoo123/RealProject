<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/commute.css" rel="stylesheet" />
</head>
<body>
	<h2>날짜선택
	</h2>
	<div class="datecontainer">
	<input type="date"  class="datebox" name="date1" id="test1"/> 
	<div class="texts">~</div> 
	<input type="date"  class="datebox" name="date2" id="test2"/>
	<input type="button" class="selectdate" value="조회" onClick="tnt()">
	</div>
	<br>


	<div class="texts">2021.02.09</div>
	<br>

	<div class="datbox">
		<div class="workerbox">
		<div class="worker">채빈수</div>
		<div class="workertime">근무시간
		<div class="starttime">08:30</div>
		<div class="checktime">~</div>
		<div class="endtime">12:00</div>

	
		<div class="workertime2" >출근시간
			<div class="starttime">08:30</div>
		<div class="checktime">~</div>
		<div class="endtime">12:00</div>
		</div>
		</div>
		</div>
		</div>
		

	<br>

	<div class="texts">2021.02.10</div>
	<br>

	<div class="datbox">
		<div class="workerbox">
		<div class="worker">조선행</div>
		<div class="workertime">근무시간
		<div class="starttime">00:00</div>
		<div class="checktime">~</div>
		<div class="endtime">23:59</div>

	
		<div class="workertime2" >출근시간
			<div class="starttime">00:30</div>
		<div class="checktime">~</div>
		<div class="endtime">23:59</div>
		</div>
		</div>
		</div>
		</div>
		
	<br>

	<div class="datbox">
		<div class="workerbox">
		<div class="worker">김부장</div>
		<div class="workertime">근무시간
		<div class="starttime">15:00</div>
		<div class="checktime">~</div>
		<div class="endtime">19:00</div>

	
		<div class="workertime2" >출근시간
			<div class="starttime">15:01</div>
		<div class="checktime">~</div>
		<div class="endtime">19:05</div>
		</div>
		</div>
		</div>
		</div>
		
	<br>


	<div class="datbox">
		<div class="workerbox">
		<div class="worker">백산수</div>
		<div class="workertime">근무시간
		<div class="starttime">22:00</div>
		<div class="checktime">~</div>
		<div class="endtime">03:00</div>

	
		<div class="workertime2" >출근시간
			<div class="starttime">21:58</div>
		<div class="checktime">~</div>
		<div class="endtime">03:05</div>
		</div>
		</div>
		</div>
		</div>
		
	<br>

</body>

<script>
function tnt() {
    var x = document.getElementById("test1").value;
    var y = document.getElementById("test2").value;
    alert(x);
    alert(y);
}
</script>
</html>