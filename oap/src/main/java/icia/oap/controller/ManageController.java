package icia.oap.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import icia.oap.beans.AuthBean;
import icia.oap.beans.ManageBean;
import icia.oap.services.management.ManagementEnroll;
import icia.oap.services.management.ManagementInquiery;
import icia.oap.services.management.ManagementModify;

@Controller
public class ManageController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private ManagementEnroll mEnroll;
	@Autowired
	private ManagementModify mModify;
	@Autowired
	private ManagementInquiery mInquiery;

	ModelAndView mav = null;

	/* ------------------------- 관리자 - 조회 ------------------------- */
	
	// 로그인 하고나서 사장님 이름과 가지고있는 매장 리스트 가져옴.
	@RequestMapping(value = "/managerInfo", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String managerInfo(@ModelAttribute ManageBean mBean) throws UnsupportedEncodingException{
		mav = mInquiery.entrance(mBean); //
		return URLEncoder.encode(mav.getModel().get("shopInfoList").toString(),"UTF-8");
	}
	
	
	// 나의 매장 관리
	@RequestMapping(value = "/MyWorkZone", method = RequestMethod.GET)
	public ModelAndView myWorkZone(@ModelAttribute ManageBean mBean) {
		mBean.setSCode("myWorkZone");

		mBean.setShMnCode("10000000");

		return mInquiery.entrance(mBean);
	}
	
	// 관리자 코드 보내기
	@RequestMapping(value = "/goManageCode", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView goManageCode(@ModelAttribute ManageBean mBean) {
		
		mav = new ModelAndView();
		mBean.setMnCode("10000000");
		mBean.setSCode("goManageCode");
		mav = mInquiery.entrance(mBean);
		mav.setViewName("info");
		
		return mav;
	}

	// 지도 조회 - 매장
	@RequestMapping(value = "/searchMap", method = RequestMethod.GET)
	public ModelAndView searchMape(@ModelAttribute ManageBean mBean) {
		mBean.setSCode("searchMap");
		return mInquiery.entrance(mBean);
	}

	// 지도 조회 - 회원가입
	@RequestMapping(value = "/searchMapJoin", method = RequestMethod.GET)
	public ModelAndView searchMapJoin(@ModelAttribute ManageBean mBean) {
		mBean.setSCode("searchMapJoin");
		return mInquiery.entrance(mBean);
	}

	//////// 진주 20210315
	// 알바 디테일에서 그 알바의 계좌 정보를 불러오는 메서드
	@RequestMapping(value = "/albaInfoDetailAccountList", method = {RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	public String albaInfoDetailAccountList(@ModelAttribute ManageBean mBean) throws UnsupportedEncodingException {
		mav = new ModelAndView();
		mav = mInquiery.entrance(mBean);
		return URLEncoder.encode(mav.getModel().get("albaAccountList").toString(),"UTF-8");
	}
	
	// 알바생 관리 매핑값 info 였던것. albaManagementInfo로 변경.
	@RequestMapping(value = "/albaManagementInfo", method = {RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	public String albaManagementInfo(@ModelAttribute ManageBean mBean) throws UnsupportedEncodingException {
		mav = new ModelAndView();
		mav = mInquiery.entrance(mBean);
		return URLEncoder.encode(mav.getModel().get("albaData").toString(),"UTF-8");
	}
	
	// 알바생 관리 상세정보에서 계좌 수정
	@RequestMapping(value = "/albaDetailUpdateComplete", method = {RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	public String albaDetailUpdateComplete(@ModelAttribute ManageBean mBean) throws UnsupportedEncodingException {
		mav = new ModelAndView();
		mav = mModify.entrance(mBean);
		return URLEncoder.encode(mav.getModel().get("updateState").toString(),"UTF-8");
	}
	
	
    // 알바생 관리 에서 [등록]버튼 눌렀을때 내 매장에 지원한 알바생 정보
	@RequestMapping(value = "/albaManagementAdd", method ={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView albaManagementAdd(@ModelAttribute ManageBean mBean) {
		mav = new ModelAndView();
		mav.setViewName("albaManagementAdd");
		return mInquiery.entrance(mBean);
	}
	
	// 알바생 [등록] 누르고 알바생 눌렀을떄 상세 정보
	@RequestMapping(value = "/albaManagementAddSelect", method = {RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	public String albaManagementAddSelect(@ModelAttribute ManageBean mBean) throws UnsupportedEncodingException {
		mav = new ModelAndView();
		mav = mInquiery.entrance(mBean);
		return URLEncoder.encode(mav.getModel().get("mAlbaList").toString(),"UTF-8");
	}
	
	@RequestMapping(value = "/albaManagementAddComplete", method = {RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	public String albaManagementAddComplete(@ModelAttribute ManageBean mBean) throws UnsupportedEncodingException {
		mav = new ModelAndView();
		mav = mEnroll.entrance(mBean);
		return URLEncoder.encode(mav.getModel().get("insertState").toString(),"UTF-8");
	}
	
	// accessDetail 을 - > albaInfoDetail로 바꿈
	// 알바생 관리 - 알바생 클릭시 상세정보
	@RequestMapping(value = "/albaInfoDetail", method ={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView albaInfoDetail(@ModelAttribute ManageBean mBean) {
		mav = new ModelAndView();
		System.out.println("상세 정보 접근");
		mav.setViewName("albaInfoDetail");
		return mInquiery.entrance(mBean);
	}
	/////여기까지 15일 추가
	
	
	///  ???
	// 알바생 관리 - 알바생 검색 // ?? 이건 뭐하는앤지잘모르겠음. (현기씨)
	@RequestMapping(value = "/AlbaInfoSearch", method = RequestMethod.GET)
	public ModelAndView albaInfoSearch(@ModelAttribute ManageBean mBean) {
		return mInquiery.entrance(mBean);
	} 
	
	
    // 알바생 관리에서, 상세 정보에서 알바생을 [삭제] 눌렀을때. 
	@RequestMapping(value = "/albaManagementDetailDelete", method = {RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	public String albaManagementDetailDelete(@ModelAttribute ManageBean mBean) throws UnsupportedEncodingException {
		mav = new ModelAndView();
		mav = mModify.entrance(mBean);
		return URLEncoder.encode(mav.getModel().get("deleteState").toString(),"UTF-8");
	}

	// 출퇴근 관리 - 날자 선택후 조회하기 버튼클릭시 요청
	@RequestMapping(value = "/Inquiery", method = RequestMethod.GET)
	public ModelAndView inquiery(@ModelAttribute ManageBean mBean) {
		return mInquiery.entrance(mBean);
	}

	// 업무 관리  - 등록되어있는 업무리스트 확인 ( 알바생이 해야할 일 )
	@RequestMapping(value = "/Work", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView work(@ModelAttribute ManageBean mBean) {
		System.out.println("매장코드 >" + mBean.getShCode());
		mBean.setSCode("Work");
		return mInquiery.entrance(mBean);
	}
	
	// 업무 관리  - 등록되어있는 업무리스트 확인 ( 알바생이 해야할 일 )
	@RequestMapping(value = "/WorkType", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String tlCommentData(@ModelAttribute ManageBean mBean) throws UnsupportedEncodingException {
		mBean.setSCode("WorkType");
		System.out.println("매장코드는 ?" + mBean.getShCode() + ":: tlNumber =?" + mBean.getTlNumber());
		mav = mInquiery.entrance(mBean);
		return URLEncoder.encode(mav.getModel().get("typeDetail").toString(),"UTF-8");
	}

	// 급여 관리 - 나의 매장 식구들의 급여리스트를 보여줌 
	@RequestMapping(value = "/pay", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView pay(@ModelAttribute ManageBean mBean) {
		mav = new ModelAndView();
		mBean.setShCode("100000000");
		mBean.setAbCode("100000000");
		mBean.setSCode("pay");
		mav.setViewName("pay");
		
		return mInquiery.entrance(mBean);
	}

	// 급여 관리 - 나의 매장 식구들의 급여리스트중 한명의 내역을 상세하게 보여줌
	@RequestMapping(value = "/payDetail", method = RequestMethod.POST)
	public ModelAndView payDetail(@ModelAttribute ManageBean mBean) {
		mav = new ModelAndView();
		mBean.setSCode("payDetail");
		mav.setViewName("payDetail");
		return mInquiery.entrance(mBean);
	}
	
	// 급여 관리 - 추가버튼 클릭시 매장리스트를 가져오기위한 메서드
	@RequestMapping(value = "/manageStore", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView manageStore(@ModelAttribute ManageBean mBean) {
		
		System.out.println("manageStore22222222222222222222222");
		mBean.setMnCode("10000000");
		mBean.setSCode("manageStore");
		
		return mInquiery.entrance(mBean);
	}
	
	// 급여관리 - 추가하기 버튼
	@RequestMapping(value = "/payInsert", method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public String payInsert(@ModelAttribute ManageBean mBean) throws UnsupportedEncodingException {
		
		mav = new ModelAndView();
		mBean.setMnCode("10000000");
		mav = mInquiery.entrance(mBean);
		return URLEncoder.encode(mav.getModel().get("payInsert").toString(),"UTF-8");
	}
	
	

	// 급여 관리 - 급여리스트를 날자값에 의해 보여주기위해 날자를 선택 후 조회를 클릭 
	@RequestMapping(value = "/PaySelect", method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public String PaySelect(@ModelAttribute ManageBean mBean) throws UnsupportedEncodingException {
		mav =  mInquiery.entrance(mBean);
		mBean.setSCode("PaySelect");
		return URLEncoder.encode(mav.getModel().get("gab").toString(),"UTF-8");
	}

	// 일정 관리 - 일정 표를 보여줌 ( 알바생들이 몇시에 누가 일 하는지 )
	@RequestMapping(value = "/Schedule", method = RequestMethod.POST)
	public ModelAndView schedule(@ModelAttribute ManageBean mBean) {
		mBean.setSCode("Schedule");
		return mInquiery.entrance(mBean);
	}

	// 근무 일지 - 알바생이 퇴근하면서 작성해놓은 날자별 근무일지를 볼때 클릭
	@RequestMapping(value = "/WorkLog", method = RequestMethod.POST)
	public ModelAndView workLog(@ModelAttribute ManageBean mBean) {
		mBean.setSCode("WorkLog");
		return mInquiery.entrance(mBean);
	}

	// 근무 일지 - 근무일지에 무슨일이 잇엇는지 확인하기위해 상세정보를 보기위한 요청
	@RequestMapping(value = "/Log", method = RequestMethod.POST)
	public ModelAndView log(@ModelAttribute ManageBean mBean) {
		mBean.setSCode("Log");
		return mInquiery.entrance(mBean);
	}

	// 근로 계약서 - 해당 매장에 잇는 알바생들의 근로 계약서 리스트 보여짐
	@RequestMapping(value = "/Larbor", method = RequestMethod.GET)
	public ModelAndView larbor(@ModelAttribute ManageBean mBean) {
		return mInquiery.entrance(mBean);
	}

	// 근로 계약서 - 근로계약서를 상세하게 보기위해 클릭할때 요청
	@RequestMapping(value = "/LarborDetail", method = RequestMethod.GET)
	public ModelAndView larborDetail(@ModelAttribute ManageBean mBean) {
		return mInquiery.entrance(mBean);
	}

	
	
	// 특정 매장의 알바생 리스트
	@RequestMapping(value = "/albaList1", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public String albaList1(@ModelAttribute ManageBean mBean) throws UnsupportedEncodingException {
		mav = mInquiery.entrance(mBean);
		return URLEncoder.encode(mav.getModel().get("albaListData").toString(), "UTF-8");
	}

	// 출퇴근 관리 - 알바생들의 출퇴근 기록 리스트를 보여줌
	@RequestMapping(value = "/Commute", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public String commute(@ModelAttribute ManageBean mBean) throws UnsupportedEncodingException {
		mav = mInquiery.entrance(mBean); // sCode = ABL
		return URLEncoder.encode(mav.getModel().get("CommuteData").toString(), "UTF-8");
	}

	/////////

	// 근로 계약서 - 해당 매장에 있는 알바생들의 근로 계약서 리스트 보여짐
	@RequestMapping(value = "/labor", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public String labor(@ModelAttribute ManageBean mBean) throws UnsupportedEncodingException {
		mav = mInquiery.entrance(mBean); // sCode = A
		return URLEncoder.encode(mav.getModel().get("laborData").toString(), "UTF-8");
	}

	// [근로계약서] 추가에서 근로계약서를 모두 작성하고 확인 눌렀을때 파일저장 및 DB 삽입 (mEnroll)
	@RequestMapping(value = "/laborAdd", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String laborAdd(@ModelAttribute ManageBean mBean) throws UnsupportedEncodingException{
		System.out.println("laborADD 컨트롤러 진입 " + mBean.getSCode());
		mav =  mEnroll.entrance(mBean); // sCode = B 
		return URLEncoder.encode(mav.getModel().get("laborRoot").toString(),"UTF-8");
	}

	// 근로 계약서 - 근로계약서를 상세하게 보기위해 클릭할때 요청
	@RequestMapping(value = "/laborDetail", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public String laborDetail(@ModelAttribute ManageBean mBean) throws UnsupportedEncodingException {
		System.out.println("왔어요");
		mav = mInquiery.entrance(mBean); // sCode = C
		return URLEncoder.encode(mav.getModel().get("laborDetailData").toString(), "UTF-8");
	}

	// 근로계약서 선택한거 모두 삭제. 체크박스에서 선택한 value값 모두가져옴. (arr형태)  (mModify)
	@RequestMapping(value = "/laborDelete", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String laborDelete(@ModelAttribute ManageBean mBean) throws UnsupportedEncodingException{
		System.out.println("laborDelete 컨트롤러 진입 " + mBean.getSCode());
		mav =  mModify.entrance(mBean);
		return URLEncoder.encode(mav.getModel().get("deleteStateText").toString(),"UTF-8"); 
	} 

	// 근로 계약서 [추가] 버튼 눌렀을때 매장코드로 매장정보와 그 매장 관리자 이름 그 매장에 있는 알바생 이름
	@RequestMapping(value = "/ShopInfoAndAlba", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public String ShopInfoAndAlba(@ModelAttribute ManageBean mBean) throws UnsupportedEncodingException {
		mav = mInquiery.entrance(mBean);
		return URLEncoder.encode(mav.getModel().get("ShopInfoAndAlba").toString(), "UTF-8");
	}

	// 근로 계약서 [추가] 버튼 누른후 그 매장의 알바생 정보(select) 박스 눌렀을때 그 알바생의 기본 정보값 가져옴
	@RequestMapping(value = "/laborAlbaInfo", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public String laborAlbaInfo(@ModelAttribute ManageBean mBean) throws UnsupportedEncodingException {
		mav = mInquiery.entrance(mBean);
		return URLEncoder.encode(mav.getModel().get("laborAlbaInfo").toString(), "UTF-8");
	}
	
	
	// 근로 계약서 [추가] 버튼 누른후 그 매장의 알바생 정보(select) 박스 눌렀을때 그 알바생의 기본 정보값 가져옴
	@RequestMapping(value = "/DayWork", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public String dayWork(@ModelAttribute ManageBean mBean) throws UnsupportedEncodingException {
		System.out.println("shCode >" + mBean.getShCode() + "stCode =>" + mBean.getStCode());
		mav = mInquiery.entrance(mBean);
		return URLEncoder.encode(mav.getModel().get("workList").toString(), "UTF-8");
	}
	
	// 조회 버튼눌럿을때 실행
	@RequestMapping(value = "/paySearch", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String paySearch(@ModelAttribute ManageBean mBean) throws UnsupportedEncodingException {
		mBean.setSCode("paySearch");
		mav = mInquiery.entrance(mBean);
		return URLEncoder.encode(mav.getModel().get("paySearch").toString(),"UTF-8");
	}
	
	
	// 조회 버튼눌럿을때 실행
	@RequestMapping(value = "/WhoWork", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String whoWork(@ModelAttribute ManageBean mBean) throws UnsupportedEncodingException {
		mBean.setSCode("WhoWork");
		System.out.println("WhoWork 도착 @@@@@@@@@@@@@@");
		return URLEncoder.encode(mInquiery.entrance(mBean).getModel().get("workList").toString(),"UTF-8");
	}
	
	
	// 근로 계약서 - 해당 매장에 잇는 알바생들의 근로 계약서 리스트 보여짐
	@RequestMapping(value = "/SerachWorkList", method = RequestMethod.GET)
	public ModelAndView searchWorkList(@ModelAttribute ManageBean mBean) {
		System.out.println("sCode >>" + mBean.getSCode() + "shCode >>" + mBean.getShCode() + "abCode >>" + mBean.getAbCode() + "selectDate=" + mBean.getSelectData());
		return mInquiery.entrance(mBean);
	}

	/* ------------------------- 관리자 - 등록 ------------------------- */

	// 업무 관리 - 업무 추가하기      sCode :: 1
	@RequestMapping(value = "/WorkAdd", method = RequestMethod.POST)
	public ModelAndView addWork(@ModelAttribute ManageBean mBean) {
		mBean.setSCode("WorkAdd");
		System.out.println("관리자 코드는 >" + mBean.getMnCode() + "매장코드는 >" + mBean.getShCode());
		return mEnroll.entrance(mBean);
	}
	
	// 업무 관리 - 업무 추가하기 화면이동 후 추가시키는 요청을 날릴 때    sCode :: 2
	@RequestMapping(value = "/WorkAddComplete", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView workAdd(@ModelAttribute ManageBean mBean) {
		System.out.println("workadd 진입");
		System.out.println("mBean.getShCode()::" + mBean.getShCode() + "abCode ::" + mBean.getAbCode());
		return mEnroll.entrance(mBean);
	}
	
	// 업무추가 - 매장이 바뀜에따라 알바생리스트 알아서 넘겨줌
	@RequestMapping(value = "/ChangeAlbaList", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String changeAlbaList(@ModelAttribute ManageBean mBean) throws UnsupportedEncodingException{
		return URLEncoder.encode(mInquiery.entrance(mBean).getModel().get("changeAlba").toString(),"UTF-8");
	}

	// 일정 관리 - 해당 매장에 알바생이 일할 시간을 등록
	// 특정 매장의 알바생 리스트
	@RequestMapping(value = "/AddSchedule", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String AddSchedule(@ModelAttribute ManageBean mBean) throws UnsupportedEncodingException{
	    mav = mEnroll.entrance(mBean);
	    System.out.println("insertState:: " + mav.getModel().get("insertState").toString());
		return URLEncoder.encode(mav.getModel().get("insertState").toString(),"UTF-8");
	}

	// 매장 관리 - 매장 추가하기 sCode :: 1
	@RequestMapping(value = "/AddWorkZone", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView addWorkZone(@ModelAttribute ManageBean mBean) {

		mBean.setSCode("addWorkZone");
		System.out.println("작동");

		return mEnroll.entrance(mBean);
	}
	
	// DB에 데이터를 INSERT
	   @RequestMapping(value = "/insPay", method = RequestMethod.POST)
	   @ResponseBody
	   public String insPay(@ModelAttribute ManageBean mBean) throws UnsupportedEncodingException {
	      mBean.setSCode("insPay");
	      
	      mBean.setMnCode("10000000");
	      mav =  mEnroll.entrance(mBean);
	      System.out.println("ins야 받았니이잉???>>>>  " + mBean);
	      
	      return URLEncoder.encode(mav.getModel().get("insPayState").toString(),"UTF-8");
	   }

	/* ------------------------- 관리자 - 수정 ------------------------- */

	// 업무 관리 - 업무내용 수정하기 버튼 누르면 보이는 새창 페이지  
	@RequestMapping(value = "/Change", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView change(@ModelAttribute ManageBean mBean) {
		System.out.println("안녕");
		mBean.setSCode("Change");
		mBean.setMnCode("10000000");
		mBean.setShCode("100000000");
		return mModify.entrance(mBean);
	}
	
	@RequestMapping(value = "/ChangeComplete", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView changeComplete(@ModelAttribute ManageBean mBean) {
		mBean.setSCode("ChangeComplete");
		System.out.println("mBean.getShCode()="+mBean.getShCode());
		return mModify.entrance(mBean);
	}

	// 업무 관리 - 업무내용 삭제하기  
	@RequestMapping(value = "/Drop", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String drop(@ModelAttribute ManageBean mBean) throws UnsupportedEncodingException {
		mBean.setSCode("Drop");
		mav =  mModify.entrance(mBean);
		System.out.println("mav.getModel().get(\"deleteState\").toString():: " + mav.getModel().get("deleteState").toString());
		return URLEncoder.encode(mav.getModel().get("deleteState").toString(),"UTF-8"); 
	}

	// 일정 관리 - 일정 삭제하기
	@RequestMapping(value = "/DeleteSchedule", method = RequestMethod.GET)
	public ModelAndView deleteSchedule(@ModelAttribute ManageBean mBean) {
		return mModify.entrance(mBean);
	}

}
