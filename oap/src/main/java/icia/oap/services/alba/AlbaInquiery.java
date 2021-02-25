package icia.oap.services.alba;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import icia.oap.beans.AlbaBean;
import icia.oap.mapper.AlbaMapper;

@Service
public class AlbaInquiery {
	
	ModelAndView mav = null;
	
	@Autowired
	private AlbaMapper mapperW;
	
	public AlbaInquiery() {
		
	}
	
	public ModelAndView entrance(AlbaBean aBean) {
		
		
		return mav;
	}
	
	

}
