<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body onLoad="showInfo()">
	<div id ="title"></div>
	<section id="albaZone"></section>

</body>
<script>
	function showInfo() {
		let alba = JSON.parse('${shopAlba}');
		let title = document.getElementById('title');
		
		title.textContent="매장 알바생현황";
		title.style.left="50px";
		title.style.position="relative";
		title.style.fontSize="30px";
		title.style.width="900px";
		title.style.borderBottom="thick solid #FEE300";
		
		
		let section =document.getElementById("albaZone");
		section.style.position="relative";
		section.style.top="50px";
		section.style.left="50px";
		section.style.width="1000px";
		section.style.overflow="hidden";
		let container = document.createElement('div');
		container.style.margin = "20px";
		container.style.display = "flex";
		container.style.width = "900px";
		container.style.height = "200px";
		for (i = 0; i < alba.length; i++) {
			let abcon = document.createElement('div');
			abcon.style.width = "200px";
			abcon.style.height = "100px";
			abcon.style.margin="10px 30px";
			let abName = document.createElement('div');
			abName.style.width = "100px";
			abName.style.height = "100px";
			abName.style.fontSize = "20px";
			abName.style.textAlign ="center";
			abName.textContent = alba[i].abName;
			let gender = document.createElement('div');
			gender.style.width = "100px";
			gender.style.height = "100px";
			if (alba[i].abGender == "M") {
				gender.style.backgroundImage = "url(/resources/img/M.png)";
				gender.style.backgroundSize ="contain";
			} else {
				gender.style.backgroundImage = "url(/resources/img/F.png)";
				gender.style.backgroundSize ="contain";
			}

			abcon.appendChild(gender);
			abcon.appendChild(abName);
			container.appendChild(abcon);
			section.appendChild(container);

		}

	}
</script>



</html>