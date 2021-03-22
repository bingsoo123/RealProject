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
	
	<div class="taskListAdd" id="taskListAdd" onClick="taskListAdd()"><a href="#" class="button">업무 추가하기</a></div>
	
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
		    	if(jsonData=="noSession"){
		    		 location.href="/LogInForm?lCode=manage";
		        }		
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
		
		var shCode = $("#shopSelect option:selected").val();
		
		var zone = document.getElementById("detail");
		
		var name = document.createElement("Div");
		name.className="detail-name";

		var text = document.createTextNode(param[0].tlComment.replaceAll("+"," "));
		name.appendChild(text);
		zone.appendChild(name);
		
		for(index = 0 ; index<param.length ; index++){
			let indexTest = index;
			var dv = document.createElement("Div");
			dv.className = "detail-content";
			var cont = document.createTextNode(index+1+" . "+param[index].mtDetail.replaceAll("+"," "));
			dv.appendChild(cont);
			dv.addEventListener('click',function(){
				openInfo(param);
			});
			
	        var line = document.createElement("Div");
			line.className="alba-line";
			line.setAttribute("id","lineTest" + indexTest);
			
			
			
			/*------------ Ajax 처리 ( 해당하는 상세내용에 의해 해당 알바생 리스트를 가져옴) ----------*/
			
			var shcode = param[index].shCode;
			var tlNumber = param[index].tlNumber;
			var mtDetail = param[index].mtDetail.replaceAll("+"," ");
			
			 let request = new XMLHttpRequest();
			 request.onreadystatechange = function(){
			    if(this.readyState == 4 && this.status == 200){
			       let jsond = decodeURIComponent(request.response);
			    	if(jsond=="noSession"){
			    		 location.href="/LogInForm?lCode=manage";
			        }		
			       let albaD = JSON.parse(jsond);
			       
			       for(i = 0 ; i<albaD.length ; i++){
			    	   let num = i;
			    	   
			    	   let li = document.getElementById("lineTest"+indexTest);
			    	   
						// 해당하는 알바생의 수 만큼 동적으로 만들어져야하므로 for문을 돌림 
						let flex = document.createElement("Div");
						flex.className="alba-flex";
						let imageBox = document.createElement("Div");
						imageBox.className="content-image";
						imageBox.style.cursor="pointer";
						imageBox.addEventListener('click', function() {
							//albaInfoOpen(shCode,albaD[num].abCode);
							albaWorkCount(shCode,albaD[num].abCode,mtDetail)
						});
						let image = document.createElement("Img");
						image.src="/resources/img/"+albaD[i].abGender + ".png";
						image.setAttribute("style","width:50px;height:50px;");
						imageBox.appendChild(image);
						flex.appendChild(imageBox);
						let p1 = document.createElement("p");
						p1.className="alba-test";
						let nText = document.createTextNode(albaD[i].abName);
						p1.appendChild(nText);
						flex.appendChild(p1);
						li.appendChild(flex);
			       }
			 	
			    }
			    
			 };
			 
			 request.open("POST", "WhoWork" , true);
			 request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
			 request.send("shCode=" + shcode + "&tlNumber=" + tlNumber + "&mtDetail=" + mtDetail);
			
			 
			 zone.appendChild(dv);
			 zone.appendChild(line);
			
		}
	}
	

	function taskListAdd(){
		
		var shCode = $("#shopSelect option:selected").val();
		
		window.open("","pop","width=640,height=380,left=600,top=1500,toolbar=no,status=no,resizable=no");
		
		var form = document.createElement("form");
		form.method="post";
		form.action="/WorkAdd";
		form.target="pop";
		
		var inputData = document.createElement("input");
		inputData.type="hidden";
		inputData.name="shCode";
		inputData.value=shCode;
		form.appendChild(inputData);
			
		var inputData2 = document.createElement("input");
		inputData2.type="hidden";
		inputData2.name="mnCode";
		inputData2.value=mnCode;
		form.appendChild(inputData2);

		
		document.body.appendChild(form);
		
		form.submit();
		

	}
	
	function albaWorkCount(shCode,abCode,mtDetail){
		
		var popupWidth = 750;
		var popupHeight = 590;

		var popupX = (window.screen.width / 2) - (popupWidth / 2);
		// 만들 팝업창 width 크기의 1/2 만큼 보정값으로 빼주었음

		var popupY= (window.screen.height / 2) - (popupHeight / 2) - 100;
		// 만들 팝업창 height 크기의 1/2 만큼 보정값으로 빼주었음
		
		let today = new Date();   
		let year = today.getFullYear(); // 년도
		let month = (today.getMonth()+1) >= 10 ? (today.getMonth()+1) : '0' + (today.getMonth()+1);  // 월
		let date = today.getDate() >= 10 ? today.getDate() : '0' + today.getDate();  // 날짜
		let day = today.getDay();  // 요일
		
		let dDay = year + "" + month + "" + date;
		
		alert(dDay);
		
		window.open("","pop",'status=no , height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);
		
		let form = document.createElement("form");
		form.method="post";
		form.action="WorkCountList?startDay=" + dDay + "&shCode=" + shCode + "&abCode=" + abCode + "&mtDetail=" + mtDetail;
		form.target="pop"
		
		document.body.appendChild(form);
		form.submit();
		
	}

	
</script>
</html>





