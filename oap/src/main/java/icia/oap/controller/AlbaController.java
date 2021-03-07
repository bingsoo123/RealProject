package icia.oap.controller;


import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import icia.oap.beans.AlbaBean;
import icia.oap.beans.AuthBean;
import icia.oap.services.alba.AlbaEnroll;
import icia.oap.services.alba.AlbaInquiery;
import icia.oap.services.alba.AlbaModify;


@Controller
public class AlbaController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private AlbaEnroll aEnroll;
	@Autowired
	private AlbaModify aModify;
	@Autowired
	private AlbaInquiery aInquiery;
	
	ModelAndView mav = null;
	
	/* ---------------------------------- 알바생 - 조회 ---------------------------------- */
	
	// 알바생이 일하고잇는 알바 ( 매장 ) 리스트 조회
	@RequestMapping(value = "/AlbaList", method = RequestMethod.GET)
	public ModelAndView albaList(@ModelAttribute AlbaBean aBean) {
		return aInquiery.entrance(aBean);
	}
	
	// 알바생 급여 조화
	@RequestMapping(value = "/payCheck", method = RequestMethod.GET)
	public ModelAndView payCheck(@ModelAttribute AlbaBean aBean) {
		return aInquiery.entrance(aBean);
	}
	
	// 알바생 일정 관리  -  알바생이 자신이 일하는 알바에대한 일정을 관리
	@RequestMapping(value = "/Diary", method = RequestMethod.GET)
	public ModelAndView diary(@ModelAttribute AlbaBean aBean) {
		return aInquiery.entrance(aBean);
	}
	
	// 알바생 이력서  - 자신이 등록해놓은 이력서 리스트 조회
	@RequestMapping(value = "/Resume", method = RequestMethod.GET)
	public ModelAndView resume(@ModelAttribute AlbaBean aBean) {
		return aInquiery.entrance(aBean);
	}
	
	// 알바생 이력서  - 자신이 등록해놓은 이력서 리스트 상세조회
	@RequestMapping(value = "/ResumeDetail", method = RequestMethod.GET)
	public ModelAndView resumeDetail(@ModelAttribute AlbaBean aBean) {
		return aInquiery.entrance(aBean);
	}
	
	
	/* ---------------------------------- 알바생 - 등록  ---------------------------------- */
	
	// 알바생 일정 관리  -  알바생이 자신이 일하는 알바에대한 일정을 관리
	@RequestMapping(value = "/AlbaAddSchedule", method = RequestMethod.GET)
	public ModelAndView albaAddSchedule(@ModelAttribute AlbaBean aBean) {
		return aEnroll.entrance(aBean);
	}
	
	
	@RequestMapping(value = "/TestWork", method = RequestMethod.GET)
	public ModelAndView testWork(@ModelAttribute AlbaBean aBean,HttpServletRequest req) {
		aBean.setAction(req.getRequestURI().substring(req.getContextPath().length() + 1));
		return aEnroll.entrance(aBean);
	}
	
	 //알바생이 출근하자마자 시제값을 전송한 데이터를 db에 전송
	@RequestMapping(value = "/StartMoney", method ={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView startMoney(@ModelAttribute AlbaBean aBean ,HttpServletRequest req) {
		aBean.setAction(req.getRequestURI().substring(req.getContextPath().length() + 1));
		System.out.println("근무일지 등록 도착");
		return aEnroll.entrance(aBean);
	}
	
	
	
	
	/* ---------------------------------- 알바생 - 수정  ---------------------------------- */
	
	// 알바생 일정 관리  -  알바생이 자신이 일하는 알바에대한 등록 해놓은 일정을 삭제
	@RequestMapping(value = "/AlbaDeleteSchedule", method = RequestMethod.GET)
	public ModelAndView albaDeleteSchedule(@ModelAttribute AlbaBean aBean) {
		return aModify.entrance(aBean);
	}
	
	// 알바생 일정 관리  -  알바생이 자신이 회원가입시 등록한 정보를 조회
	@RequestMapping(value = "/Modify", method = RequestMethod.GET)
	public ModelAndView modify(@ModelAttribute AlbaBean aBean) {
		return aModify.entrance(aBean);
	}
	
	// 알바생 일정 관리  -  알바생이 자신이 회원가입시 등록한 정보에대해 수정
	@RequestMapping(value = "/ModifyInfomation", method = RequestMethod.GET)
	public ModelAndView modifyInfomation(@ModelAttribute AlbaBean aBean) {
		return aModify.entrance(aBean);
	}
	
	
	
	
}




