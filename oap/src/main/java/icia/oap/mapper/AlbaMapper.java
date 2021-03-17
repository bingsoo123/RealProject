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
}
