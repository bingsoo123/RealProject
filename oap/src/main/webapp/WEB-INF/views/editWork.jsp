<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE HTML>
<html>
<head>
   <title>업무수정</title>
   <link href="/resources/css/addWork.css" rel="stylesheet"/> 
   <script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body onLoad="selectName()">
<!-- 상단에 요일 값 가져오기 -->

	
	
   <fieldset class="field1">
   	<legend>업무 수정</legend><br/>
   	
	<div class="selectName">
   	 	 
   		<label for="분류1">매장 리스트</label>
   		<select id="name">
             
   	    </select>
    	
    	<label for="분류3">근무 타입</label>
    	<select id="tlComment">
             
    	</select>
    	
   	  
   	  
	</div>
   	  
   	
	<fieldset class="field2">
   	 	<legend>내용</legend>
   	 	<textarea id=editMtDetail style="width: 450px;height: 175px;" placeholder="할 일을 입력해주세요. Let's write to do list"></textarea>
   	 	</fieldset>
    
	</fieldset>
    <input type="button" value="수정하기" style="position:absolute; left:469px; margin:10px 0 0 0;
    											background-color: #FFCC99; color:white; border-radius: 3px;
    											width:70px;	height:35px; border:1px solid #CCCCCC;"
												onclick="goEdit()"/>
    	

</body>

<script>
	function selectName() {
		
		
		// 매장리스트 가져오려고 2번 사용
		let nameData = JSON.parse('${nameData}');
		
		// tlnumber 업무타입 가져오려고 2번 사용
		let commentData = JSON.parse('${commentData}');
		
		// mtDatail 사용하려고 2번 사용
		// 수정하기 전 데이터
		let allTaskList = JSON.parse('${allTaskList}');
		
		/* 수정전 서버 데이터와 현재 클라이언트의 출력된 정보가 같으면 을 WHERE 절에 넣을거
		let mtDetail = document.getElementById("mtDetail").value;
		for(i = 0; i < allTaskList.length; i++){
			if(allTaskList[i].mtDetail == mtDetail){
				
			}
		}
		*/
		
		for(i = 0; i < nameData.length; i++) {
			
			// 알바생 이름
			
			let name = document.getElementById('name');
			
				let abName = document.createElement("option");
				abName.value = nameData[i].shCode;
				abName.text = nameData[i].shName;
				
			name.appendChild(abName);
			
		}
		
		for(i = 0; i < commentData.length; i++){
			// 수정한 후 보낼 데이터
			let tlComment = document.getElementById('tlComment');
			
				let comment = document.createElement("option");
				comment.value = commentData[i].tlNumber; // value = 1
				comment.text = commentData[i].tlComment; // 보여지는 근무타입
			
			tlComment.appendChild(comment);
		}
	}
	
function goEdit() {
	
	let shCode = document.getElementById("name").value;
	let tlComment = document.getElementById("tlComment").value;
	let editMtDetail = document.getElementById("editMtDetail").value; // 클라이언트가 수정을 요청한 값 (변경할 값)
	let mtDetail = "${mtDetail}"; // 클라이언트에서 보이는 값 (기존 값)
	
	
	alert(shCode + "-" + tlComment + "-" + mtDetail + "-" + editMtDetail);
	     
     let request = new XMLHttpRequest();
     request.onreadystatechange = function(){
        if(this.readyState == 4 && this.status == 200){
           let jsonData = decodeURIComponent(request.response);
           alert("업무 수정이 완료 되었습니다.");
           }
	   };
	request.open("POST", "ChangeComplete", true);
	request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
	request.send("sCode=ChangeComplete" + "&shCode=" + shCode + "&tlNumber=" + tlComment + "&mtDetail=" + mtDetail + "&editMtDetail=" + editMtDetail);

}
	
	
	//function textBoxChange() {
		//$(".field2").css("display", "none"); //값을 보여주지 않음
		//$(".field2").css("display", "block"); // 값을 보여줌
	//}
	
</script>


</html>