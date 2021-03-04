package icia.oap.services.management;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.web.servlet.ModelAndView;

import icia.oap.beans.ManageBean;
import icia.oap.mapper.ManageMapper;

@Service
public class ManagementEnroll {
	
	@Autowired
	private ManageMapper mapperM;
	@Autowired
	private PlatformTransactionManager tran;
	
	ModelAndView mav = null;
	
	public ManagementEnroll() {
		
		
	}
	
	public ModelAndView entrance(ManageBean mBean) {
		
		
		switch(mBean.getSCode()) {
		case "addWorkZone":
			mav = this.addWorkZoneCtl(mBean);
		break;
		
		}
		
		return mav;
	}
	
	// 매장추가하기
	private ModelAndView addWorkZoneCtl(ManageBean mBean) {
	
		ModelAndView mav = new ModelAndView();
	
		mav.addObject("Road", mBean.getRoad());
		mav.addObject("detail", mBean.getDetail());

		mav.setViewName("addWorkZone");
		return mav;
	}
	
	private ModelAndView workAddCtl(ManageBean mBean) {
		
		mav = new ModelAndView();
		
		return mav;
	}
	
	// 업무추가하기 >>>>
	private boolean workAdd(ManageBean mBean) {
		return this.convertToBoolean(mapperM.workAdd(mBean));
	}
	
	private boolean convertToBoolean(int data) {
		return (data==1)?true : false;
	}
	
	private ModelAndView addWorkCtl(ManageBean mBean) {
		
		mav = new ModelAndView();
		
		return mav;
	}
	// 업무추가 입력후  추가하기 버튼 
	private boolean addWork(ManageBean mBean) {
		
		return this.convertToBoolean(mapperM.addWork(mBean));
	}
	
	private ModelAndView addScheduleCtl(ManageBean mBean) {
		
		mav = new ModelAndView();
		
		return mav;
	}
	
	private boolean addSchedule(ManageBean mBean) {
		return this.convertToBoolean(mapperM.addSchedule(mBean));
	}
	
}













