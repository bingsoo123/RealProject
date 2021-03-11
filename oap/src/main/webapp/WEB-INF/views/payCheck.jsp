<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE HTML>
<html>
<head>
   <title>표</title>
   <link href="/resources/css/payCheck.css" rel="stylesheet"/> 
   <style>
      div {
        border: 1px solid #bcbcbc;
	  }
    </style>
</head>
<body onLoad="init()">
	   
	<div id="tb-table" class="jb-table">
	
      <div class="jb-table-row1">
      
        <div class="jb-table-cell1">
          <h3>번호</h3>
        </div>
        
        <div class="jb-table-cell2">
          <h3>매장명</h3>
        </div>
        
        <div class="jb-table-cell2">
          <h3>업종</h3>
        </div>
        
         <div class="jb-table-cell2">
          <h3>급여 이름</h3>
        </div>
        
         <div class="jb-table-cell2">
          <h3>급여 기간</h3>
        </div>
        
         <div class="jb-table-cell2">
          <h3>총 지급액</h3>
        </div>
        
        
       </div>
      
   <!--   <div class="jb-table-row">
      
        <div class="jb-table-cell1">
          <h3>1</h3>
        </div>
        
        <div class="jb-table-cell">
          <h4>다이소</h4>
        </div>
        
        <div class="jb-table-cell">
          <h4>숙박 및 음식점업</h4>
        </div>
        
        <div class="jb-table-cell">
          <h4>2021년01월명세서</h4>
        </div>
        
        <div class="jb-table-cell">
          <h4>20210109~20210119</h4>
        </div>
        
        <div class="jb-table-cell">
          <h4>138000원</h4>
        </div>
        
        
      </div> -->
      
      
      
    </div>
      
</body>

<script>

	function init(){
		alert("ok");
		
		var mainTable = document.getElementById('tb-table');
		
		var pay = JSON.parse('${pay}');
		
		for(i=0 ; i< pay.length ; i++){
			
			var tb = document.createElement('Div');
			tb.className = "jb-table-row"
			
			// 넘버링
			var dv = document.createElement('Div');
			var h3 = document.createElement('h3');
			var text1 = document.createTextNode(i+1);
			h3.appendChild(text1);
			dv.className="jb-table-cell1";
			dv.appendChild(h3);
			tb.appendChild(dv);
			
			
			// 매장명
			var dv2 = document.createElement('Div');
			var h4 = document.createElement('h4');
			var text2 = document.createTextNode(pay[i].shName);
			h4.appendChild(text2);			
			dv2.className="jb-table-cell";
			dv2.appendChild(h4);
			tb.appendChild(dv2);
			
			
			// 업종
			var dv3 = document.createElement('Div');
			var h42 = document.createElement('h4');
			var text3 = document.createTextNode(pay[i].shType);
			h42.appendChild(text3);			
			dv3.className="jb-table-cell";
			dv3.appendChild(h42);
			tb.appendChild(dv3);
			
			
			// 급여이름
			var dv4 = document.createElement('Div');
			var h43 = document.createElement('h4');
			var text4 = document.createTextNode(pay[i].paName);
			h43.appendChild(text4);			
			dv4.className="jb-table-cell";
			dv4.appendChild(h43);
			tb.appendChild(dv4);
			
			
			// 급여 기간
			var dv5 = document.createElement('Div');
			var h44 = document.createElement('h4');
			var text5 = document.createTextNode(pay[i].startDate + " ~ " + pay[i].endDate);
			h44.appendChild(text5);			
			dv5.className="jb-table-cell";
			dv5.appendChild(h44);
			tb.appendChild(dv5);
			
			
			// 총 지급액
			var dv6 = document.createElement('Div');
			var h45 = document.createElement('h4');
			var text6 = document.createTextNode(pay[i].payTotal);
			h45.appendChild(text6);			
			dv6.className="jb-table-cell";
			dv6.appendChild(h45);
			tb.appendChild(dv6);
			
			mainTable.appendChild(tb);
			
		}
		
	}

</script>

</html>





