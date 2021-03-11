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
		
		}
		
		
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
	
		

}
