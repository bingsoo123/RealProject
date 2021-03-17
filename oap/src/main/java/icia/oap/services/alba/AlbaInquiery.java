package icia.oap.services.alba;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonElement;

import icia.oap.beans.AlbaBean;
import icia.oap.mapper.AlbaMapper;

@Service
public class AlbaInquiery {
	
	ModelAndView mav = null;
	
	@Autowired
	private AlbaMapper mapperW;
	@Autowired
	private Gson gson;
	
	public AlbaInquiery() {
		
	}
	
	public ModelAndView entrance(AlbaBean aBean) {
		
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
			
		}
		
		
		return mav;
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
		
		/* TaskWork Info & Convert to JSON */
		
		// 선택한 매장 업무리스트 조회
		String albaTaskListSelect = gson.toJson(this.getAlbaTaskListSelect(aBean));
		System.out.println(albaTaskListSelect);

		
		
		// 선택한 매장의 업무 개수 조회
		String albaTaskListCount = gson.toJson(this.getAlbaTaskListSelectCount(aBean));
		System.out.println(albaTaskListCount);
		// mav.addObject("albaTaskListSelectCount", albaTaskListCount);
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
