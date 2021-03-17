<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/checkListForm.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
</head>
<body onLoad="check()">

		<div class="checkList" id="checkList">
		
			<h4>근무 간 업무 체크리스트</h4>
			
			<div class="checkList-content" id="checkList-content">
				<div class="checkList-list">
				
					<div class="body-contentList">업무목록</div>
					<div class="body-contentTrue">수행했음</div>
					<div class="body-contentFalse">수행하지 못함</div>
					
				</div>
				
				<div class="checkList-body">
				
					<div class="checkList-detail">
					
						<div class="detail-content">● 구석구석 먼지털고 청소하기</div>
						<div class="detail-content">● 커피머신 내부 해체해서 청소하기</div>
					
					</div>
					
					<div class="checkList-True">
					
						<input class="trueCheck" type="checkbox" name="trueBox" value="T">
						<input class="trueCheck" type="checkbox" name="trueBox" value="T">										

					
					</div>
				
					<div class="checkList-false">
									
						<input class="falseCheck" type="checkbox" name="falseeBox" value="F">
						<input class="falseCheck" type="checkbox" name="falseeBox" value="F">
					
					</div>
				
				</div>
				
			</div>
		
		</div>

</body>

<script>

	function check(){
		
		
		
	}

</script>

</html>