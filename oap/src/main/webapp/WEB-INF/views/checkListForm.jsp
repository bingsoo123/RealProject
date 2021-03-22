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
<body onLoad="checkInfo()">

		<div class="checkList" id="checkList">
		
			<h4>근무 간 업무 체크리스트</h4>
			
			<div class="checkList-content" id="checkList-content">
				<div class="checkList-list">
				
					<div class="body-contentList">업무목록</div>
					<div class="body-contentTrue">수행했음</div>
					<div class="body-contentFalse">수행하지 못함</div>
					
				</div>
				
				
			</div>
		
		
		</div>
		
			<button class="albaAdd_btn" onClick="transffer()">등록하기</button>

</body>

<script>

	function checkInfo(){
		
		var msg="${msg}";
		
		if(msg!=""){
			window.close();
		}
		
		// SHCODE  ,  ABCODE  ,  ABNAME  ,  TLNUMBER  , MTDETAIL
		var checkListInfo = JSON.parse('${checkListInfo}');
		
		var parent = document.getElementById("checkList-content");
		
		var dv = document.createElement("Div");
		dv.className="checkList-body";
		
		var detail = document.createElement("Div");
		detail.className="checkList-detail";
		
		var checkTrue = document.createElement("Div");
		checkTrue.className="checkList-True";
		
		var checkFalse = document.createElement("Div");
		checkFalse.className="checkList-false";
		
		for(index = 0 ; index < checkListInfo.length ; index++){
			
			var detailContent = document.createElement("Div");
			detailContent.className="detail-content";
			var text = document.createTextNode(checkListInfo[index].mtDetail);
			detailContent.appendChild(text);
			detail.appendChild(detailContent);
			
			var tlNum = document.createElement("input");
			tlNum.type="hidden";
			tlNum.name="tlNum";
			tlNum.value=checkListInfo[index].tlNumber;
			detail.appendChild(tlNum);

			
			// true - checkBox
			var trueBox = document.createElement("input");
			trueBox.type="checkbox";
			trueBox.id="is-true"+index;
			trueBox.name="checkTrue";
			trueBox.addEventListener('click',function(){
				multiChk(this);
			});
			trueBox.value="T";
			checkTrue.appendChild(trueBox);
			
			var labelTrue = document.createElement("label");
			labelTrue.htmlFor="is-true"+index;
			checkTrue.appendChild(labelTrue);

			
			// flase - checkBox
			var falseBox = document.createElement("input");
			falseBox.type="checkbox";
			falseBox.id="is-false"+index;
			falseBox.name="checkFalse";
			falseBox.addEventListener('click',function(){
				multiChk(this);
			});
			falseBox.value="F";
			checkFalse.appendChild(falseBox);
			
			var labelFalse = document.createElement("label");
			labelFalse.htmlFor="is-false"+index;
			checkFalse.appendChild(labelFalse);

		}
		
		dv.appendChild(detail);
		dv.appendChild(checkTrue);
		dv.appendChild(checkFalse);
		
		parent.appendChild(dv);
	}

	function multiChk(obj){
		
		var checkTrue = document.getElementsByName("checkTrue");
		var checkFalse = document.getElementsByName("checkFalse");
		
		for(var i=0; i<checkTrue.length; i++){
			
			if(checkTrue[i] == obj){
				checkFalse[i].checked=false;
			}else if(checkFalse[i] == obj){
				checkTrue[i].checked=false;				
			}
			
		}
	}
	
	function transffer(){
		
		var detailContent = document.getElementsByClassName("detail-content");
		var checkTrue = document.getElementsByName("checkTrue");
		var checkFalse = document.getElementsByName("checkFalse");
		var tNum = document.getElementsByName("tlNum");
		
		var form = document.createElement("form");
		form.method="post";
		form.action="CheckListForm";
		
		var abCode = document.createElement("input");
		abCode.type="hidden";
		abCode.name="abCode";
		abCode.value="${abCode}";
		form.appendChild(abCode);
		
		var shCode = document.createElement("input");
		shCode.type="hidden";
		shCode.name="shCode";
		shCode.value="${shCode}";
		form.appendChild(shCode);
		
		for (index=0 ; index < checkTrue.length ; index++){
			
			var detail = document.createElement("input");
			detail.type="hidden";
			detail.name="albaWorkDetail";
			detail.value=detailContent[index].innerText;
			form.appendChild(detail);
			
			
			
			var tlN = document.createElement("input");
			tlN.type="hidden";
			tlN.name="tlNum";
			tlN.value=tNum[index].value;
			form.appendChild(tlN);
			
			
			if(checkTrue[index].checked){
				
				var isCheck = document.createElement("input");
				isCheck.type="hidden";
				isCheck.name="isCheck";
				isCheck.value=checkTrue[index].value;
				form.appendChild(isCheck);
				
			}else if(checkFalse[index].checked){
				
				var isCheck = document.createElement("input");
				isCheck.type="hidden";
				isCheck.name="isCheck";
				isCheck.value=checkFalse[index].value;
				form.appendChild(isCheck);
			}
			
		}
		document.body.appendChild(form);
		form.submit();
		
	}

</script>

</html>


