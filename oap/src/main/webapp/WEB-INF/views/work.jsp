<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Home</title>
<link href="/resources/css/work.css" rel="stylesheet" media="screen"/>
<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body onLoad="init()">


	<div id="taskList">
	
	</div>
	<!-- <img src="/resources/img/bolt.png" width="30px" height="30px" class="content-img"> -->
	<div id="detail">
	
		<div class="detail-name">청소하기</div>
        <div class="detail-content">1. 청소를 잘하면 복받아요 사랑받아요 행복해요</div>
        <div class="detail-content">2. 일을 잘해도  복받아요 사랑받아요 행복해요</div>
        <div class="detail-content">3. 정산을 잘하면 복받아요 사랑받아요 행복해요</div>
        <div class="detail-content">4. 재고정리를 잘해도 복받아요 사랑받아요 행복해요</div>
        <div class="detail-content">5. 돈을 잘벌어도 복받아요 사랑받아요 행복해요</div>
		
	</div>
	
</body>

<script>

	function init(){
	
		var typeList = JSON.parse('${typeList}');
		var area = document.getElementById("taskList");
		
		for(index=0 ; index<typeList.length ; index++){
			
			var btn = document.createElement("Div");
			btn.className="button-8";
			
			var effect = document.createElement("Div");
			effect.className = "eff-8";
			btn.appendChild(effect);
			
			var aTag = document.createElement("a");
			aTag.href="javascript:ajaxF(" + typeList[index].tlNumber + ")";
			var Text = document.createTextNode(typeList[index].tlComment);
			aTag.appendChild(Text);
			btn.appendChild(aTag);
			
			area.appendChild(btn);
		}
	}
	
	function ajaxF(param){
		
		var shn = $("#shopSelect option:selected").val();
		
		 let request = new XMLHttpRequest();
		 request.onreadystatechange = function(){
		    if(this.readyState == 4 && this.status == 200){
		       let jsonData = decodeURIComponent(request.response);
		       let albaData = JSON.parse(jsonData);
		       workType(albaData);
		    }
		    
		 };
		 
		 request.open("POST", "WorkType" , true);
		 request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
		 request.send("tlNumber=" + param +"&shCode="+shn);
	}
	
	function workType(param){

		$('#detail').empty();
		
		var zone = document.getElementById("detail");
		
		var name = document.createElement("Div");
		name.className="detail-name";

		var text = document.createTextNode(param[0].tlComment.replaceAll("+"," "));
		name.appendChild(text);
		zone.appendChild(name);
		
		for(index = 0 ; index<param.length ; index++){
			
			var dv = document.createElement("Div");
			dv.className = "detail-content";
			var cont = document.createTextNode(index+1+" . "+param[index].mtDetail.replaceAll("+"," "));
			dv.appendChild(cont);
			zone.appendChild(dv);
		}
		
		
	}

	function manaOnchangeTest(obj) {
		// obj에는 관리자 코드/이름  매장 코드/이름이 들어있음
		let shopHiddenInput = document.getElementById('shopCode');
	    let shopName = obj.options[obj.selectedIndex].text;
		shopHiddenInput.value = obj.value;
		alert("바꼇당!!");
		Schedule();
	}

</script>
</html>



