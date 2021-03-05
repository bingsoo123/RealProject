<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매장명을 검색하세요</title>
<link href="/resources/css/searchMap.css" rel="stylesheet">

</head>
<body>
	<span class="regist_title_pop"> 
		<label for="reg_store">매장등록하기</label> 
	</span>
<input type="text" class="regist_info_list" id="storeName" name="road" minlength="2" maxlength="30" title="매장명" placeholder="매장이름을 입력하세요" readOnly>

<button type="button" onClick="sample5_address()" class="searchstore">매장찾기</button>
<input type="text" class="regist_info_detail"  id="detailAddress" name="detail" placeholder="상세주소">
<div class="regist_storelist" id="roadAddress"> 
<div id="map" style="width:500px;height:400px;"></div>

</div>
<span id="guide" style="color:#999;display:none"></span>
<input type="button" class="regist_info_btn2" value="확인" onClick="submitAddr()">

</body>
<!-- 지도,주소api를 불러오기 위한 다음페이지 제공 소스  -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- 지도 api값을 불러오기 위한 api코드(자바스크립트키 사용) -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=	c12ddaa519ac1f1f821e84ef032ac15d&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div
mapOption = {
    center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
    level: 5 // 지도의 확대 레벨
};

//지도를 미리 생성
var map = new daum.maps.Map(mapContainer, mapOption);
//주소-좌표 변환 객체를 생성
var geocoder = new daum.maps.services.Geocoder();
//마커를 미리 생성
var marker = new daum.maps.Marker({
position: new daum.maps.LatLng(37.537187, 127.005476),
map: map
});

	
function sample5_address() {
    new daum.Postcode({
        oncomplete: function(data) {
            var addr = data.address; // 최종 주소 변수

            // 주소 정보를 해당 필드에 넣는다.
            document.getElementById("storeName").value = addr;
            // 주소로 상세 정보를 검색
            geocoder.addressSearch(data.address, function(results, status) {
                // 정상적으로 검색이 완료됐으면
                if (status === daum.maps.services.Status.OK) {

                    var result = results[0]; //첫번째 결과의 값을 활용

                    // 해당 주소에 대한 좌표를 받아서
                    var coords = new daum.maps.LatLng(result.y, result.x);
                    // 지도를 보여준다.
                    mapContainer.style.display = "block";
                    map.relayout();
                    // 지도 중심을 변경한다.
                    map.setCenter(coords);
                    // 마커를 결과값으로 받은 위치로 옮긴다.
                    marker.setPosition(coords)
                }
            });
        }
    }).open();
}


function submitAddr(){

	let road = document.getElementById('storeName');
	let detail = document.getElementById('detailAddress');
	
	 road = document.getElementById('storeName').value;
	 detail = document.getElementById('detailAddress').value ;
	

	//최종 부모
	let list=road + " " + detail;
	
	 
 	let ref_str = document.createElement("div");
	ref_str.append(list);

 

	let div = document.getElementById("roadAddress");
	div.appendChild(ref_str);
	
	let form = document.createElement("form");
	form.method="post";
	form.action="Join";
	form.target="regist_info_addr";
	form.appendChild(div);
	document.body.appendChild(form);
	  opener.document.getElementById("regist_info_addr").value = list;

	
	
	form.submit();
	
	

	window.close();
	
}



</script>
</html>

