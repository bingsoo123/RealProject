package icia.oap.services.authentication;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.web.servlet.ModelAndView;

import icia.oap.beans.AuthBean;
import icia.oap.beans.Money;
import icia.oap.mapper.AuthMapper;
import icia.oap.utils.Encryption;
import icia.oap.utils.ProjectUtils;

@Service
public class AbtpAuthentication {

	@Autowired
	private AuthMapper mapperA;
	@Autowired
	private PlatformTransactionManager tran;
	@Autowired
	private Encryption enc;
	@Autowired
	private ProjectUtils pu;

	
	public AbtpAuthentication() {

	}

	public ModelAndView entrance(AuthBean authBean) {

		ModelAndView mav = null;

		if (authBean.getLCode() == null) {

			switch (authBean.getAction()) {

			case "JoinForm":
				System.out.println("1");
				mav = this.joinForm(authBean);
				break;
			case "Agree":
				System.out.println("2");
				mav = this.joinTypeSelect(authBean);
				break;
			case "JoinPage":
				mav = this.joinAgree(authBean);
				break;
			case "Join":
				mav = this.join(authBean);
				break;
				
			}

		} else {

			switch (authBean.getAction()) {

			case "LogInForm":
				mav = this.loginForm(authBean);
				break;
			case "LogIn":
				mav = this.logInCtl(authBean);
				break;

			}

		}

		return mav;
	}

	private Money startWork() {
		return mapperA.getStartWork();
	}

	private ModelAndView loginForm(AuthBean auBean) {

		ModelAndView mav = new ModelAndView();

		mav.addObject("lCode", auBean.getLCode());

		mav.setViewName("login");

		return mav;
	}

	private ModelAndView joinForm(AuthBean auBean) {

		ModelAndView mav = new ModelAndView();

		System.out.println("회원선택 이동합니다");

		mav.setViewName("join");

		return mav;
	}

	private ModelAndView joinTypeSelect(AuthBean auBean) {

		ModelAndView mav = new ModelAndView();

		System.out.println("약관동의 페이지로 이동합니다");
		System.out.println("서비스 코드 =" + auBean.getSCode());

		mav.addObject("sCode", auBean.getSCode());

		mav.setViewName("agree");

		return mav;
	}

	private ModelAndView joinAgree(AuthBean auBean) {

		ModelAndView mav = new ModelAndView();

		System.out.println("회원 정보 입력페이지로 이동합니다.");
		
		mav.addObject("sCode", auBean.getSCode());
		mav.addObject("Road", auBean.getRoad());
		mav.addObject("detail", auBean.getDetail());
		
		mav.setViewName((auBean.getSCode().equals("alba")) ? "joinPage" : "joinPage2");

		return mav;
	}

	private ModelAndView join(AuthBean auBean) {

		System.out.println("회원정보 입력페이지 입니다");
		
		auBean.setSPw(enc.encode(auBean.getSPw()));
		
		ModelAndView mav = new ModelAndView();
		
		String message = "알수없는 도류가 발생하였습니다 . 다시시도 해주세요";
		String page = (auBean.getSCode().equals("alba"))? "joinPage" : "joinPage2";
		
		TransactionStatus status = tran.getTransaction(new DefaultTransactionDefinition());
		
		auBean.setAbCode(mapperA.maxCode());
		
		if(auBean.getSCode().equals("alba")) {
			
			if(!this.isMemberAlba(auBean)) {
				System.out.println("ID없음 >> 회원가입 진행");
				if(this.joinInsert(auBean)) {
					System.out.println("회원정보 들어감");
					if(this.accountInsert(auBean)) {
						
						System.out.println("계좌까지 인서트 성공 .... 확인바람");
						tran.commit(status);
						page = "joinSuccess";
						message = null;
						
					}
				}
				
			}
			
		}else if(auBean.getSCode().equals("manage")) {
			
		}
		
		mav.addObject("message", message);
		mav.setViewName(page);

		return mav;
	}

	private boolean accountInsert(AuthBean auBean) {
		return this.converToBoolean(mapperA.accountInsert(auBean));
	}

	private boolean converToBoolean(int data) {

		return (data == 1) ? true : false;
	}



	private boolean joinInsert(AuthBean auBean) {
		return this.converToBoolean(mapperA.joinInsert(auBean));
	}

	private ModelAndView logInCtl(AuthBean auBean) {

		ModelAndView mav = new ModelAndView();

		String message = "아이디 또는 비밀번호가 잘못되었습니다";
		String page = "login";

		// 관리자의 로그인인지 알바생 (직원) 의 로그인인지 판단
		if (auBean.getLCode().equals("alba")) {
			if (this.isMemberAlba(auBean)) {
					auBean.setDbPw(this.getDbPw(auBean));
				if (enc.matches(auBean.getSPw(),auBean.getDbPw())) {
					auBean.setAbCode(this.getAbCode(auBean));
					mav.addObject("abCode", auBean.getAbCode());
					message = null;
					page = "workMan";
				}
			}
		} else if (auBean.getLCode().equals("manage")) {

			if (this.isMemberManage(auBean)) {
				
				if (this.isPasswordManage(auBean)) {
					auBean.setMnCode(this.getMnCode(auBean));
					mav.addObject("mnCode", auBean.getMnCode());
					message = null;
					page = "manage";
					
				}
			}
		}

		mav.addObject("lCode" , auBean.getLCode());
		mav.addObject("message", message);
		mav.setViewName(page);

		return mav;
	}

	private String getDbPw(AuthBean auBean) {
		return mapperA.getDbPw(auBean);
	}

	private String getMnCode(AuthBean auBean) {
		return mapperA.getManageCode(auBean);
	}

	private String getAbCode(AuthBean auBean) {
		return mapperA.getAlbaCode(auBean);
	}

	private boolean isMemberManage(AuthBean auBean) {
		return this.converToBoolean(mapperA.isMemberManage(auBean));
	}

	private boolean isMemberAlba(AuthBean auBean) {
		return this.converToBoolean(mapperA.isMemberAlba(auBean));
	}

	private boolean isPasswordManage(AuthBean auBean) {
		return this.converToBoolean(mapperA.isPasswordManage(auBean));
	}

	private boolean isPasswordAlba(AuthBean auBean) {
		return this.converToBoolean(mapperA.isPasswordAlba(auBean));
	}

	private boolean insertCommute(AuthBean auBean) {
		return this.converToBoolean(mapperA.insertCommute(auBean));
	}

	private ModelAndView logOutCtl(AuthBean auBean) {

		ModelAndView mav = new ModelAndView();

		return mav;
	}

	private boolean logInQr(AuthBean auBean) {
		return this.converToBoolean(mapperA.logInQr(auBean));
	}

	private boolean leaveQr(AuthBean auBean) {
		return this.converToBoolean(mapperA.leaveQr(auBean));
	}

}
