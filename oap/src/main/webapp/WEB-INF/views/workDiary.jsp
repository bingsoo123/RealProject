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
	<section id="logZone"></section>
	<button type="button" onclick="init()">시작</button>


</body>
<script>
	function init() {

	
		let section = document.getElementById("logZone");

		let log = JSON.parse('${Log}');

		let nameTemp;
		let timeTemp;
		let moneyTemp;
		let moneycnt;
		let moneyTemp2;
		let moneycnt2;
		let noteTemp;
		let workdayTemp;
		let albaTemp;
		let wltimeT;
		let div = document.createElement('div');
		div.className = "test999";

		let title = document.createElement('h1');
		title.textContent = "근무일지";

		let wrap = document.createElement('div');
		wrap.className = "logZone";

		div.appendChild(title);
		// 	 	let indexNot = 0;
		let moneyConIndex = 0;
// 		let moneyRowIndex = 0;
		for (i = 0; i < log.length; i++) {
		
			if (i % 8 == 0 ) {
				moneyConIndex +=1;
// 				moneyRowIndex +=1;
				//중복시 삭제 되는 창 
				//데이터 담을 틀
				let diary = document.createElement('div');
				diary.className = "work_diary";

				//근무일자	
				let workday = document.createElement('div');
				workdayTemp = log[i].rtTime.substring(0, 10);
				workday.className = "work_date_contents";
				workday.style.width = "200px";
				workday.textContent = workdayTemp;

				//알바생이름	
				let conbox = document.createElement('div');
				conbox.className = "work_diary_contents";

				let alName = document.createElement('div');
				alName.textContent = "근무자";
				alName.className = "work_diary_contents_name";
				let alNamedat = document.createElement('div');
				nameTemp = log[i].abName;
				alNamedat.textContent = nameTemp;
				alNamedat.className = "work_diary_contents_data";
				//알바생 근무시간	
				let conbox2 = document.createElement('div');
				conbox2.className = "work_diary_contents";

				let workt = document.createElement('div');
				workt.textContent = "근무시간";
				workt.className = "work_diary_contents_name";
				let worktdat = document.createElement('div');
				timeTemp = log[i].workTime.substring(0, 2) + "시"
						+ log[i].workTime.substring(2, 4) + "분";
				worktdat.textContent = timeTemp;
				worktdat.className = "work_diary_contents_data";

				//특이사항란
				let notecon = document.createElement('div');
				notecon.textContent = "특이사항";

				notecon.className = "work_diary_contents_matters_test";

				let notedat = document.createElement('textarea');
				noteTemp = log[i].note;
				notedat.value = noteTemp;
				notedat.className = "work_diary_contents_matters_sahang";
				notedat.setAttribute('id', 'work_diary_sahang');
				
			//인수인계창 내부 박스 만들기	
				let moneycon = document.createElement('div');
				moneycon.className = "work_diary_strongbox_contents";
				moneycon.id ="moneyconTest1" + moneyConIndex;
				
				let moneycon2 = document.createElement('div');
				moneycon2.className = "work_diary_strongbox_contents";
				let moneyconName = document.createElement('div');
				moneycon2.id ="moneyconTest2" + moneyConIndex;
				
			// index가 하나 빠져서 하나 더 생성

				moneyconName.textContent = "인수 금고현황"
				moneyconName.className = "work_diary_contents_name";
				

				let moneyconName2 = document.createElement('div');
				moneyconName2.textContent = "인계 금고현황";
				moneyconName2.className = "work_diary_contents_name";
				
				
				let moneyrow = document.createElement('div');
				moneyrow.className = "strongbox_row";

				let moneyrow2 = document.createElement('div');
				moneyrow2.className = "strongbox_row";
				

				
				//금액 종류 인수현황
	
				let money = document.createElement('div');
				moneyTemp = log[i].moneyt;
				money.textContent = moneyTemp + "원";
				money.className = "work_diary_strongbox";

				//금액 숫자 인수 현황	
				let moneycount = document.createElement('input');
				moneycount.readOnly = true;
				moneycnt = log[i].mCount;
				moneycount.value = moneycnt;
				moneycount.className = "work_diary_strongbox_data";
				//금액종류 인계현황

				let money2 = document.createElement('div');
				moneyTemp2 = log[i].moneyt;
				money2.textContent = moneyTemp2 + "원";
				money2.className = "work_diary_strongbox";
				//금액 숫자 인계현황		
				let moneycount2 = document.createElement('input');

				moneycount2.setAttribute('name', 'strongbox_data_money');
				moneycount2.className = "work_diary_strongbox_data";
				
				moneycon.appendChild(moneyconName);
				moneycon2.appendChild(moneyconName2);
				moneycon.appendChild(moneyrow);
				moneycon2.appendChild(moneyrow2);
			
				moneyrow.appendChild(money);
				moneyrow.appendChild(moneycount);
				moneyrow2.appendChild(money2);
				moneyrow2.appendChild(moneycount2);
				
				conbox2.appendChild(workt);
				conbox2.appendChild(worktdat);
				conbox.appendChild(alName);
				conbox.appendChild(alNamedat);

				diary.appendChild(conbox);
				diary.appendChild(conbox2);

				diary.appendChild(moneycon);
				diary.appendChild(moneycon2);
		
				
				diary.appendChild(notecon);
				diary.appendChild(notedat);
				
				div.appendChild(workday);
				diary.appendChild(wrap);
				div.appendChild(diary);

			} else {
				
				
				//중복이 아닐시 입력되는창
				let moneyrow = document.createElement('div');
				moneyrow.className = "strongbox_row";

				let moneyrow2 = document.createElement('div');
				moneyrow2.className = "strongbox_row";
				

				
				//금액 종류 인수현황
	
				let money = document.createElement('div');
				moneyTemp = log[i].moneyt;
				money.textContent = moneyTemp + "원";
				money.className = "work_diary_strongbox";

				//금액 숫자 인수 현황	
				let moneycount = document.createElement('input');
				moneycount.readOnly = true;
				moneycnt = log[i].mCount;
				moneycount.value = moneycnt;
				moneycount.className = "work_diary_strongbox_data";
				//금액종류 인계현황

				let money2 = document.createElement('div');
				moneyTemp2 = log[i].moneyt;
				money2.textContent = moneyTemp2 + "원";
				money2.className = "work_diary_strongbox";
				//금액 숫자 인계현황		
				let moneycount2 = document.createElement('input');

				moneycount2.setAttribute('name', 'strongbox_data_money');
				moneycount2.className = "work_diary_strongbox_data";
				//금액이 보이는 화면
				
				let moneycon = document.getElementById("moneyconTest1" + moneyConIndex);
				let moneycon2 = document.getElementById("moneyconTest2" + moneyConIndex);
	
				
				moneycon.appendChild(moneyrow);
				moneycon2.appendChild(moneyrow2);

				moneyrow.appendChild(money);
				moneyrow.appendChild(moneycount);
				moneyrow2.appendChild(money2);
				moneyrow2.appendChild(moneycount2);
				

			}

			section.appendChild(div);

		}

	}
</script>



</html>