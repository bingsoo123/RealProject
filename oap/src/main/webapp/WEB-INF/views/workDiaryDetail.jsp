<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/workDiary.css" rel="stylesheet">
</head>
<body onLoad="init()">
	<section id="logZone"></section>

</body>
<script>
	function init() {
		
		let not = JSON.parse('${note}');
		let log = JSON.parse('${insu}');
		let log2 = JSON.parse('${ingye}');
		
		alert(not);
		alert(log);
		alert(log2);
		
		let section = document.getElementById("logZone");
		
		let div = document.createElement('div');
		div.className = "test999";

		let title = document.createElement('h1');
		title.textContent = "근무일지";

		let wrap = document.createElement('div');
		wrap.className = "logZone";

		div.appendChild(title);
		for (i = 0; i < not.length; i++) {
		 		let a = 0 +(i*8);
			 	let b = 1 +(i*8);
			 	let c = 2 +(i*8);
			 	let d = 3 +(i*8);
			 	let e = 4 +(i*8);
			 	let f = 5 +(i*8);
			 	let g = 6 +(i*8);
			 	let h = 7 +(i*8);	
			//인수파트
			//데이터 담을 틀
			let diary = document.createElement('div');
			diary.className = "work_diary";
			
			//근무일자	
			let workday = document.createElement('div');
			workday.className = "work_date_contents";
			workday.style.width = "200px";
			workday.textContent =not[i].wlTime.substring(0, 10);

			//알바생이름	
			let conbox = document.createElement('div');
			conbox.className = "work_diary_contents";

			let alName = document.createElement('div');
			alName.textContent = "근무자";
			alName.className = "work_diary_contents_name";
			let alNamedat = document.createElement('div');
			alNamedat.textContent =not[i].abName;
			alNamedat.className = "work_diary_contents_data";
			
			
			//알바생 근무시간	
			let conbox2 = document.createElement('div');
			conbox2.className = "work_diary_contents";

			let workt = document.createElement('div');
			workt.textContent = "근무시간";
			workt.className = "work_diary_contents_name";
			let worktdat = document.createElement('div');
			worktdat.textContent = not[i].workTime.substring(0, 2) + "시"
			+ not[i].workTime.substring(2, 4) + "분";
			worktdat.className = "work_diary_contents_data";
			
			//인수인계창 내부 박스 만들기	
			let moneycon = document.createElement('div');
			moneycon.className = "work_diary_strongbox_contents";
			
			let moneyconName = document.createElement('div');	
			moneyconName.textContent = "인수 금고현황";
			moneyconName.className = "work_diary_contents_name";
			
			let moneycon2 = document.createElement('div');
			moneycon2.className = "work_diary_strongbox_contents";
			
			let moneyconName2 = document.createElement('div');
			moneyconName2.textContent = "인계 금고현황";
			moneyconName2.className = "work_diary_contents_name";

				//인수 인계 데이터 창
				let moneyrow = document.createElement('div');
				moneyrow.className = "strongbox_row";
				
				let moneyrow2 = document.createElement('div');
				moneyrow2.className = "strongbox_row";
				
				let moneyrow3 = document.createElement('div');
				moneyrow3.className = "strongbox_row";
				
				let moneyrow4 = document.createElement('div');
				moneyrow4.className = "strongbox_row";
				
				let moneyrow5 = document.createElement('div');
				moneyrow5.className = "strongbox_row";
				
				let moneyrow6 = document.createElement('div');
				moneyrow6.className = "strongbox_row";
				
				let moneyrow7 = document.createElement('div');
				moneyrow7.className = "strongbox_row";
				
				let moneyrow8 = document.createElement('div');
				moneyrow8.className = "strongbox_row";
				
				
				let moneyrow9 = document.createElement('div');
				moneyrow9.className = "strongbox_row";
				
				let moneyrow10 = document.createElement('div');
				moneyrow10.className = "strongbox_row";
				
				let moneyrow11 = document.createElement('div');
				moneyrow11.className = "strongbox_row";
				
				let moneyrow12 = document.createElement('div');
				moneyrow12.className = "strongbox_row";
				
				let moneyrow13 = document.createElement('div');
				moneyrow13.className = "strongbox_row";
				
				let moneyrow14 = document.createElement('div');
				moneyrow14.className = "strongbox_row";
				
				let moneyrow15 = document.createElement('div');
				moneyrow15.className = "strongbox_row";
				
				let moneyrow16 = document.createElement('div');
				moneyrow16.className = "strongbox_row";
				
				
				let moneyTypeBox1 = document.createElement('div');
				moneyTypeBox1.className= "work_diary_strongbox";
				let moneyType = document.createTextNode(log[0].moneyt+"원");
				
				let moneyTypeBox2 = document.createElement('div');
				moneyTypeBox2.className= "work_diary_strongbox";
				let moneyType2 = document.createTextNode(log[1].moneyt+"원");
				
				let moneyTypeBox3 = document.createElement('div');
				moneyTypeBox3.className= "work_diary_strongbox";
				let moneyType3 = document.createTextNode(log[2].moneyt+"원");
				
				let moneyTypeBox4 = document.createElement('div');
				moneyTypeBox4.className= "work_diary_strongbox";
				let moneyType4 = document.createTextNode(log[3].moneyt+"원");
				
				let moneyTypeBox5 = document.createElement('div');
				moneyTypeBox5.className= "work_diary_strongbox";
				let moneyType5 = document.createTextNode(log[4].moneyt+"원");
				
				let moneyTypeBox6 = document.createElement('div');
				moneyTypeBox6.className= "work_diary_strongbox";
				let moneyType6 = document.createTextNode(log[5].moneyt+"원");
				
				let moneyTypeBox7 = document.createElement('div');
				moneyTypeBox7.className= "work_diary_strongbox";
				let moneyType7 = document.createTextNode(log[6].moneyt+"원");
				
				let moneyTypeBox8 = document.createElement('div');
				moneyTypeBox8.className= "work_diary_strongbox";
				let moneyType8 = document.createTextNode(log[7].moneyt+"원");
				
				

				let moneyTypeBox9 = document.createElement('div');
				moneyTypeBox9.className= "work_diary_strongbox";
				let moneyType9 = document.createTextNode(log2[0].moneyt+"원");
				
				let moneyTypeBox10 = document.createElement('div');
				moneyTypeBox10.className= "work_diary_strongbox";
				let moneyType10 = document.createTextNode(log2[1].moneyt+"원");
				
				let moneyTypeBox11 = document.createElement('div');
				moneyTypeBox11.className= "work_diary_strongbox";
				let moneyType11 = document.createTextNode(log2[2].moneyt+"원");
				
				let moneyTypeBox12 = document.createElement('div');
				moneyTypeBox12.className= "work_diary_strongbox";
				let moneyType12 = document.createTextNode(log2[3].moneyt+"원");
				
				let moneyTypeBox13 = document.createElement('div');
				moneyTypeBox13.className= "work_diary_strongbox";
				let moneyType13 = document.createTextNode(log2[4].moneyt+"원");
				
				let moneyTypeBox14 = document.createElement('div');
				moneyTypeBox14.className= "work_diary_strongbox";
				let moneyType14 = document.createTextNode(log2[5].moneyt+"원");
				
				let moneyTypeBox15 = document.createElement('div');
				moneyTypeBox15.className= "work_diary_strongbox";
				let moneyType15 = document.createTextNode(log2[6].moneyt+"원");
				
				let moneyTypeBox16 = document.createElement('div');
				moneyTypeBox16.className= "work_diary_strongbox";
				let moneyType16 = document.createTextNode(log2[7].moneyt+"원");
				
				
			
				let moneyCountBox = document.createElement('input');
				moneyCountBox.className= "work_diary_strongbox_data";
				moneyCountBox.readOnly = true;
				moneyCountBox.value = log[a].mCount;
		
				let moneyCountBox2 = document.createElement('input');
				moneyCountBox2.className= "work_diary_strongbox_data";
				moneyCountBox2.readOnly = true;
				moneyCountBox2.value = log[b].mCount;
		
				let moneyCountBox3 = document.createElement('input');
				moneyCountBox3.className= "work_diary_strongbox_data";
				moneyCountBox3.readOnly = true;
				moneyCountBox3.value = log[c].mCount;
		
				let moneyCountBox4 = document.createElement('input');
				moneyCountBox4.className= "work_diary_strongbox_data";
				moneyCountBox4.readOnly = true;
				moneyCountBox4.value = log[d].mCount;
		
				let moneyCountBox5 = document.createElement('input');
				moneyCountBox5.className= "work_diary_strongbox_data";
				moneyCountBox5.readOnly = true;
				moneyCountBox5.value = log[e].mCount;
		
				let moneyCountBox6 = document.createElement('input');
				moneyCountBox6.className= "work_diary_strongbox_data";
				moneyCountBox6.readOnly = true;
				moneyCountBox6.value = log[f].mCount;
		
				let moneyCountBox7 = document.createElement('input');
				moneyCountBox7.className= "work_diary_strongbox_data";
				moneyCountBox7.readOnly = true;
				moneyCountBox7.value = log[g].mCount;
		
				let moneyCountBox8 = document.createElement('input');
				moneyCountBox8.className= "work_diary_strongbox_data";
				moneyCountBox8.readOnly = true;
				moneyCountBox8.value = log[h].mCount;
				
				//인계 파트
				
				let moneyCountBox9 = document.createElement('input');
				moneyCountBox9.className= "work_diary_strongbox_data";
				moneyCountBox9.readOnly = true;
				moneyCountBox9.value = log2[a].mCount;
		
				
				let moneyCountBox10 = document.createElement('input');
				moneyCountBox10.className= "work_diary_strongbox_data";
				moneyCountBox10.readOnly = true;
				moneyCountBox10.value = log2[b].mCount;
		
				let moneyCountBox11 = document.createElement('input');
				moneyCountBox11.className= "work_diary_strongbox_data";
				moneyCountBox11.readOnly = true;
				moneyCountBox11.value = log2[c].mCount;
		
				let moneyCountBox12 = document.createElement('input');
				moneyCountBox12.className= "work_diary_strongbox_data";
				moneyCountBox12.readOnly = true;
				moneyCountBox12.value = log2[d].mCount;
		
				let moneyCountBox13 = document.createElement('input');
				moneyCountBox13.className= "work_diary_strongbox_data";
				moneyCountBox13.readOnly = true;
				moneyCountBox13.value = log2[e].mCount;
		
				let moneyCountBox14 = document.createElement('input');
				moneyCountBox14.className= "work_diary_strongbox_data";
				moneyCountBox14.readOnly = true;
				moneyCountBox14.value = log2[f].mCount;
		
				let moneyCountBox15 = document.createElement('input');
				moneyCountBox15.className= "work_diary_strongbox_data";
				moneyCountBox15.readOnly = true;
				moneyCountBox15.value = log2[g].mCount;
		
				let moneyCountBox16 = document.createElement('input');
				moneyCountBox16.className= "work_diary_strongbox_data";
				moneyCountBox16.readOnly = true;
				moneyCountBox16.value = log2[h].mCount;

				moneyrow.appendChild(moneyTypeBox1);
				moneyrow.appendChild(moneyCountBox);
				moneyrow2.appendChild(moneyTypeBox2);
				moneyrow2.appendChild(moneyCountBox2);
				moneyrow3.appendChild(moneyTypeBox3);
				moneyrow3.appendChild(moneyCountBox3);
				moneyrow4.appendChild(moneyTypeBox4);
				moneyrow4.appendChild(moneyCountBox4);
				moneyrow5.appendChild(moneyTypeBox5);
				moneyrow5.appendChild(moneyCountBox5);
				moneyrow6.appendChild(moneyTypeBox6);
				moneyrow6.appendChild(moneyCountBox6);
				moneyrow7.appendChild(moneyTypeBox7);
				moneyrow7.appendChild(moneyCountBox7);
				moneyrow8.appendChild(moneyTypeBox8);
				moneyrow8.appendChild(moneyCountBox8);
			
				moneyrow9.appendChild(moneyTypeBox9);
				moneyrow9.appendChild(moneyCountBox9);
				moneyrow10.appendChild(moneyTypeBox10);
				moneyrow10.appendChild(moneyCountBox10);
				moneyrow11.appendChild(moneyTypeBox11);
				moneyrow11.appendChild(moneyCountBox11);
				moneyrow12.appendChild(moneyTypeBox12);
				moneyrow12.appendChild(moneyCountBox12);
				moneyrow13.appendChild(moneyTypeBox13);
				moneyrow13.appendChild(moneyCountBox13);
				moneyrow14.appendChild(moneyTypeBox14);
				moneyrow14.appendChild(moneyCountBox14);
				moneyrow15.appendChild(moneyTypeBox15);
				moneyrow15.appendChild(moneyCountBox15);
				moneyrow16.appendChild(moneyTypeBox16);
				moneyrow16.appendChild(moneyCountBox16);
				
				moneyTypeBox1.appendChild(moneyType);
				moneyTypeBox2.appendChild(moneyType2);
				moneyTypeBox3.appendChild(moneyType3);
				moneyTypeBox4.appendChild(moneyType4);
				moneyTypeBox5.appendChild(moneyType5);
				moneyTypeBox6.appendChild(moneyType6);
				moneyTypeBox7.appendChild(moneyType7);
				moneyTypeBox8.appendChild(moneyType8);
				
				moneyTypeBox9.appendChild(moneyType9);
				moneyTypeBox10.appendChild(moneyType10);
				moneyTypeBox11.appendChild(moneyType11);
				moneyTypeBox12.appendChild(moneyType12);
				moneyTypeBox13.appendChild(moneyType13);
				moneyTypeBox14.appendChild(moneyType14);
				moneyTypeBox15.appendChild(moneyType15);
				moneyTypeBox16.appendChild(moneyType16);
			
			//특이사항란
			let notecon = document.createElement('div');
			notecon.textContent = "특이사항";

			notecon.className = "work_diary_contents_matters_test";

			let notedat = document.createElement('textarea');
			notedat.value = not[i].note;
			notedat.className = "work_diary_contents_matters_sahang";
			notedat.setAttribute('id', 'work_diary_sahang');
			
			conbox.appendChild(alName);
			conbox.appendChild(alNamedat);
			conbox2.appendChild(workt);
			conbox2.appendChild(worktdat);
			
			moneycon.appendChild(moneyconName);
			moneycon2.appendChild(moneyconName2);
			moneycon.appendChild(moneyrow);
			moneycon.appendChild(moneyrow2);
			moneycon.appendChild(moneyrow3);
			moneycon.appendChild(moneyrow4);
			moneycon.appendChild(moneyrow5);
			moneycon.appendChild(moneyrow6);
			moneycon.appendChild(moneyrow7);
			moneycon.appendChild(moneyrow8);
			
			moneycon2.appendChild(moneyrow9);
			moneycon2.appendChild(moneyrow10);
			moneycon2.appendChild(moneyrow11);
			moneycon2.appendChild(moneyrow12);
			moneycon2.appendChild(moneyrow13);
			moneycon2.appendChild(moneyrow14);
			moneycon2.appendChild(moneyrow15);
			moneycon2.appendChild(moneyrow16);
			
			diary.appendChild(conbox);
			diary.appendChild(conbox2);
			
			diary.appendChild(notecon);
			diary.appendChild(notedat);
			diary.appendChild(conbox);
			diary.appendChild(conbox2);

			diary.appendChild(moneycon);
			diary.appendChild(moneycon2);
			
			diary.appendChild(notecon);
			diary.appendChild(notedat);
			
			div.appendChild(workday);
			diary.appendChild(wrap);
			div.appendChild(diary);		
		}
			section.appendChild(div);
	
	}
	
</script>



</html>