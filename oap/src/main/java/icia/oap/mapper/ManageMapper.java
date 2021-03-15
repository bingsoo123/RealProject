package icia.oap.mapper;

import java.util.ArrayList;

import org.springframework.web.servlet.ModelAndView;

import icia.oap.beans.ManageBean;

public interface ManageMapper {

	//    Inquiery
	
	public int isLabor(ManageBean mBean);
	
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
	
	public ArrayList<ManageBean> getAllTaskList(ManageBean mBean); // 클래스 없어서 추가 -> 어디 매장의 업무 리스트 전체 조회
	
	public ArrayList<ManageBean> getCountTask(ManageBean mBean); // 클래스 설계 없어서 추가
	
	public ArrayList<ManageBean> getNameData(ManageBean mBean); // 클래스 설계 없어서 추가
	
	public ArrayList<ManageBean> getCommentData(ManageBean mBean); // 클래스 설계 없어서 추가
	
	public ArrayList<ManageBean> typeList(ManageBean mBean); // type 별로 클릭햇을때 그에대한 상세정보 출력

	public ArrayList<ManageBean> getShname(ManageBean mBean);
	
	public int isSchedule(ManageBean mBean);
	
	public ArrayList<ManageBean> getPaySearch(ManageBean mBean);
	
	//   Enroll       ( 등록 )

	public int inspaylist1(ManageBean mBean);
	
	public int inspaylist2(ManageBean mBean);
	
	public int addWork(ManageBean mBean);

	public int addSchedule(ManageBean mBean);
	
	public int laborAdd(ManageBean mBean);
	
	public int workAddComplete(ManageBean mBean);// 실제로 추가 insert 하는 역활
	
	
	
	//  Modify   ( 수정 )

	public int change(ManageBean mBean);

	public int drop(ManageBean mBean);

	public int deleteSchedule(ManageBean mBean);

	public ManageBean getDeleteLaborLcRoot(ManageBean mBean);

	public int laborDelete(ManageBean mBean);

	public ArrayList<ManageBean> getDayWork(ManageBean mBean);

	public int payCount(ManageBean mBean);


	
	

	

	

	




}
