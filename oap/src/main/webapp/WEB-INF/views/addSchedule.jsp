<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE HTML>
<html>
<head>
   <title>일정등록</title>
   <link href="/resources/css/addSchedule.css" rel="stylesheet"/> 
</head>
<body>
	<div class="big">
	
		<div class="middle1">
			<label style="font-weight:600;">요일</label><br/>
			<div class="table-big">
			
				<div class="table-milddle1">
					<div class="table-small">월</div>
					<div class="table-small">화</div>
					<div class="table-small">수</div>
					<div class="table-small">목</div>
				</div>
				
				<div class="table-milddle1">
					<div class="table-small">금</div>
					<div class="table-small">토</div>
					<div class="table-small">일</div>
					<div class="table-small1">요일</div>
				</div>
				
			</div>
			<h6 class="middle1-h6">요일을 선택해주세요.</h6>
			
			<br/><br/><br/>
			
			<div class="selectclass">
			<select id="nameSelect">
             <option >알바생 선택</option>
             <option >바나나</option>
             <option >시금치</option>
             <option >삼겹살</option>
   	   		</select>
   	   		<h6 class="nameSelect-h6">알바생을 선택해주세요.</h6>
			</div>
			
		</div>
			
			
		<div class="middle2">
			<label style="font-weight:600;">시간</label><br/>
			<div class="table-big2">
			
				<div class="table-milddle2">
					<div class="table-small3">00</div>
					<div class="table-small3">01</div>
					<div class="table-small3">02</div>
					<div class="table-small3">03</div>
					<div class="table-small3">04</div>
					<div class="table-small3">05</div>
					<div class="table-small3">06</div>
					<div class="table-small3">07</div>
					<div class="table-small3">08</div>
					<div class="table-small3">09</div>
					<div class="table-small3">10</div>
					<div class="table-small3">11</div>
					<div class="table-small3">12</div>
				</div>
				
				<div class="table-milddle2">
					<div class="table-small3">13</div>
					<div class="table-small3">14</div>
					<div class="table-small3">15</div>
					<div class="table-small3">16</div>
					<div class="table-small3">17</div>
					<div class="table-small3">18</div>
					<div class="table-small3">19</div>
					<div class="table-small3">20</div>
					<div class="table-small3">21</div>
					<div class="table-small3">22</div>
					<div class="table-small3">23</div>
					<div class="table-small3">24</div>
					<div class="table-small4">시</div>
				</div>
				
			</div>
			<h6 class="middle2-h6">알바생의 시작 시간을 선택해 주세요.</h6>
			
			<br/><br/>
			
			
			<label style="font-weight:600;">적용될 날짜</label><br/>
			<input type="date" class="mi-date"> ~ <input type="date" class="mi-date">
			
			<input type="button" value="일정 등록" class="mi-button" onClick="init()">
			
			
		</div>
	</div>

  </body>
<script>
var div2 = document.getElementsByClassName("table-small");

function handleClick(event) {
  console.log(event.target);
  // console.log(this);
  // 콘솔창을 보면 둘다 동일한 값이 나온다

  console.log(event.target.classList);

  if (event.target.classList[1] === "clicked") {
    event.target.classList.remove("clicked");
  } else {
    for (var i = 0; i < div2.length; i++) {
      div2[i].classList.remove("clicked");
    }

    event.target.classList.add("clicked");
  }
}

function init() {
	// document.getElementsByClassName("test")[0].value
	var clickcnt = document.getElementsByClassName("clicked1").length;
	// document.getElementsByClassName("test")[0].value
	var testtemp
	testtemp = "";
	  if (clickcnt > 0) {
		  for (var i = 0; i < clickcnt; i++) {
				  if(i == 0){
					  testtemp = document.getElementsByClassName("clicked1")[i].innerText	;				  
				  }else{
					  testtemp = testtemp + ',' + document.getElementsByClassName("clicked1")[i].innerText;					  
				  }
		    
		  }
			alert(testtemp)		  
	  }
  for (var i = 0; i < div2.length; i++) {
    div2[i].addEventListener("click", handleClick);
  }
}

init();

var div3 = document.getElementsByClassName("table-small3");

function handleClick(event) {
  console.log(event.target);
  // console.log(this);
  // 콘솔창을 보면 둘다 동일한 값이 나온다

  console.log(event.target.classList);

  if (event.target.classList[1] === "clicked1") {
    event.target.classList.remove("clicked1");
  } else {
    for (var i = 0; i < div3.length; i++) {
      div3[i].classList.remove("clicked1");
    }

    event.target.classList.add("clicked1");
  }
}

function init1() {
  for (var i = 0; i < div3.length; i++) {
    div3[i].addEventListener("click", handleClick);
  }
}

init1();


</script>
</html>