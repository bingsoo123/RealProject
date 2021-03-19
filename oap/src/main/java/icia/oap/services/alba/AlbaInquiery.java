package icia.oap.services.alba;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonElement;

import icia.oap.beans.AlbaBean;
import icia.oap.mapper.AlbaMapper;
import icia.oap.utils.ProjectUtils;

@Service
public class AlbaInquiery {
	
	ModelAndView mav = null;
	
	@Autowired
	private AlbaMapper mapperW;
	@Autowired
	private Gson gson;
	@Autowired
	private ProjectUtils pu;
	
	public AlbaInquiery() {
		
	}
	

	
	public ModelAndView entrance(AlbaBean aBean) {
		
//		try {
//			mav = this.SessionCheck(aBean);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
		
		switch(aBean.getAction()) {
		
		case "AlbaList" :
			mav = this.albaListCtl(aBean);
			break;
		case "payCheck" :
			mav = this.payCheck(aBean);
			break;
		case "AlbaTaskList":
			mav = this.albaTaskList(aBean);
			break;
		case "AlbaTaskListSelect":
			mav = this.albaTaskListSelect(aBean);
			break;
		case "albaInclueShopInfo" : 
			mav = this.albaInclueShopInfoCtl(aBean);
			break;	
		// 내가 지원한 매장, 계좌 수정하려고 내 정보 띄워주는것. ss 테이블에 있는 계좌 추가.
		case "albaApplyShopMyInfo":
			mav = this.albaApplyShopMyInfoCtl(aBean);
			break;
		
		// 알바 지원 . 내가 지원한 매장 정보들
		case "albaApplyMyShopInquiry":
			mav = this.albaApplyMyShopInquiryCtl(aBean);
			break;
		
		// 선택했을때 내가 이미 지원한 매장이냐? 아니면 매장 상세정보 띄워주기
		case "albaApplyShopDetailInfo":
			mav = this.albaApplyShopDetailInfoCtl(aBean);
			break;
		// 상세 정보 보여주고 내가 지원할거면 내 정보 (계좌 선택할수있는 창)
		case "albaApplyMyInfo":
			mav = this.albaApplyMyInfoCtl(aBean);
			break;
		
		case "albaApply":
			mav = this.albaApplyCtl(aBean);
			break;
		// 알바 지원 검색
		case "albaApplySearch":
			mav = this.albaApplySearchCtl(aBean);
			break;	
		//
		}
		return mav;
	}
	
	// 알바지원, 계좌 수정하려고..
	
	private ModelAndView albaApplyShopMyInfoCtl(AlbaBean aBean) {
		mav = new ModelAndView();
		String shopInfo = gson.toJson(this.albaApplyShopMyInfo(aBean));
		mav.addObject("albaApplyMyInfo", shopInfo);
		return mav;
	}
	
	public ArrayList<AlbaBean> albaApplyShopMyInfo(AlbaBean aBean){
		return mapperW.albaApplyShopMyInfo(aBean);
	}
	
	
	
	// 내가 지원한 매장 리스트
	private ModelAndView albaApplyMyShopInquiryCtl(AlbaBean aBean) {
		mav = new ModelAndView();
		String shopInfo = gson.toJson(this.albaApplyMyShopInquiry(aBean));
		mav.addObject("applyMyShopInfo", shopInfo);
		
		return mav;
	}
	
	public ArrayList<AlbaBean> albaApplyMyShopInquiry(AlbaBean aBean){
		return mapperW.albaApplyMyShopInquiry(aBean);
	}
	
	// 내가 지원할 매장 눌렀을때 이미 지원했으면 뜨고, 아니면 그 매장 상세 정보
	private ModelAndView albaApplyShopDetailInfoCtl(AlbaBean aBean) {
		mav = new ModelAndView();
		System.out.println(aBean.getAbCode());
		String albaShopDetailInfo = "0";
		int cnt = this.albaApplyAlreadyCheck(aBean);
		System.out.println("cnt :: " + cnt);
		// getApplyState = albaApplyShopInfo // 처음 전체 리스트
        //                 myShopInquiry // 내가 지원한 알바 매장 리스트 디테일
		String applyState = aBean.getApplyState();
		System.out.println("applyState::" + applyState);
		if(cnt != 0 && applyState.equals("albaApplyShopInfo")) {
			System.out.println("이미 지원한 매장 임.");
			albaShopDetailInfo = gson.toJson("alreayApplyClose");
		}else {
			AlbaBean ab = this.albaApplyShopDetailInfo(aBean);
			ab.setAbCode(aBean.getAbCode());
			ab.setApplyState(applyState);
			albaShopDetailInfo = gson.toJson(ab);
			System.out.println("albaShopDetailInfo" + albaShopDetailInfo);
		}
		mav.addObject("albaShopDetailInfo", albaShopDetailInfo);
		mav.setViewName("albaApply");
		return mav;
	}
	
	public int albaApplyAlreadyCheck(AlbaBean aBean) {
		return mapperW.albaApplyAlreadyCheck(aBean);
	}
	
	private AlbaBean albaApplyShopDetailInfo(AlbaBean aBean) {
		return mapperW.albaApplyShopDetailInfo(aBean);
	}
	
	// 매장에 지원한 
	
	
	private ModelAndView albaApplyMyInfoCtl(AlbaBean aBean) {
		mav = new ModelAndView();
		
		ArrayList<AlbaBean> ab = this.albaApplyMyInfo(aBean);
		ab.get(0).setShCode(aBean.getShCode());
		String albaMyInfo = gson.toJson(ab);
		mav.addObject("albaMyInfo", albaMyInfo);
		return mav;
	}
	
	private ArrayList<AlbaBean> albaApplyMyInfo(AlbaBean aBean) {
		return mapperW.albaApplyMyInfo(aBean);
	}
	
	// 매장 지원 매장 리스트
	private ModelAndView albaApplyCtl(AlbaBean aBean) {
		mav = new ModelAndView();
		
		String shopInfo = gson.toJson(this.albaApplyShopInfo(aBean));
		
		mav.addObject("albaApplyShopInfo", shopInfo);
		
		return mav;
	}
	
	private ArrayList<AlbaBean> albaApplyShopInfo(AlbaBean aBean) {
		return mapperW.albaApplyShopInfo(aBean);
	}
	
	private ModelAndView albaInclueShopInfoCtl(AlbaBean aBean) {
		mav = new ModelAndView();
		ArrayList<AlbaBean> aList;
		int selectState = -1;
			aList = this.albaInclueShopInfo(aBean);
			// 알바생이 매장을 갖고있을때.
			System.out.println("aList.isEmpty()::" + aList.isEmpty());
			
			if(aList.isEmpty()) { // 빈값이면 나의 정보만 뜨게 해야하니까.
				aList = this.albaMyInfo(aBean);
				selectState = 0;
				
			}else {
				selectState = 1;
			}
		System.out.println("albaInclueShopInfo결과 ::" + aList );
		System.out.println("selectState 0이면 나의정보, 1이면 매장정보가 있다는 뜻:: " + selectState);
		String jsonData = gson.toJson(aList) + "_" + selectState;
		mav.addObject("albaInclueShopInfo", jsonData);
		return mav;
		
	}
	private ArrayList<AlbaBean> albaInclueShopInfo(AlbaBean aBean) {
		return mapperW.albaInclueShopInfo(aBean);
	}
	private ArrayList<AlbaBean> albaMyInfo(AlbaBean aBean) {
		return mapperW.albaMyInfo(aBean);
	}
	
	// 알바지원 검색
	private ModelAndView albaApplySearchCtl(AlbaBean aBean) {
		mav = new ModelAndView();
		
		String shopInfo = "";
		System.out.println("kekWord = " + aBean.getKeyWord() + "cate = " + aBean.getCategory());
		if(aBean.getCategory().equals("매장명")) {
			shopInfo = gson.toJson(this.albaApplyShopNameSearch(aBean));	
		}else if(aBean.getCategory().equals("주소")) {
			shopInfo = gson.toJson(this.albaApplyShopAddressSearch(aBean));	
		}
		
		mav.addObject("albaApplyShopInfo", shopInfo);
		
		
		return mav;
	}
	// 이거 카테고리에 따라서 메서드가 다름가 다름. 분기 나누기.
	public ArrayList<AlbaBean> albaApplyShopAddressSearch(AlbaBean aBean){
		return mapperW.albaApplyShopAddressSearch(aBean);
	}
	
	public ArrayList<AlbaBean> albaApplyShopNameSearch(AlbaBean aBean){
		return mapperW.albaApplyShopNameSearch(aBean);
	}

	private ModelAndView albaTaskList(AlbaBean aBean) {
		mav = new ModelAndView();
		
		/* TaskWork Info & Convert to JSON */
		
		// 전체 업무리스트 조회
		String albaTaskList = gson.toJson(this.getAlbaTaskListSelect(aBean));
		System.out.println(albaTaskList);
		mav.addObject("albaTaskList", albaTaskList);
		
		// 알바가 가진 매장 전체 조회
		String albaShopList = gson.toJson(this.getAlbaShopList(aBean));
		System.out.println(albaShopList);
		mav.addObject("albaShopList", albaShopList);
		
		
		// 알바가 가진 매장 전체 조회
		String albaTaskListCount = gson.toJson(this.getAlbaTaskListSelectCount(aBean));
		System.out.println(albaTaskListCount);
		mav.addObject("albaTaskListCount", albaTaskListCount);
		
		
		mav.setViewName("albaTaskList");
		return mav;
	}

	
	private ModelAndView albaTaskListSelect(AlbaBean aBean) {
		mav = new ModelAndView();
		
		// 선택한 매장 업무리스트 조회
		String albaTaskListSelect = gson.toJson(this.getAlbaTaskListSelect(aBean));
		System.out.println(albaTaskListSelect);

		
		
		// 선택한 매장의 업무 개수 조회
		String albaTaskListCount = gson.toJson(this.getAlbaTaskListSelectCount(aBean));
		System.out.println(albaTaskListCount);
		albaTaskListSelect+= "_" + albaTaskListCount;
		mav.addObject("albaTaskListSelect", albaTaskListSelect);
		
		return mav;
	}
	
	private ModelAndView payCheck(AlbaBean aBean) {
		
		mav = new ModelAndView();
		
		System.out.println("payCheck 도착");
		
		String pay = gson.toJson(this.getPayCheck(aBean));
		
		System.out.println(pay);
		
		mav.addObject("pay", pay);
		mav.setViewName("payCheck");
		
		return mav;
	}

	private ArrayList<AlbaBean> getPayCheck(AlbaBean aBean) {
		return mapperW.getPayCheck(aBean);
	}

	private ModelAndView albaListCtl(AlbaBean aBean) {
		
		mav = new ModelAndView();
		
		ArrayList<AlbaBean> list = new ArrayList<AlbaBean>();
		
		aBean.setAbCode("100000000");
		
		String myAlbaList = gson.toJson(this.myAlbaZone(aBean));
		
		System.out.println(myAlbaList);
		
		for(int index=0 ; index < this.myAlbaZone(aBean).size() ; index++) {
			
			aBean.setShCode(this.myAlbaZone(aBean).get(index).getShCode());
			
			// 최대값 가져오는거 진입 해서 가져온뒤 가져온값을 따로 저장
			
			// 가져온값을 쪼개서 보냄
			list.add(aBean);
		}
		
		
		
		mav.addObject("myAlbaList", myAlbaList);
		mav.setViewName("albaList");
		
		return mav;
	}

	private ArrayList<AlbaBean> myAlbaZone(AlbaBean aBean) {
		return mapperW.myAlbaZone(aBean);
	}
			
	
	private ArrayList<AlbaBean> getAlbaShopList(AlbaBean aBean) {
		
		return mapperW.getAlbaShopList(aBean);
	}
	
	private ArrayList<AlbaBean> getAlbaTaskListSelect(AlbaBean aBean) {
		
		return mapperW.getAlbaTaskListSelect(aBean);
	}
	
	
	private int getAlbaTaskListSelectCount(AlbaBean aBean) {
		
		return mapperW.getAlbaTaskListSelectCount(aBean);
	}

}
