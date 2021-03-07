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
			
		}
		
		return mav;
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
		
		return mav;
	}
	
	private ArrayList<ManageBean> getPayList(ManageBean mBean){
		return mapperM.getPayList(mBean);
	}
	
	private ModelAndView payDetailCtl(ManageBean mBean) {
		
		mav = new ModelAndView();
		
		return mav;
	}
	
	private ManageBean getPayInfo(ManageBean mBean) {
		return mapperM.getPayInfo(mBean);
	}
	
	private ModelAndView paySelectCtl(ManageBean mBean) {
		
		mav = new ModelAndView();
		
		return mav;
	}
	
	private ArrayList<ManageBean> getPayDate(ManageBean mBean){
		return mapperM.getPayDate(mBean);
	}
	
	private ModelAndView scheduleCtl(ManageBean mBean) {
		
		mav = new ModelAndView();
		
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












