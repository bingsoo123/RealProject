package icia.oap.services.alba;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import icia.oap.beans.AlbaBean;
import icia.oap.mapper.AlbaMapper;

@Service
public class AlbaModify {

	ModelAndView mav = null;

	@Autowired
	private AlbaMapper mapperW;
	@Autowired
	private Gson gson;

	public AlbaModify() {

	}

	public ModelAndView entrance(AlbaBean aBean) {

		switch (aBean.getAction()) {

		case "albaApplyDelete":
			mav = this.albaApplyDeleteCtl(aBean);
			break;
		case "albaApplyMyAccountUpdate":
			mav = this.albaApplyMyAccountUpdateCtl(aBean);
			break;
		}

		return mav;
	}
	
	private ModelAndView albaApplyMyAccountUpdateCtl(AlbaBean aBean) {
		mav = new ModelAndView();
		String albaApplyState = "";
		if (this.albaApplyMyAccountUpdate(aBean)) {
			albaApplyState ="updateComplete";
		}else {
			albaApplyState ="updateFail";
		}
		String albaApplyUpdate = gson.toJson(albaApplyState);
		mav.addObject("albaApplyUpdate", albaApplyUpdate);
		return mav;
	}
	
	public boolean albaApplyMyAccountUpdate(AlbaBean aBean) {
		return convertToBoolean(mapperW.albaApplyMyAccountUpdate(aBean));
	}
	

	private ModelAndView albaApplyDeleteCtl(AlbaBean aBean) {
		mav = new ModelAndView();
		String albaApplyState = "";
		if (this.albaApplyDelete(aBean)) {
			albaApplyState ="deleteComplete";
		}else {
			albaApplyState ="deleteFail";
		}
		String albaApplyDelete = gson.toJson(albaApplyState);
		mav.addObject("albaApplyDelete", albaApplyDelete);
		return mav;
	}

	public boolean albaApplyDelete(AlbaBean aBean) {
		return convertToBoolean(mapperW.albaApplyDelete(aBean));
	}

	private boolean convertToBoolean(int data) {
		return (data == 1) ? true : false;
	}

}
