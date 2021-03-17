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
			var h3 = document.createElement('div');
			var text3 = document.createTextNode("근무시간 : " + list[i].startTime + " ~ " + list[i].endTime);
			h3.className="omember";
			h3.appendChild(text3);
			
			
			img.src="/resources/img/mac.jpg";
			img.style.cursor = "pointer";
			img.style.width = "100px";
			img.style.marginTop = "20px";
			serDiv.appendChild(img);
			serDiv.className="offimg";
						
			var br = document.createElement("br");
			
			mainDiv.appendChild(serDiv);
			mainDiv.appendChild(h1);
			mainDiv.appendChild(h2);
			mainDiv.appendChild(h3);
			md.appendChild(mainDiv);
			//document.body.appendChild(mainDiv);
			document.body.appendChild(br);
			
		}
		
		//document.body.appendChild(div);
		
	}

</script>

</html>



