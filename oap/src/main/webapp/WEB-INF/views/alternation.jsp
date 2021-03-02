<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/workDiary.css" rel="stylesheet">
</head>
<body>

	<h1 style="text-align: center">근무일지</h1>
	<div id="work_diary_contents">

		<div class="test999">

			<div class="work_date_contents">2021.02.12.</div>
			<div class="work_diary">

				<div class="work_diary_contents">
					<div class="work_diary_contents_name">근무자</div>
					<div class="work_diary_contents_data">네모고먐</div>
				</div>
				<div class="work_diary_contents">
					<div class="work_diary_contents_name">근무시간</div>
					<div class="work_diary_contents_data">10:00</div>
				</div>

					<div class="work_diary_strongbox_contents">
						<div class="work_diary_contents_name">인수 금고현황</div>
						<div class="strongbox_row">
							<div class="work_diary_strongbox">10원</div>
							<input type="text" class="work_diary_strongbox_data"
								value="${sip}" name="money" disabled>
						</div>
						<div class="strongbox_row">
							<div class="work_diary_strongbox">50원</div>
							<input type="text" class="work_diary_strongbox_data"
								value="${osip}" name="money" disabled>
						</div>
						<div class="strongbox_row">
							<div class="work_diary_strongbox">100원</div>
							<input type="text" class="work_diary_strongbox_data"
								value="${baek}" name="money" disabled>
						</div>
						<div class="strongbox_row">
							<div class="work_diary_strongbox">500원</div>
							<input type="text" class="work_diary_strongbox_data"
								value="${obaek}" name="money" disabled>
						</div>
						<div class="strongbox_row">
							<div class="work_diary_strongbox">1000원</div>
							<input type="text" class="work_diary_strongbox_data"
								value="${chun}" name="money" disabled>
						</div>
						<div class="strongbox_row">
							<div class="work_diary_strongbox">5000원</div>
							<input type="text" class="work_diary_strongbox_data"
								value="${ochun}" name="money" disabled>
						</div>
						<div class="strongbox_row">
							<div class="work_diary_strongbox">10000원</div>
							<input type="text" class="work_diary_strongbox_data"
								value="${man}" name="money" disabled>
						</div>
						<div class="strongbox_row">
							<div class="work_diary_strongbox">50000원</div>
							<input type="text" class="work_diary_strongbox_data"
								value="${oman}" name="money" disabled>
						</div>
					</div>

				<div class="work_diary_strongbox_contents">
					<div class="work_diary_contents_name">인계 금고현황</div>
					<div class="strongbox_row">
						<div class="work_diary_strongbox">50,000원</div>
						<input type="text" class="work_diary_strongbox_data" disabled>
					</div>
					<div class="strongbox_row">
						<div class="work_diary_strongbox">10,000원</div>
						<input type="text" class="work_diary_strongbox_data" disabled>
					</div>
					<div class="strongbox_row">
						<div class="work_diary_strongbox">5,000원</div>
						<input type="text" class="work_diary_strongbox_data" disabled>
					</div>
					<div class="strongbox_row">
						<div class="work_diary_strongbox">1,000원</div>
						<input type="text" class="work_diary_strongbox_data" disabled>
					</div>
					<div class="strongbox_row">
						<div class="work_diary_strongbox">500원</div>
						<input type="text" class="work_diary_strongbox_data" disabled>
					</div>
					<div class="strongbox_row">
						<div class="work_diary_strongbox">100원</div>
						<input type="text" class="work_diary_strongbox_data" disabled>
					</div>
					<div class="strongbox_row">
						<div class="work_diary_strongbox">50원</div>
						<input type="text" class="work_diary_strongbox_data" disabled>
					</div>
					<div class="strongbox_row">
						<div class="work_diary_strongbox">10원</div>
						<input type="text" class="work_diary_strongbox_data" disabled>
					</div>
				</div>
				<div class="work_diary_contents_matters_test">
					<b>특이사항</b>
				</div>
				<div class="work_diary_contents_matters">
					<textarea class="work_diary_contents_matters_sahang"
						id="work_diary_sahang" disabled></textarea>

				</div>
				<br>
				<div class="work_diary_submit">
					<button type="submit" onClick="handOverStrongBox();">전송</button>
				</div>
			</div>


		</div>

	</div>

</body>
<script>
	function handOverStrongBox() {
		alert("ok");
		var str = ["sip","osip","baek","obaek","chun","ochun","man","oman"];
		
		let data = document.getElementsByName("money");
		let form = document.createElement("form");
		
		form.method="post";
		form.action="StartMoney";
		
		
		for(i=0 ; i<data.length ; i++){
			alert(data[i].value);	
			if(data[i].value != 0){
				//data[i].name=str[i]
				//form.appendChild(data[i]);
				let input = document.createElement("input");
				input.name = str[i];
				input.value = data[i].value;
				form.appendChild(input);
			}
		}
		
		document.body.appendChild(form);
		
		form.submit();
		
	}
</script>



</html>




