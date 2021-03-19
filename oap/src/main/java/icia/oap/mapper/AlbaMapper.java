package icia.oap.mapper;

import java.util.ArrayList;

import icia.oap.beans.AlbaBean;
import icia.oap.beans.Money;

public interface AlbaMapper {

	
	public ArrayList<Money> getMoneyList(AlbaBean aBean);
	
	public String maxNote();
	
	public String maxTime(AlbaBean aBean);

	public int insertRt(AlbaBean aBean);

	public int insertRd(AlbaBean aBean);

	public ArrayList<AlbaBean> myAlbaZone(AlbaBean aBean);

	public ArrayList<AlbaBean> getPayCheck(AlbaBean aBean);
	
	public ArrayList<AlbaBean> getAlbaTaskListSelect(AlbaBean aBean);
	
	public ArrayList<AlbaBean> getAlbaShopList(AlbaBean aBean);
	
	public int getAlbaTaskListSelectCount(AlbaBean aBean);

	public ArrayList<AlbaBean> albaInclueShopInfo(AlbaBean aBean);

	public ArrayList<AlbaBean> albaMyInfo(AlbaBean aBean);
	
	// 지원 계좌를 수정하기 위한 내 정보
	public ArrayList<AlbaBean> albaApplyShopMyInfo(AlbaBean aBean);
	// 지원 계좌 수정
	public int albaApplyMyAccountUpdate(AlbaBean aBean);
	// 지원 취소
	public int albaApplyDelete(AlbaBean aBean);
	//내가 지원한 매장 리스트
	public ArrayList<AlbaBean> albaApplyMyShopInquiry(AlbaBean aBean);
	// 내가 이 매장에 이미 지원했는지 체크.
	public int albaApplyAlreadyCheck(AlbaBean aBean);
	
	// 알바가 매장에 지원 성공 insert
	public int albaApplyComplete(AlbaBean aBean);
	// 알바 지원 매장 상세 정보
	public AlbaBean albaApplyShopDetailInfo(AlbaBean aBean);
	// 알바 지원 매장 리스트
	public ArrayList<AlbaBean> albaApplyShopInfo(AlbaBean aBean);
	// 알바 지원 나의 정보
	public ArrayList<AlbaBean> albaApplyMyInfo(AlbaBean aBean);

	public ArrayList<AlbaBean> getScheduleList(AlbaBean aBean);

	public int insertCheckList(AlbaBean aBean);
	
	public ArrayList<AlbaBean> albaApplyShopAddressSearch(AlbaBean aBean);
	public ArrayList<AlbaBean> albaApplyShopNameSearch(AlbaBean aBean);
	
	// 지원하기 (insert) 전에 내가 이 매장에 이미 근무하고있는지 체크하기 위한것
	public int isAlreadyApplyInfo(AlbaBean aBean);
	
	
	//알바생 정보 조회
	public ArrayList<AlbaBean> getAlbaInfo(AlbaBean aBean);
	
	//알바생 정보 수정
	public int editName(AlbaBean aBean);
	
	public int editPassword(AlbaBean aBean);
	
	public int editAccount(AlbaBean aBean);
	
	public int deleteAccount(AlbaBean aBean);
	
	public int addAccount(AlbaBean aBean);
	
	// 지원서 계좌가 있는지 확인
	public int countSsAccount(AlbaBean aBean);
	
	// 매장에 포함된 알바의 계좌가 있는지 확인
	public int countSiaAccount(AlbaBean aBean);
}








