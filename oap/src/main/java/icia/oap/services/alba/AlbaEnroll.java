package icia.oap.services.alba;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.web.servlet.ModelAndView;

import icia.oap.beans.AlbaBean;
import icia.oap.beans.Money;
import icia.oap.mapper.AlbaMapper;

@Service
public class AlbaEnroll {

	@Autowired
	private AlbaMapper mapperAB;
	@Autowired
	private PlatformTransactionManager tran;

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

		}

		return mav;
	}
	
	private ModelAndView albaApplyCompleteCtl(AlbaBean aBean) {
		mav = new ModelAndView();
		
		int insertState = 0;
		
		if(this.albaApplyComplete(aBean)) {
			insertState = 1;
		}
		
		mav.addObject("insertState", insertState);
		
		return mav;
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

		mav.setViewName((aBean.getTCode().equals("start")) ?  "checkList" : "checkListForm");

		return mav;
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
