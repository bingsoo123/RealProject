<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body onLoad="workDiary()">

	알바생 페이지입니다.
	

</body>

<script>

	function workDiary(){
		
		var popupWidth = 690;
		var popupHeight = 590;
	
		var popupX = (window.screen.width / 2) - (popupWidth / 2);
		// 만들 팝업창 width 크기의 1/2 만큼 보정값으로 빼주었음

		var popupY= (window.screen.height / 2) - (popupHeight / 2) - 100;
		// 만들 팝업창 height 크기의 1/2 만큼 보정값으로 빼주었음
		
		
		window.open("/TestWork?lCode=${lCode}","근무일지",'status=no, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);
		
	}


</script>

</html>