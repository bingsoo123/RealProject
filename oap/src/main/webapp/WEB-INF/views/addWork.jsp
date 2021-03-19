<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE HTML>
<html>
<head>
   <title>업무추가</title>
   <link href="/resources/css/addWork.css" rel="stylesheet"/> 
   <script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body onLoad="selectName()">
<!-- 상단에 요일 값 가져오기 -->

	
	
   <fieldset class="field1">
   	<legend>업무 추가</legend><br/>
   	
	<div class="selectName" style="width: 102%;">
   	 	 
   		<label for="분류1">매장 리스트</label>
   		<select id="name">
             
   	    </select>
    	
    	<label for="분류3">근무 타입</label>
    	<select id="tlComment">
             
    	</select>
    	
    	<select id="select-workMan">
    		
    		
    	</select>
   	  
   	  
	</div>
   	  
   	
	<fieldset class="field2" id="field2">
   	 	<legend>내용</legend>
   	 	<textarea id="mtDetail" style="width: 450px;height: 175px; resize: none;" placeholder="할 일을 입력해주세요. Let's write to do list"></textarea>
   	 	</fieldset>
    
	</fieldset>
    <input type="button" value="추가하기" class="addWorkBtn" onclick="goAdd()"/>
    

</body>

<script>

	function selectName() {

		let nameData = JSON.parse('${nameData}');
		let commentData = JSON.parse('${commentData}');
		let getWorkAlbaList = JSON.parse('${workAlbaList}');

		for (i = 0; i < nameData.length; i++) {

			// 알바생 이름
			var name = document.getElementById('name');

			let shName = document.createElement("option");
			shName.value = nameData[i].shCode;
			shName.text = nameData[i].shName;

			name.appendChild(shName);

		}
		
		name.addEventListener('change', function() {
			onChangeAlba();
		});

		for (i = 0; i < commentData.length; i++) {
			let tlComment = document.getElementById('tlComment');

			let comment = document.createElement("option");
			comment.value = commentData[i].tlNumber; // value = 1
			comment.text = commentData[i].tlComment; // 보여지는 근무타입

			tlComment.appendChild(comment);
		}

		for (i = 0; i < getWorkAlbaList.length; i++) {
			let selectWorkMan = document.getElementById('select-workMan');

			let albaList = document.createElement("option");
			albaList.value = getWorkAlbaList[i].abCode; // value = 1
			albaList.text = getWorkAlbaList[i].abName; // 보여지는 근무타입

			selectWorkMan.appendChild(albaList);
		}

	}

	function goAdd() {
		let shCode = document.getElementById("name").value;
		let tlComment = document.getElementById("tlComment").value;
		let mtDetail = document.getElementById("mtDetail").value;
		let abCode = document.getElementById("select-workMan").value;

		alert(shCode + "::" + abCode + "::" + tlComment + "::" + mtDetail);
		
		     let request = new XMLHttpRequest();
		     request.onreadystatechange = function(){
		        if(this.readyState == 4 && this.status == 200){
		        	let jsonData = decodeURIComponent(request.response);
			    	if(jsonData=="noSession"){
			    		 location.href="/LogInForm?lCode=manage";
			        }		
		            alert("업무 추가가 완료 되었습니다.");
		            $('#mtDetail').val('');
		            }
			   };
			request.open("POST", "WorkAddComplete", true);
			request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
			request.send("sCode=WorkAddComplete" + "&shCode=" + shCode + "&tlNumber=" + tlComment + "&mtDetail=" + mtDetail + "&abCode=" + abCode);

	}

	function onChangeAlba() {
		
		alert("1212");
		let shCode = $("#name option:selected").val();
		let selectWorkMan = document.getElementById('select-workMan');
		
		
	    let request = new XMLHttpRequest();
	    request.onreadystatechange = function(){
	   		if(this.readyState == 4 && this.status == 200){
			    let jsonData = decodeURIComponent(request.response);
		    	if(jsonData=="noSession"){
		    		 location.href="/LogInForm?lCode=manage";
		        }		
			    let changeAlba = JSON.parse(jsonData);
	   			$('#select-workMan').empty();
	   			alert(changeAlba.length);
	   			
	   			for(index = 0 ; index < changeAlba.length ; index++){
						   				
	   				let albaList = document.createElement("option");
	   				albaList.value = changeAlba[index].abCode; // value = 1
	   				albaList.text = changeAlba[index].abName; // 보여지는 근무타입

	   				selectWorkMan.appendChild(albaList);
	   				
	   			}
	   			
	    	}
		};
		
		request.open("POST", "ChangeAlbaList", true);
		request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
		request.send("sCode=ChangeAlbaList&shCode=" + shCode);
				
	}
</script>


</html>