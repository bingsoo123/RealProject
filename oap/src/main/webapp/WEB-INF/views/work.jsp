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
	
	<div id="detail">
	
		
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
			dv.addEventListener('click',function(){
				openInfo(param);
			});
			zone.appendChild(dv);
		}
	}
	
	
	// workInfo  >>  shcode  ,  tlNumber , tlComment , mtDetail   
	function openInfo(workInfo){
		
		var shcode = workInfo[0].shCode;
		var tlNumber = workInfo[0].tlNumber;
		var mtDetail = workInfo[0].mtDetail.replaceAll("+"," ");
		alert(shcode + " :: " + tlNumber + " :: " + mtDetail);
		
		var popupX = (window.screen.width / 2) - (850 / 2);
		// 만들 팝업창 width 크기의 1/2 만큼 보정값으로 빼주었음

		var popupY= (window.screen.height / 2) - (250 / 2) - 100;
		// 만들 팝업창 height 크기의 1/2 만큼 보정값으로 빼주었음

		window.open("/WhoWork?shCode=" + shcode + "&tlNumber=" + tlNumber + "&mtDetail=" + mtDetail , "target", "width=850,height=250,left=" + popupX + ",top=" + popupY + ",toolbar=no,status=no,resizable=no");
	}
	
</script>
</html>





