package icia.oap.services.management;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.web.servlet.ModelAndView;

import icia.oap.beans.ManageBean;
import icia.oap.mapper.ManageMapper;

@Service
public class ManagementModify {

	ModelAndView mav = null;
	
	@Autowired
	private ManageMapper mapperM;
	@Autowired
	private PlatformTransactionManager tran;
	
	public ManagementModify() {
		
	}
	

	public ModelAndView entrance(ManageBean mBean) {
		
		
		return mav;
	}
	
	
	private ModelAndView changeCtl(ManageBean mBean) {
		
		mav = new ModelAndView();
		
		return mav;
	}
	
	private boolean change(ManageBean mBean) {
		return this.convertToBoolean(mapperM.change(mBean));
	}


	private boolean convertToBoolean(int data) {
		return (data==1)?true:false;
	}
	
	private ModelAndView dropCtl(ManageBean mBean) {
		
		mav = new ModelAndView();
		
		return mav;
	}
	
	private boolean drop(ManageBean mBean) {
		return this.convertToBoolean(mapperM.drop(mBean));
	}
	
	private ModelAndView deleteScheduleCtl(ManageBean mBean) {
		
		mav = new ModelAndView();
		
		return mav;
	}
	
	private boolean deleteSchedule(ManageBean mBean) {
		return this.convertToBoolean(mapperM.deleteSchedule(mBean));
	}
	
}










