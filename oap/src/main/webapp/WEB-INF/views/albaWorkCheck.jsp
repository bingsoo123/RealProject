<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link href="/resources/css/albaWorkCheck.css" rel="stylesheet" media="screen"/>
<script src="http://code.jquery.com/jquery-latest.js"></script>

<title>업무 리스트</title>
</head>

<body onLoad="init()">


	<div id="workList"></div>
	
	
	
</body>
	
<script>
	function init(){
		
		var wList = JSON.parse('${workList}');
		var tList = "${trueList}";
		var fList = "${falseList}";
		
		var trueSplit = tList.split("-");
		var falseSplit = fList.split("-");
		
		let workList = document.getElementById('workList');
		
		let all = document.createElement('Div');
		all.className="all";
		workList.appendChild(all);
		
		let one = document.createElement('Div');
		one.className="one";
		all.appendChild(one);
		
		let imgone = document.createElement('Div');
		imgone.className="img-one";
		one.appendChild(imgone);
		
		let imges = document.createElement('img');
		imges.className="imges";
		imges.src = "/resources/img/logo.png";
		imgone.appendChild(imges);
		
		let imga = document.createElement('a');
		imga.className="img-a";
		imga.textContent="최근 일주일간 업무 체크 리스트";
		imgone.appendChild(imga);
		
		let imgDiv = document.createElement('Div');
		imgDiv.className="imgDiv";
		imgone.appendChild(imgDiv);
		
		let two = document.createElement('Div');
		two.className="two";
		all.appendChild(two);
		
		let three = document.createElement('Div');
		three.className="three";
		two.appendChild(three);
		
		let worklist = document.createElement('label');
		worklist.className="workList";
		worklist.textContent="업무목록";
		three.appendChild(worklist);
		
		
		let four = document.createElement('Div');
		four.className="four";
		two.appendChild(four);
		
		let workCount = document.createElement('label');
		workCount.className="workCount";
		workCount.textContent="업무내역";
		four.appendChild(workCount);
		
		for(index = 0 ; index < wList.length ; index++){
			
			let infos = document.createElement('Div');
			infos.className="infos";
			infos.textContent=index+1 + " . " + wList[index].mtDetail;
			three.appendChild(infos);
			
			
			let comple = document.createElement('Div');
			comple.className="comple";
			comple.textContent=trueSplit[index] + "번 실행함 | " + falseSplit[index] + "번 미수행";
			four.appendChild(comple);
			
		}
		

		
	}	
	
</script>

</html>