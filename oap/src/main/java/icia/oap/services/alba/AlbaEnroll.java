package icia.oap.services.alba;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonElement;

import icia.oap.beans.AlbaBean;
import icia.oap.beans.Money;
import icia.oap.mapper.AlbaMapper;

@Service
public class AlbaEnroll {

	@Autowired
	private AlbaMapper mapperAB;
	@Autowired
	private PlatformTransactionManager tran;
	@Autowired
	private Gson gson;

	ModelAndView mav = null;

	public AlbaEnroll() {

	}

	public ModelAndView entrance(AlbaBean aBean) {

		switch (aBean.getAction()) {

		//지원 완료
		case "albaApplyComplete" :
			mav = this.albaApplyCompleteCtl(aBean);
			break;
		
		case "StartMoney":
			mav = this.startMoney(aBean);   // 시제 작성 후 전송하기 버튼 클릭
			break;
		case "TestWork":
			mav = this.startWorkCtl(aBean);  // 시제정산 내역 보여주기
			break;
		case "LeaveWork":
			mav=this.startWorkCtl(aBean);
			break;
		case "CheckListForm" :
			mav=this.checkListForm(aBean);
			break;

		}

		return mav;
	}
	
	private ModelAndView checkListForm(AlbaBean aBean) {
		
		mav = new ModelAndView();
		
		System.out.println("넘어온 isCheck ?" + aBean.getIsCheck()[0] + "::" + aBean.getIsCheck()[1]+ "::" + aBean.getIsCheck()[2]+ "::" + aBean.getIsCheck()[3]);
		System.out.println("넘어온 tlNum ?" + aBean.getTlNum()[0] + "::" + aBean.getTlNum()[1] + "::" + aBean.getTlNum()[2] + "::" + aBean.getTlNum()[3]);
		System.out.println("넘어온 detail ?" + aBean.getAlbaWorkDetail()[0] + "::" + aBean.getAlbaWorkDetail()[1] + "::" + aBean.getAlbaWorkDetail()[2] + "::" + aBean.getAlbaWorkDetail()[3]);
		System.out.println("알바 >" + aBean.getAbCode() + "매장" + aBean.getShCode());
		
		for(int i = 0 ; i<aBean.getIsCheck().length ; i++) {
			
			aBean.setMtDetail(aBean.getAlbaWorkDetail()[i]);
			aBean.setTlNumber(Integer.parseInt(aBean.getTlNum()[i]));
			aBean.setTf(aBean.getIsCheck()[i]);
			
			if(this.insertCheckList(aBean)) {
				System.out.println("인서트성공");
			}
			
		}
		
		mav.addObject("msg", "창을 종료합니다");
		
		mav.setViewName("checkListForm");
		
		return mav;
	}

	private boolean insertCheckList(AlbaBean aBean) {
		return this.converToBoolean(mapperAB.insertCheckList(aBean));
	}

	// albaComplete 눌렀을떄.... 여기서체하나,.. 이알바가 이 매장에 이미 근무하고있는지.
	private ModelAndView albaApplyCompleteCtl(AlbaBean aBean) {
		mav = new ModelAndView();
		int insertState = 0;
		
		if(this.isAlreadyApplyInfo(aBean)) {
			insertState = -1;
		}else if(this.albaApplyComplete(aBean)) {
			insertState = 1;
		}
		
		mav.addObject("insertState", insertState);
		
		return mav;
	}
	
	private boolean isAlreadyApplyInfo(AlbaBean aBean) {
		return this.convertToBoolean(mapperAB.isAlreadyApplyInfo(aBean));
	}
	
	private boolean albaApplyComplete(AlbaBean aBean) {
		return this.convertToBoolean(mapperAB.albaApplyComplete(aBean));
	}
	
	private boolean convertToBoolean(int data) {
		return (data==1)?true:false;
	}

	private ModelAndView startWorkCtl(AlbaBean aBean) {

		ModelAndView mav = new ModelAndView();

		String number = "";

		String[] obName = { "sip", "osip", "baek", "obaek", "chun", "ochun", "man", "oman" };
		String[] mType = { "10", "50", "100", "500", "1000", "5000", "10000", "50000" };
		
		aBean.setRtType((aBean.getTCode().equals("start")) ? 2 : 1);

		System.out.println("what !!! > "  + aBean.getTCode());
		
		
		for (int index = 0; index < this.MoneyList(aBean).size(); index++) {

			if (this.MoneyList(aBean).get(0) == null) {

				mav.addObject("sip", "0");
				mav.addObject("osip", "0");
				mav.addObject("baek", "0");
				mav.addObject("obaek", "0");
				mav.addObject("chun", "0");
				mav.addObject("ochun", "0");
				mav.addObject("man", "0");
				mav.addObject("oman", "0");

			} else {
				for (int x = 0; x < mType.length; x++) {
					if (this.MoneyList(aBean).get(index).getMoney().equals(mType[x])) {
						mav.addObject(obName[x], this.MoneyList(aBean).get(index).getMCount());
						System.out.println(obName[x] + "::" + this.MoneyList(aBean).get(index).getMCount());
						number += x + ":";
					}
				}
			}
		}

		String[] num = number.split(":");
		
		for (int cnt = 0; cnt < obName.length; cnt++) {
			int count = 0;
			for (int t = 0; t < num.length; t++) {
				if (Integer.parseInt(num[t]) != cnt) {
					count++;
				}
			}
			if (count == num.length) {
				mav.addObject(obName[cnt], "0");
			}
		}

		mav.addObject("note", getNote());
		mav.addObject("tCode", aBean.getTCode());
		mav.addObject("abCode", aBean.getAbCode());
		mav.addObject("shCode", aBean.getShCode());

		mav.setViewName((aBean.getTCode().equals("start")) ?  "alternation" : "endAlternation");

		return mav;
	}

	private String getNote() {
		return this.mapperAB.maxNote();
	}

	private ArrayList<Money> MoneyList(AlbaBean aBean) {
		return this.mapperAB.getMoneyList(aBean);
	}

	private ModelAndView startMoney(AlbaBean aBean) {
		
		System.out.println("whatEnroll !!! > "  + aBean.getTCode());

		mav = new ModelAndView();

//		String[] mType = { "10", "50", "100", "500", "1000", "5000", "10000", "50000" };
//		String[] mCount = { aBean.getSip(), aBean.getOsip(), aBean.getBaek(), aBean.getObaek(), aBean.getChun(),
//				aBean.getOchun(), aBean.getMan(), aBean.getOman() };
//		TransactionStatus status = tran.getTransaction(new DefaultTransactionDefinition());
//		String message = "등록도중 오류가 발생하였습니다 . 다시시도 해주세요";
//
//		aBean.setAbCode("100000000");
//		aBean.setShCode("100000000");
//		aBean.setRtType((aBean.getTCode().equals("start")) ? 1 : 2);
//
//		// insert 는 시제테이블에만 특이사항은 그저 무슨일이 있엇는지 확인용
//
//		if (this.insertRt(aBean)) {
//
//			aBean.setMaxTime(this.getMaxTime(aBean));
//
//			for (int index = 0; index < mCount.length; index++) {
//
//				if (mCount[index] != null) {
//
//					aBean.setMType(mType[index]);
//					aBean.setMCount(Integer.parseInt(mCount[index]));
//
//					System.out.println("Type = " + aBean.getMType() + " Count = " + aBean.getMCount());
//
//					this.insertRd(aBean);
//
//				}
//
//			}
//
//			tran.commit(status);
//			message = "등록이 완료되었습니다";
//
//		}
//
//		mav.addObject("message", message);
		
		/* ----- 업무에대한 정보를 넘겨줘야할 리스트 -----*/
		
		System.out.println("알바생알아요" + aBean.getAbCode() + "::" + aBean.getShCode());
		
		gson.toJson(this.getCheckList(aBean));
		
		System.out.println(gson.toJson(this.getCheckList(aBean)));
		
		mav.addObject("checkListInfo", gson.toJson(this.getCheckList(aBean)));
		
		mav.addObject("abCode", aBean.getAbCode());
		mav.addObject("shCode", aBean.getShCode());

		mav.setViewName((aBean.getTCode().equals("start")) ?  "checkList" : "checkListForm");

		return mav;
	}

	private ArrayList<AlbaBean> getCheckList(AlbaBean aBean) {
		return mapperAB.getScheduleList(aBean);
	}

	private boolean insertRd(AlbaBean aBean) {
		return this.converToBoolean(mapperAB.insertRd(aBean));
	}

	private String getMaxTime(AlbaBean aBean) {
		return mapperAB.maxTime(aBean);
	}

	private boolean insertRt(AlbaBean aBean) {
		return this.converToBoolean(mapperAB.insertRt(aBean));
	}

	private boolean converToBoolean(int data) {

		return (data == 1) ? true : false;
	}

}
