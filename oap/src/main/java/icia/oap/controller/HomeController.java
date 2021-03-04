package icia.oap.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import icia.oap.beans.AuthBean;
import icia.oap.services.authentication.Authentication;


@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private Authentication auth;
	
	ModelAndView mv = null;

	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home() {
		mv = new ModelAndView();
		mv.setViewName("home");
		return mv;
	}
	
	/* ----------------------- 회원 가입 ----------------------*/
	
	// 메인화면에서 회원가입 버튼을 눌럿을 때  스텝1단게로 이동하는 단계    sCode = 1
	@RequestMapping(value = "/JoinForm", method = RequestMethod.GET)
	public ModelAndView joinForm(@ModelAttribute AuthBean authBean,HttpServletRequest req) {
		authBean.setAction(req.getRequestURI().substring(req.getContextPath().length() + 1));
		return auth.entrance(authBean);
	}
	
	// 스텝 1에서 약관동의 (스텝 2) 로 넘어가는 과정   sCode = 2
	@RequestMapping(value = "/Agree", method = RequestMethod.GET)
	public ModelAndView agree(@ModelAttribute AuthBean authBean,HttpServletRequest req) {
		authBean.setAction(req.getRequestURI().substring(req.getContextPath().length() + 1));
		return auth.entrance(authBean);
	}
	
	// 회원가입 하면서 필요한 정보를 입력하는 단계 ( 스텝 3 )    sCode = 3
	@RequestMapping(value = "/JoinPage", method = RequestMethod.GET)
	public ModelAndView joinPage(@ModelAttribute AuthBean authBean,HttpServletRequest req) {
		authBean.setAction(req.getRequestURI().substring(req.getContextPath().length() + 1));
		return auth.entrance(authBean);
	}
	
	// db 검사 후  회원가입 완료여부 결정 페이지   ( 스텝 4 )  sCode = 4
	@RequestMapping(value = "/Join", method = RequestMethod.POST)
	public ModelAndView join(@ModelAttribute AuthBean authBean,HttpServletRequest req) {
		authBean.setAction(req.getRequestURI().substring(req.getContextPath().length() + 1));
		System.out.println("회원 정보도착");
		System.out.println("test >>" + authBean.getSBirth());
		System.out.println("code >>" + authBean.getSCode());
		System.out.println("은행이름 ="  + authBean.getBankName());
		return auth.entrance(authBean);
	}
	
	/* ----------------------- 로그인 ----------------------*/
	
	// 메인화면에서 로그인 화면으로 넘어 가는 과정  lCode = ? , sCode = 1
	@RequestMapping(value = "/LogInForm", method = RequestMethod.GET)
	public ModelAndView logInForm(@ModelAttribute AuthBean authBean,HttpServletRequest req) {
		authBean.setAction(req.getRequestURI().substring(req.getContextPath().length() + 1));
		return auth.entrance(authBean);
	}
	
	//
	@RequestMapping(value = "/LogIn", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView logIn(@ModelAttribute AuthBean authBean,HttpServletRequest req) {
		authBean.setAction(req.getRequestURI().substring(req.getContextPath().length() + 1));
		System.out.println("HI");
		return auth.entrance(authBean);
	}
	
	@RequestMapping(value = "/LogInQr", method = RequestMethod.GET)
	public ModelAndView logInQr(@ModelAttribute AuthBean authBean,HttpServletRequest req) {
		authBean.setAction(req.getRequestURI().substring(req.getContextPath().length() + 1));
		// 일하는 요일이 맞는지 ?  요일이맞다면 시간은 맞는지 ? 
		return auth.entrance(authBean);
	}
	
	@RequestMapping(value = "/TestWork", method = RequestMethod.GET)
	public ModelAndView testWork(@ModelAttribute AuthBean authBean,HttpServletRequest req) {
		authBean.setAction(req.getRequestURI().substring(req.getContextPath().length() + 1));
		return auth.entrance(authBean);
	}
	
	@RequestMapping(value = "/StartMoney", method ={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView startMoney(@ModelAttribute AuthBean authBean,HttpServletRequest req) {
		authBean.setAction(req.getRequestURI().substring(req.getContextPath().length() + 1));
		System.out.println("도착");
		System.out.println("50원은 ?" + authBean.getOsip());
		return auth.entrance(authBean);
	}
	
	
	/* ----------------------- 로그아웃 ----------------------*/
	
	@RequestMapping(value = "/LogOut", method = RequestMethod.GET)
	public ModelAndView logOut(@ModelAttribute AuthBean authBean) {
		return auth.entrance(authBean);
	}
	
	@RequestMapping(value = "/LeaveQr", method = RequestMethod.GET)
	public ModelAndView leaveQr(@ModelAttribute AuthBean authBean) {
		return auth.entrance(authBean);
	}
	
}




