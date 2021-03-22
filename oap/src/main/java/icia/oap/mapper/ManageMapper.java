package icia.oap.mapper;

import java.util.ArrayList;

import org.springframework.web.servlet.ModelAndView;

import icia.oap.beans.ManageBean;

public interface ManageMapper {

	//    Inquiery
	
	
	// 해당 알바생의 계정에 등록된 계좌 정보 가져오기
	public ArrayList<ManageBean> getAccountInfo(ManageBean mBean);
	
	public int accountInfoUpdate(ManageBean mBean);
	
	public ManageBean getCommuteTime(ManageBean mBean); // type은 cmType으로 설정.
	
	public int albaManagementAddDelete(ManageBean mBean);
	
	public int albaManagementAddComplete(ManageBean mBean);
	
	public ArrayList<ManageBean> albaManagementAddList(ManageBean mBean);
	
	public ManageBean albaManagementAddSelect(ManageBean mBean);
	
	public ManageBean getAlbaDetailSearch(ManageBean mBean);
	
	public ArrayList<ManageBean> getShopAlba(ManageBean mBean);
	
	public int isLabor(ManageBean mBean);
	
	public ArrayList<ManageBean> getMyWorkZoneList(ManageBean mBean);

	public ArrayList<ManageBean> getAlbaList(ManageBean mBean);

	public ArrayList<ManageBean> getAlbaSearch(ManageBean mBean);


	public ArrayList<ManageBean> getCommuteList(ManageBean mBean);

	public ArrayList<ManageBean> getzCode(ManageBean mBean);

	public ArrayList<ManageBean> getTypeCode(ManageBean mBean);

	public ArrayList<ManageBean> getPayList(ManageBean mBean);

	public ArrayList<ManageBean> getPayInfo(ManageBean mBean);
	
	public ArrayList<ManageBean> getPayInsert(ManageBean mBean);

	public ArrayList<ManageBean> getScheduleList(ManageBean mBean);
	
	public int getCountCheckList(ManageBean mBean);

	public ArrayList<ManageBean> getLogList(ManageBean mBean);
	
	public ArrayList<ManageBean> getLogList2(ManageBean mBean);
	
	public ArrayList<ManageBean> getNote(ManageBean mBean);

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
	
	public ArrayList<ManageBean> getWorkManList(ManageBean mBean);
	
	public ArrayList<ManageBean> getSearchWork(ManageBean mBean);
	
	public String maxShCode(ManageBean mBean);
	
	public int getCountWorkList(ManageBean mBean);
	
	//   Enroll       ( 등록 )

	public int inspaylist1(ManageBean mBean);
	
	public int inspaylist2(ManageBean mBean);
	
	public int addWork(ManageBean mBean);

	public int addSchedule(ManageBean mBean);
	
	public int laborAdd(ManageBean mBean);
	
	public int workAddComplete(ManageBean mBean);// 실제로 추가 insert 하는 역활
	
	public ArrayList<ManageBean> getWorkAlbaList(ManageBean mBean); // 매장에서 일하는 알바생 리스트 가져옴
	
	public int workAddDetail(ManageBean mBean);
	
	
	
	//  Modify   ( 수정 )

	public int change(ManageBean mBean);

	public int drop(ManageBean mBean);

	public int deleteSchedule(ManageBean mBean);

	public ManageBean getDeleteLaborLcRoot(ManageBean mBean);

	public int laborDelete(ManageBean mBean);

	public ArrayList<ManageBean> getDayWork(ManageBean mBean);

	public int payCount(ManageBean mBean);

	//delete 관련 메서드
	public int rotationDetailDelete(ManageBean mBean); // RD 시제 상세
	
	public int rotationDelete(ManageBean mBean); // RT 시제 테이블 
	
	public int payDetailDelete(ManageBean mBean); // PD 지급 내역
	
	public int workLogDelete(ManageBean mBean); // WL 근무 일지 
	
	public int laborContractDelete(ManageBean mBean); // LC 근로 계약서  
	
	public int payDelete(ManageBean mBean); // PA 급여 테이블
	
	// 업무 관리테이블은 연관X 여서 안지움.
	
	public int commuteDelete(ManageBean mBean); // CM 출퇴근 관리
	
	public int scheduleDelete(ManageBean mBean); // SC 일정 관리 
	
	public int shopIncludeAlbaDelete(ManageBean mBean); // SIA 매장에 있는 알바생 정보
	
	public int managementDetailDelete(ManageBean mBean); // 업무 관리 디테일 정보
	
	// 알바 지원한거 지원 취소 시키는것.
	public int albaApplyCancel(ManageBean mBean);
	
	// 구인중? 구인안함?
	public int updateApplyCode(ManageBean mBean);
	
	public int workZoneInsert(ManageBean mBean);
	

	





	
	

	

	

	




}
