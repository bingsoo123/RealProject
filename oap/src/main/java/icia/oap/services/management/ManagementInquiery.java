package icia.oap.services.management;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import icia.oap.beans.ManageBean;
import icia.oap.mapper.ManageMapper;

@Service
public class ManagementInquiery {
	
	@Autowired
	private ManageMapper mapperM;
	@Autowired
	private Gson gson;
	
	ModelAndView mav = null;
	
	public ManagementInquiery() {
		
	}
	
	public ModelAndView entrance(ManageBean mBean) {
		
		switch(mBean.getSCode()) {
		case "myWorkZone":
			mav = this.workZoneManagementCtl(mBean);
			break;
		
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
			
		}
		
		return mav;
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
	
	// 나의 매장리스트 가져오기 - mapper
	private ArrayList<ManageBean> getMyWorkZoneList(ManageBean mBean){
		
		return mapperM.getMyWorkZoneList(mBean);
	}
	
	// 알바생 관리 ( 현재 매장의 알바생 리스트 가져오기 ) 
	private ModelAndView albaManagementCtl(ManageBean mBean) {
		
		mav = new ModelAndView();
		
		return mav;
	}
	
	// 알바생 관리 ( 현재 매장의 알바생 리스트 가져오기 )
	private ArrayList<ManageBean> getAlbaList(ManageBean mBean){
		return mapperM.getAlbaList(mBean);
	}
	
	
	private ModelAndView albaInfoSearch(ManageBean mBean) {
		
		mav = new ModelAndView();
		
		return mav;
	}
	
	private ArrayList<ManageBean> getAlbaSearch(ManageBean mBean){
		return mapperM.getAlbaSearch(mBean);
	}
	
	private ModelAndView albaInfoDetail(ManageBean mBean) {
		
		mav = new ModelAndView();
		
		return mav;
	}
	
	private ArrayList<ManageBean> getAlbaDetailSearch(ManageBean mBean){
		return mapperM.getAlbaDetailSearch(mBean);
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
	
	private ModelAndView workCtl(ManageBean mBean) {
		
		mav = new ModelAndView();
		
		return mav;
	}
	
	private ArrayList<ManageBean> getzCode(ManageBean mBean){
		
		return mapperM.getzCode(mBean);
	}
	
	private ModelAndView selectTimeCtl(ManageBean mBean) {
		
		mav = new ModelAndView();
		
		return mav;
	}
	
	private ArrayList<ManageBean> getTypeCode(ManageBean mBean){
		return mapperM.getTypeCode(mBean);
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
		int total1 = 0;
		int test = 0;
		
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
	
	private ArrayList<ManageBean> getScheduleList(ManageBean mBean){
		return mapperM.getScheduleList(mBean);
	}
	
	private ModelAndView logCtl(ManageBean mBean) {
		
		mav = new ModelAndView();
		
		return mav;
	}
	
	private ArrayList<ManageBean> getLogList(ManageBean mBean){
		return mapperM.getLogList(mBean);
	}
	
	private ModelAndView logDetailCtl(ManageBean mBean) {
		
		mav = new ModelAndView();
		
		return mav;
	}
	
	private ModelAndView logDetailSelect(ManageBean mBean) {
		return mapperM.logDetailSelect(mBean);
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












