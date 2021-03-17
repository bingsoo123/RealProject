package icia.oap.controller;


import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import icia.oap.beans.AlbaBean;
import icia.oap.beans.AuthBean;
import icia.oap.services.alba.AlbaEnroll;
import icia.oap.services.alba.AlbaInquiery;
import icia.oap.services.alba.AlbaModify;
import icia.oap.utils.ProjectUtils;


@Controller
public class AlbaController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private AlbaEnroll aEnroll;
	@Autowired
	private AlbaModify aModify;
	@Autowired
	private AlbaInquiery aInquiery;
	@Autowired
	private ProjectUtils pu;
	
	ModelAndView mav = null;
	
	
	/*------------- 세션체크 ------------*/
	
	private String SessionCheck() throws Exception {
		
		String result = null;
		
		if(pu.getAttribute("idCode")==null) {
			
			System.out.println("세션이 존재합니다");
			System.out.println("세션 값 ::" + pu.getAttribute("idCode"));
		}else {
			
			System.out.println("세션이 존재하지 않습니다.");
		}
		
		return result;
	}
	
	/* ---------------------------------- 알바생 - 조회 ---------------------------------- */
	
	// 알바생이 일하고 있는 매장의 전체 업무리스트
	@RequestMapping(value = "/AlbaTaskList", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView albaTaskList(@ModelAttribute AlbaBean aBean,HttpServletRequest req) {
		aBean.setAction(req.getRequestURI().substring(req.getContextPath().length() + 1));
		System.out.println("알바코드>" + aBean.getAbCode() + ":매장코드:" + aBean.getShCode());
		return aInquiery.entrance(aBean);
	}
	
	// 알바가 선택한 매장의 업무리스트 조회
	@RequestMapping(value = "/AlbaTaskListSelect", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String albaTaskListSelect(@ModelAttribute AlbaBean aBean,HttpServletRequest req) throws UnsupportedEncodingException {
		aBean.setAction(req.getRequestURI().substring(req.getContextPath().length() + 1));
		System.out.println("aBean.getAbCode()::"+aBean.getAbCode());
		System.out.println("aBean.getShCode()::"+aBean.getShCode());
		mav = aInquiery.entrance(aBean);
		return URLEncoder.encode(mav.getModel().get("albaTaskListSelect").toString(),"UTF-8");
	}
	
	
	// 알바생이 일하고잇는 알바 ( 매장 ) 리스트 조회
	@RequestMapping(value = "/AlbaList", method = RequestMethod.POST)
	public ModelAndView albaList(@ModelAttribute AlbaBean aBean,HttpServletRequest req) {
		aBean.setAction(req.getRequestURI().substring(req.getContextPath().length() + 1));
		return aInquiery.entrance(aBean);
	}
	
	// 알바생 급여 조회
	@RequestMapping(value = "/payCheck", method ={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView payCheck(@ModelAttribute AlbaBean aBean,HttpServletRequest req) {
		aBean.setAction(req.getRequestURI().substring(req.getContextPath().length() + 1));
		System.out.println("abcode =>" + aBean.getAbCode());
		return aInquiery.entrance(aBean);
	}
	
	// 알바생 일정 관리  -  알바생이 자신이 일하는 알바에대한 일정을 관리
	@RequestMapping(value = "/Diary", method = RequestMethod.POST)
	public ModelAndView diary(@ModelAttribute AlbaBean aBean,HttpServletRequest req) {
		aBean.setAction(req.getRequestURI().substring(req.getContextPath().length() + 1));
		return aInquiery.entrance(aBean);
	}
	
	// 알바생 이력서  - 자신이 등록해놓은 이력서 리스트 조회
	@RequestMapping(value = "/Resume", method = RequestMethod.POST)
	public ModelAndView resume(@ModelAttribute AlbaBean aBean,HttpServletRequest req) {
		aBean.setAction(req.getRequestURI().substring(req.getContextPath().length() + 1));
		return aInquiery.entrance(aBean);
	}
	
	// 알바생 이력서  - 자신이 등록해놓은 이력서 리스트 상세조회
	@RequestMapping(value = "/ResumeDetail", method = RequestMethod.POST)
	public ModelAndView resumeDetail(@ModelAttribute AlbaBean aBean,HttpServletRequest req) {
		aBean.setAction(req.getRequestURI().substring(req.getContextPath().length() + 1));
		return aInquiery.entrance(aBean);
	}
	
	// 로그인했을때 알바생이 알바를 하고있는 매장들 select box에 담고, 자기 이름 정보 가져오기.
	// 만약 알바를 하고 있지않다면 자기 정보만 가져와서 출력하게함.
	@RequestMapping(value = "/albaInclueShopInfo", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String albaInclueShopInfo(@ModelAttribute AlbaBean aBean) throws UnsupportedEncodingException {
		mav = aInquiery.entrance(aBean);
		return URLEncoder.encode(mav.getModel().get("albaInclueShopInfo").toString(),"UTF-8");
	}
	
	
	@RequestMapping(value = "/albaApplyShopMyInfo", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String albaApplyShopMyInfo(@ModelAttribute AlbaBean aBean) throws UnsupportedEncodingException {
		mav = aInquiery.entrance(aBean);
		return URLEncoder.encode(mav.getModel().get("albaApplyMyInfo").toString(),"UTF-8");
	}
	
	// 내가 지원한 매장 정보
	@RequestMapping(value = "/albaApplyMyShopInquiry", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String albaApplyMyShopInquiry(@ModelAttribute AlbaBean aBean) throws UnsupportedEncodingException {
		mav = aInquiery.entrance(aBean);
		return URLEncoder.encode(mav.getModel().get("applyMyShopInfo").toString(),"UTF-8");
	}
	
	// 알바지원, 눌렀을때 그 회사 디테일 정보 
	@RequestMapping(value = "/albaApplyShopDetailInfo", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView albaApplyShopDetailInfo(@ModelAttribute AlbaBean aBean) {
		return aInquiery.entrance(aBean);
	}
	
	
	//albaApplyMyInfo
	//알바지원.. 내가 지원하고 싶은 회사 눌렀을때 나의 정보 뜨는것. (지원 전)  
	@RequestMapping(value = "/albaApplyMyInfo", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String albaApplyMyInfo(@ModelAttribute AlbaBean aBean) throws UnsupportedEncodingException {
		mav = aInquiery.entrance(aBean);
		return URLEncoder.encode(mav.getModel().get("albaMyInfo").toString(),"UTF-8");
	}
	
	/////////////// 
	// 로그인했을때 알바생이 알바를 하고있는 매장들 select box에 담고, 자기 이름 정보 가져오기.
	// 만약 알바를 하고 있지않다면 자기 정보만 가져와서 출력하게함.
	@RequestMapping(value = "/albaApply", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String albaApply(@ModelAttribute AlbaBean aBean) throws UnsupportedEncodingException {
		mav = aInquiery.entrance(aBean);
		return URLEncoder.encode(mav.getModel().get("albaApplyShopInfo").toString(),"UTF-8");
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
		System.out.println(aBean.getTCode());
		System.out.println("근무일지 등록 도착");
		return aEnroll.entrance(aBean);
	}
	
	
	 // 알바생이 퇴근하면서 작성하는 정산 and 특이사항
	@RequestMapping(value = "/LeaveWork", method ={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView endData(@ModelAttribute AlbaBean aBean ,HttpServletRequest req) {
		aBean.setAction(req.getRequestURI().substring(req.getContextPath().length() + 1));
		System.out.println("퇴근하러왓어요");
		return aEnroll.entrance(aBean);
	}
	
	// 알바 지원 성공. (인서트 구문) albaApplyComplete
	@RequestMapping(value = "/albaApplyComplete", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String albaApplyComplete(@ModelAttribute AlbaBean aBean) throws UnsupportedEncodingException {
		mav = aEnroll.entrance(aBean);
		return URLEncoder.encode(mav.getModel().get("insertState").toString(),"UTF-8");
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
	
	@RequestMapping(value = "/albaApplyMyAccountUpdate", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String albaApplyMyAccountUpdate(@ModelAttribute AlbaBean aBean) throws UnsupportedEncodingException {
		mav = aModify.entrance(aBean);
		return URLEncoder.encode(mav.getModel().get("albaApplyUpdate").toString(),"UTF-8");
	}
	
	
	// 지원 취소
	@RequestMapping(value = "/albaApplyDelete", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String albaApplyDelete(@ModelAttribute AlbaBean aBean) throws UnsupportedEncodingException {
		mav = aModify.entrance(aBean);
		return URLEncoder.encode(mav.getModel().get("albaApplyDelete").toString(),"UTF-8");
	}
	
}


