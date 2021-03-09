package icia.oap.mapper;

import java.util.ArrayList;

import org.springframework.web.servlet.ModelAndView;

import icia.oap.beans.ManageBean;

public interface ManageMapper {

	//    Inquiery
	
	public ArrayList<ManageBean> getMyWorkZoneList(ManageBean mBean);

	public ArrayList<ManageBean> getAlbaList(ManageBean mBean);

	public ArrayList<ManageBean> getAlbaSearch(ManageBean mBean);

	public ArrayList<ManageBean> getAlbaDetailSearch(ManageBean mBean);

	public ArrayList<ManageBean> getCommuteList(ManageBean mBean);

	public ArrayList<ManageBean> getzCode(ManageBean mBean);

	public ArrayList<ManageBean> getTypeCode(ManageBean mBean);

	public ArrayList<ManageBean> getPayList(ManageBean mBean);

	public ArrayList<ManageBean> getPayInfo(ManageBean mBean);
	
	public ArrayList<ManageBean> getPayInsert(ManageBean mBean);

	public ArrayList<ManageBean> getScheduleList(ManageBean mBean);

	public ArrayList<ManageBean> getLogList(ManageBean mBean);

	public ModelAndView logDetailSelect(ManageBean mBean);

	public ArrayList<ManageBean> laborList(ManageBean mBean);

	public ManageBean laborDetailSelect(ManageBean mBean);
	
	public ArrayList<ManageBean> shopInfoAndAlbaList(ManageBean mBean);
	
	public ArrayList<ManageBean> getLaborAlbaInfoList(ManageBean mBean);
	
	public ArrayList<ManageBean> getAlbaList1(ManageBean mBean);
	
	public String getPaySelect(ManageBean mBean);
	
	public String getPaySelect1(ManageBean mBean);
	
	public ArrayList<ManageBean> getSelectShopList(ManageBean mBean);
	
	
	//   Enroll       ( 등록 )

	public int workAdd(ManageBean mBean);

	public int addWork(ManageBean mBean);

	public int addSchedule(ManageBean mBean);
	
	public int laborAdd(ManageBean mBean);
	
	
	
	//  Modify   ( 수정 )

	public int change(ManageBean mBean);

	public int drop(ManageBean mBean);

	public int deleteSchedule(ManageBean mBean);

	public ManageBean getDeleteLaborLcRoot(ManageBean mBean);

	public int laborDelete(ManageBean mBean);

	

	

	




}
