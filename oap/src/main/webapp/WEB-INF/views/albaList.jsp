<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE HTML>
<html>
<head>
   <title>Home</title>
   <link href="/resources/css/albaList.css" rel="stylesheet"/> 
</head>
<body onLoad="init()">

	<div id="pos" class="position">
	
	</div>
	
</body>

<script>

	function init(){
		
		var list = JSON.parse('${myAlbaList}');
		
		var md = document.getElementById("pos");
		
		md.innerHTML="";
		
		for(i=0 ; i<list.length ; i++){
			
			var mainDiv = document.createElement('Div');
			
			mainDiv.className = "officer";
			
			var serDiv = document.createElement('Div');
			var img = document.createElement('img');
			var h1 = document.createElement('div');
			var text = document.createTextNode(list[i].shName);
			h1.className="officerTitle";
			h1.appendChild(text);
			var h2 = document.createElement('div');
			var text2 = document.createTextNode(list[i].shType);
			h2.className="oname";
			h2.appendChild(text2);
			
			let h4 = document.createElement('div');
			let myPay = document.createElement('input');
			myPay.type = "button";
			myPay.className = "apply_btn1";
			myPay.value = "최근 급여 조회";
			h4.appendChild(myPay);
			
			let h5 = document.createElement('div');
			let mySchedule = document.createElement('input');
			mySchedule.type = "button";
			mySchedule.className = "apply_btn2";
			mySchedule.value = "오늘 일정 조회";
			mySchedule.addEventListener('click',test);
			h4.appendChild(mySchedule);
			
			img.src="/resources/workZoneImg/" + list[i].shImg;
			img.style.cursor = "pointer";
			img.style.width = "100px";
			img.style.height = "100px";
			img.style.marginTop = "20px";
			serDiv.appendChild(img);
			serDiv.className="offimg";
						
			var br = document.createElement("br");
			
			mainDiv.appendChild(serDiv);
			mainDiv.appendChild(h1);
			mainDiv.appendChild(h2);
			mainDiv.appendChild(h4);
			mainDiv.appendChild(h5);
			md.appendChild(mainDiv);
			//document.body.appendChild(mainDiv);
			document.body.appendChild(br);
			
		}
		
		//document.body.appendChild(div);
		
	}
	
	function test(){
		
		alert("dfadsfdsaf");
		
	}

</script>

</html>



