package icia.oap.services.management;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonElement;

import icia.oap.beans.ManageBean;
import icia.oap.mapper.ManageMapper;
import icia.oap.utils.ProjectUtils;

@Service
public class ManagementInquiery {
	
	@Autowired
	private ManageMapper mapperM;
	@Autowired
	private Gson gson;
	@Autowired
	private ProjectUtils pu;
	
	ModelAndView mav = null;
	
	public ManagementInquiery() {
		
	}
	
	public ModelAndView entrance(ManageBean mBean) {
		
		try {
			
			if(pu.getAttribute("idCode")!=null) {
				System.out.println("세션이 존재합니다 :: " + pu.getAttribute("idCode") );
				
				switch(mBean.getSCode()) {
				case "myWorkZone":
					mav = this.workZoneManagementCtl(mBean);
					break;
				
				//// 15일 추가
				
				case "albaManagementAdd" : // 알바 관리에서 등록 관련  
					mav = this.albaManagementAddCtl(mBean);
					break;
				case "albaManagementAddSelect" :
					mav = this.albaManagementAddSelectCtl(mBean);
					break;
					
					
				case "albaInfoDetailAccountList" : 
					mav = this.albaInfoDetailAccountListCtl(mBean);
					break;	
		        case "albaManagementInfo": // info 였던것 변경.
			        mav = this.albaManagementCtl(mBean);
			        break;
		        case "albaInfoDetail": // accessDetail 이였던걸 바꿈. 관련 메서드들도 삭제 요망
				    mav = this.albaInfoDetail(mBean);
				    break;
					
				///
					
				case "searchMap":
					mav = this.searchMapCtl(mBean);
					break;
				
				case "searchMapJoin":
					mav = this.searchMapJoinCtl(mBean);
					break;
					
				case "labor":
					// [근로계약서] 탭을 눌렀을때
					mav = this.laborListCtl(mBean);
					break;
				case "laborDetail":
					// 근로계약서 눌러서 상세 정보 볼때.
					mav = this.laborDetailCtl(mBean);
					break;
				case "Commute":
					mav = this.commuteManagementCtl(mBean);
					break;
					
				case "albaList1":
					// 특정 알바리스트 이름 출력
					mav = this.getAlbaList1Ctl(mBean);
					break;
					
				case "ShopInfoAndAlba":
					// 매장코드의 관리자 이름과 매장 정보, 또 그 매장에 있는 알바생 코드까지
					mav = this.getShopInfoAndAlbaCtl(mBean);
					break;
				case "laborAlbaInfo":
					mav = this.getLaborAlbaInfoCtl(mBean);
					break;
		        case "pay":
		            mav = this.payCtl(mBean);
		            break;	
		        case "paySearch":
		            mav = this.paySearchCtl(mBean);
		            break; 
		        case "payDetail":
					mav = this.payDetailCtl(mBean);
					break; 
					   
		        case "payInsert":
					mav = this.payInsertCtl(mBean);
					break;
					
		        case "PaySelect":
					mav = this.paySelectCtl(mBean);
					break; 		
				case "managerInfo":
					mav = this.managerInfoCtl(mBean);
					break;
				case "Schedule" :
					mav = this.scheduleCtl(mBean);
					break;
				case "WorkLog" :
					mav = this.logCtl(mBean);
					break;
				case "Log" :
					mav = this.logDetailCtl(mBean);
					break;
				case "Work":
					mav = this.workCtl(mBean);
					break;
				case "WorkType":
					mav = this.WorkTypeCtl(mBean);
					break;	
		        case "goManageCode":
				    mav = this.goManageCodeCtl(mBean);
					break; 
		        case "manageStore":
		        	System.out.println("case 도착");
					mav = this.manageStore(mBean);
					break; 	
		        case "DayWork":
		        	mav=this.dayWork(mBean);
		        	break;
		        case "WhoWork" :
		        	mav=this.whoWork(mBean);
		        	break;
		        case "ChangeAlbaList" :
		        	mav=this.changeAlbaListCtl(mBean);
		        	break;	
				}
				
			}
			
		} catch (Exception e) {
			
			System.out.println("세션이 존재하지않아요");
			
			mav = new ModelAndView();
			
			mav.setViewName("/LogInForm?lCode=manage");
			
			e.printStackTrace();
		}
	   			
		
		return mav;
	}
	
	private ModelAndView changeAlbaListCtl(ManageBean mBean) {
		
		mav = new ModelAndView();
		
		System.out.println("바뀐다 알바생 !!!" + gson.toJson(this.getAlbaList1(mBean)));
		
		mav.addObject("changeAlba", gson.toJson(this.getAlbaList1(mBean)));
		
		return mav;
	}

	private ModelAndView whoWork(ManageBean mBean) {
		
		mav = new ModelAndView();
		
		System.out.println(mBean.getShCode() + " :: " + mBean.getTlNumber() + "::" + mBean.getMtDetail());
		
		
		System.out.println("그 일을 해야하는 알바생은 ?" + gson.toJson(this.workManList(mBean)));
		
		mav.addObject("workList", gson.toJson(this.workManList(mBean)));
		
		return mav;
	}

	private ArrayList<ManageBean> workManList(ManageBean mBean) {
		return mapperM.getWorkManList(mBean);
	}

	private ModelAndView albaManagementAddSelectCtl(ManageBean mBean) { // 알바생 관리에서 [등록] 버튼 누른 후 알바생을 선택 했을때.
		
		mav = new ModelAndView();
		String jsonData = gson.toJson(this.albaManagementAddSelect(mBean));
		mav.addObject("mAlbaList",jsonData);
		return mav;
		
	}
	private ManageBean albaManagementAddSelect(ManageBean mBean){
		return mapperM.albaManagementAddSelect(mBean);
	}
	
	// 알바생 관리에서 [등록] 버튼 눌렀을때 처음 뜨는 화면
	private ModelAndView albaManagementAddCtl(ManageBean mBean) { // 알바생 관리에서 [등록] 버튼 눌렀을때.
		mav = new ModelAndView();
		String jsonData = gson.toJson(this.albaManagementAddList(mBean));
		System.out.println("albaManagementAddList::" + jsonData);
		mav.addObject("mAlbaList",jsonData);
		return mav;
	}
	private ArrayList<ManageBean> albaManagementAddList(ManageBean mBean){
		return mapperM.albaManagementAddList(mBean);
	}
	
	
	private ModelAndView albaInfoDetail(ManageBean mBean) {
		mav = new ModelAndView();
		
		ManageBean mBeanTemp = this.getAlbaDetailSearch(mBean);
		System.out.println("mBeanTemp::" + mBeanTemp);
		
		// 제일 마지막에 출근 시간.
		try {
		//출근
		mBean.setCmType("1"); 
		mBeanTemp.setWorkCmTime(this.getCommuteTime(mBean).getCmTime());
		//퇴근 
		mBean.setCmType("-1");
		mBeanTemp.setLeaveCmTime(this.getCommuteTime(mBean).getCmTime());
		// 제일 마지막에 퇴근 시간
		System.out.println("제일 마지막 출근 시간 :"  + mBeanTemp.getWorkCmTime());
		System.out.println("제일 마지막 퇴근 시간 :"  + mBeanTemp.getLeaveCmTime());
		}catch (Exception e) {
			System.out.println("출퇴근 시간이 존재 하지않음 (null)");
			mBeanTemp.setWorkCmTime("0");
			mBeanTemp.setLeaveCmTime("0");
		}
		
		String albaInfo = gson.toJson(mBeanTemp);
		System.out.println("albaInfoDetail :: 상세정보 :: " + albaInfo);
		mav.addObject("albaInfo",albaInfo);
		return mav;
	}
	
	// 출퇴근 정보를 가져옴.
	public ManageBean getCommuteTime(ManageBean mBean) {
		return mapperM.getCommuteTime(mBean);
	}
	
	
	// ArrayList였던걸 ManageBean 타입으로 바꿈.
	private ManageBean getAlbaDetailSearch(ManageBean mBean){
		return mapperM.getAlbaDetailSearch(mBean);
	}
	
	
	
	private ModelAndView albaInfoDetailAccountListCtl(ManageBean mBean) {
		mav = new ModelAndView();
		String jsonData = gson.toJson(this.getAccountInfo(mBean));
		System.out.println("albaAccountList:: " + jsonData);
		mav.addObject("albaAccountList",jsonData);
		return mav;
	}
	
	private ArrayList<ManageBean> getAccountInfo(ManageBean mBean){
		return mapperM.getAccountInfo(mBean);
	}
	
	
	// 알바생 관리 ( 현재 매장의 알바생 리스트 가져오기 ) 
	private ModelAndView albaManagementCtl(ManageBean mBean) {
		mav = new ModelAndView();
		System.out.println("this.getAlbaList(mBean):: " + this.getAlbaList(mBean));
		String jsonData = gson.toJson(this.getAlbaList(mBean));
		mav.addObject("albaData", jsonData);
		return mav;
	}
	
	// 알바생 관리 ( 현재 매장의 알바생 리스트 가져오기 )
	private ArrayList<ManageBean> getAlbaList(ManageBean mBean){
		return mapperM.getAlbaList(mBean);
	}
	
	
	
	private ModelAndView dayWork(ManageBean mBean) {
		
		mav = new ModelAndView();
		
		System.out.println("이 매장의 해달날자에 일하는 직원은 >" + gson.toJson(this.getDayWork(mBean)));

		mav.addObject("workList", gson.toJson(this.getDayWork(mBean)));
		
		return mav;
	}

	private ArrayList<ManageBean> getDayWork(ManageBean mBean) {
		return mapperM.getDayWork(mBean);
	}

	private ModelAndView managerInfoCtl(ManageBean mBean) {
		mav = new ModelAndView();
		String jsonShopList = gson.toJson(this.getSelectShopList(mBean));
		System.out.println("getSelectShopList:: " + jsonShopList);
		mav.addObject("shopInfoList",jsonShopList);
		return mav;
	}
	
	private ArrayList<ManageBean> getSelectShopList(ManageBean mBean){
		return mapperM.getSelectShopList(mBean);
	}
	
	private ModelAndView getLaborAlbaInfoCtl(ManageBean mBean) {
		mav = new ModelAndView();
		String jsonMbList = gson.toJson(this.getLaborAlbaInfoList(mBean));
		System.out.println("getLaborAlbaInfoCtl:: " + jsonMbList);
		mav.addObject("laborAlbaInfo",jsonMbList);
		return mav;
	}
	
	private ArrayList<ManageBean> getLaborAlbaInfoList(ManageBean mBean){
		return mapperM.getLaborAlbaInfoList(mBean);
	}
	
	private ModelAndView getShopInfoAndAlbaCtl(ManageBean mBean) {
		mav = new ModelAndView();
		String jsonMbList = gson.toJson(this.shopInfoAndAlbaList(mBean));
		System.out.println("getShopInfoAndAlbaCtl:: " + jsonMbList);
		mav.addObject("ShopInfoAndAlba",jsonMbList);
		return mav;
	}
	
	// 매장코드의 관리자 이름과 매장 정보, 또 그 매장에 있는 알바생 코드까지
	private ArrayList<ManageBean> shopInfoAndAlbaList(ManageBean mBean) {
		return mapperM.shopInfoAndAlbaList(mBean);
	}
	
	// 매장코드의 관리자 이름과 매장 정보, 또 그 매장에 있는 알바생 코드까지
	private ModelAndView getAlbaList1Ctl(ManageBean mBean) {
		mav = new ModelAndView();
		String jsonCommuteList = gson.toJson(getAlbaList1(mBean));
		
		System.out.println("getAlbaList1:: " + jsonCommuteList);
		
		mav.addObject("albaListData",jsonCommuteList);
		
		return mav;
	}
	
	// 특정 매장에 있는 알바생들 리스트
	private ArrayList<ManageBean> getAlbaList1(ManageBean mBean){
		return mapperM.getAlbaList1(mBean);
	}
	
	// 나의 매장리스트 가져오기
	private ModelAndView workZoneManagementCtl(ManageBean mBean) {
		
		mav = new ModelAndView();
		
		String jsonData = gson.toJson(this.getMyWorkZoneList(mBean));
		
		ArrayList<ManageBean> mbTest = new ArrayList<ManageBean>();
		
		mbTest = this.getMyWorkZoneList(mBean);
	
		
		
		mav.addObject("WL", jsonData);
		

		
		mav.setViewName("myWorkZone");
		
		return mav;
	}
	
	// 주소찾아주는 창 띄우기 - 매장
	private ModelAndView searchMapCtl(ManageBean mBean) {
		
		ModelAndView mav = new ModelAndView();

		mav.setViewName("searchMap");
		return mav;
	}
	
	// 주소찾아주는 창 띄우기 - 회원가입
	private ModelAndView searchMapJoinCtl(ManageBean mBean) {
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("searchMap_join");
		
		return mav;
	}
	
	private ModelAndView goManageCodeCtl(ManageBean mBean) {
		
		mav = new ModelAndView();
		
		String ab = gson.toJson(this.getShname(mBean));
		System.out.println(">>>>나왓당" + ab);
		mav.addObject("ab", ab);
		
		return mav;
	}
	
	private ModelAndView manageStore(ManageBean mBean) {
		
		mav = new ModelAndView();
		System.out.println("manage 222222222");
		String sh = gson.toJson(this.getShname(mBean));
		System.out.println(">>>>나왓당" + sh);
		mav.addObject("sh", sh);
		
		mav.setViewName("payInsert");
		
		return mav;
	}	
	
	private ArrayList<ManageBean> getShname(ManageBean mBean) {
		return mapperM.getShname(mBean);
	}
	
	// 나의 매장리스트 가져오기 - mapper
	private ArrayList<ManageBean> getMyWorkZoneList(ManageBean mBean){
		
		return mapperM.getMyWorkZoneList(mBean);
	}
	
	
	
	private ModelAndView commuteManagementCtl(ManageBean mBean) {
		
		mav = new ModelAndView();
		
		System.out.println(mBean + " :: " + mBean.getAbCode() + mBean.getStartDate() + " ~ " + mBean.getEndDate());
		String jsonCommuteList = gson.toJson(this.getCommuteList(mBean));
		
		System.out.println("jsonCommuteList:: " + jsonCommuteList);
		mav.addObject("CommuteData",jsonCommuteList);
		
		return mav;
	}
	
	private ArrayList<ManageBean> getCommuteList(ManageBean mBean){
		return mapperM.getCommuteList(mBean);
	}
	
	// 매장에 등록된 업무리스트 조회
	private ModelAndView workCtl(ManageBean mBean) {
		mav = new ModelAndView();
		
		// 총 업무는 n개 입니다. 조회
		
		mav.addObject("typeList", gson.toJson(this.getCountTask(mBean)));

		/* View */
		mav.setViewName("work");
		return mav;
	}
	
	private ModelAndView WorkTypeCtl(ManageBean mBean) {
		mav = new ModelAndView();
		
		
		
		String selectTaskList = gson.toJson(this.typeList(mBean));
		
		System.out.println(selectTaskList);
		
		mav.addObject("typeDetail", selectTaskList);
		
		return mav;
	}
	
	// 어디 매장 업무리스트 조회
	private ArrayList<ManageBean> getAllTaskList(ManageBean mBean) {
		
		return mapperM.getAllTaskList(mBean);
	}
	
	private ArrayList<ManageBean> typeList(ManageBean mBean) {
		
		return mapperM.typeList(mBean);
	
	}
	
	// 어디 매장 알바생 업무리스트 개수(카운트) 조회
	private ArrayList<ManageBean> getCountTask(ManageBean mBean) {
		
		return mapperM.getCountTask(mBean);
	}
	
	private ModelAndView payCtl(ManageBean mBean){
		mav = new ModelAndView();
		
		String jsonData = gson.toJson(this.getPayList(mBean));
		System.out.println("넘어온 json =" + jsonData );
		
		mav.addObject("jsonData", jsonData);
		
		return mav;
	}
	
	private ArrayList<ManageBean> getPayList(ManageBean mBean){
		return mapperM.getPayList(mBean);
	}
	
	private ModelAndView payDetailCtl(ManageBean mBean) {
		
		mav = new ModelAndView();
		System.out.println(mBean.getPaName());
		System.out.println("this.getPayInfo(mBean):: " + this.getPayInfo(mBean));
		
		String detailinfo = gson.toJson(this.getPayInfo(mBean));
		mav.addObject("detailinfo", detailinfo);
	    System.out.println(detailinfo);
		
		return mav;
	}
	
	private ArrayList<ManageBean> getPayInfo(ManageBean mBean) {
		return mapperM.getPayInfo(mBean);
	}
	
	private ModelAndView paySearchCtl(ManageBean mBean){
		mav = new ModelAndView();
		
		
		String paySearch = gson.toJson(this.getPaySearch(mBean));
		System.out.println("이건 페이리스트 조회야 :: " + this.getPaySearch(mBean));
		
		mav.addObject("paySearch", paySearch);
		return mav;
	}
	
	private ArrayList<ManageBean> getPaySearch(ManageBean mBean){
		return mapperM.getPaySearch(mBean);
	}
	
	private ModelAndView payInsertCtl(ManageBean mBean) {
		
		mav = new ModelAndView();
		System.out.println("this.getPayInsert(mBean):: " + this.getPayInsert(mBean));
		
		String payInsert = gson.toJson(this.getPayInsert(mBean));
		mav.addObject("payInsert", payInsert);
	    System.out.println(payInsert);
		
		return mav;
	}
	
	private ArrayList<ManageBean> getPayInsert(ManageBean mBean) {
		return mapperM.getPayInsert(mBean);
	}
	
	private ModelAndView paySelectCtl(ManageBean mBean) {
		
		mav = new ModelAndView();
		int sum = 0;
		int start1 = 0;
		int start2 = 0;
		int end1 = 0;
		int end2 = 0;
		int rest = 0;
		int pay = 0;
		int total = 0;
		
		String[] dat = mBean.getSDate().split("-");
		
		for(int i=0; i<dat.length; i++) {
			mBean.setSDate(dat[i]);
			if(mapperM.getPaySelect(mBean)==null) {
				 start1 = 0;
				 start2 = 0;
				 end1 = 0;
				 end2 = 0;
				 rest = 0;
				 pay = 0;
			}else {
				 start1 = Integer.parseInt(mapperM.getPaySelect(mBean).substring(0,2));
				 start2 = Integer.parseInt(mapperM.getPaySelect(mBean).substring(2,4));
				 end1 = Integer.parseInt(mapperM.getPaySelect1(mBean).substring(0,2));
				 end2 = Integer.parseInt(mapperM.getPaySelect1(mBean).substring(2,4));
				 rest = mBean.getRestTime();
			}
			
			sum += (((end1*60)+end2) - ((start1*60)+start2))-rest;
			
		}
		pay = mBean.getAPay();
		
		
		
		if((sum%60)>30) {
			total = ((sum/60)*pay) + pay;
		}else {
			total = ((sum/60)*pay);
		}
		
		mBean.setTimeTotal(sum);
		mBean.setPayTotal(total);
		
		
		String gab = gson.toJson(sum) + "-" +gson.toJson(total);
		mav.addObject("gab",gab);
		
		return mav;
	}
	
	

	
	private ModelAndView scheduleCtl(ManageBean mBean) {
		
		mav = new ModelAndView();
		
		System.out.println("스케쥴 보여주세요");
		
		mav.setViewName("schedule");
		
		return mav;
	}
	
	// 근무일지
	private ModelAndView logCtl(ManageBean mBean) {
		
		mav = new ModelAndView();
		
		
		
		return mav;
	}
	
	private ArrayList<ManageBean> getLogList(ManageBean mBean){
		return mapperM.getLogList(mBean);
	}
	
	private ModelAndView logDetailCtl(ManageBean mBean) {
		
		ModelAndView mav = new ModelAndView();
		String jsonData = gson.toJson(this.getLogList(mBean));
		
		
		ArrayList<ManageBean> mbTest = new ArrayList<ManageBean>();
		mbTest = this.getLogList(mBean);
		mav.addObject("Log", jsonData);
		
		System.out.println(jsonData);
		
		
		mav.setViewName("workDiary");
		return mav;
	}
	
	private ModelAndView laborListCtl(ManageBean mBean) {
		
		mav = new ModelAndView();
		
		String jsonMbList = gson.toJson(this.laborList(mBean));
		System.out.println("laborListCtl:: " + jsonMbList);
		mav.addObject("laborData",jsonMbList);
		
		return mav;
	}
	
	private ArrayList<ManageBean> laborList(ManageBean mBean){
		return mapperM.laborList(mBean);
	}
	
	private ModelAndView laborDetailCtl(ManageBean mBean) {
		
		mav = new ModelAndView();
		
		String jsonMbList = gson.toJson(this.laborDetailSelect(mBean));
		System.out.println("laborDetailCtl:: " + jsonMbList);
		mav.addObject("laborDetailData",jsonMbList);
		
		return mav;
	}
	
	private ManageBean laborDetailSelect(ManageBean mBean) {
		return mapperM.laborDetailSelect(mBean);
	}
	
}












