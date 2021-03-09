package icia.oap.beans;

import lombok.Data;

@Data
public class ManageBean {

	// 원진
	public String sCode;
	public String shName;
	public String shCode;
	public String shMnCode;
	public String shBusinessLi;
	public String shType;
	public String shAddr;
	public String shTel;
	public String shImage;
	public int workman;
	public String road;
	public String detail;
	
	// 진주
	private String abCode;
	private String lcRoot;
	private String lcName;
	private String startDate; // 출퇴근에서 선택한 날짜 처음
	private String endDate; // 출퇴근에서 선택한 날짜 마지막
	private String startTime;
	private String endTime;
	private String cmTime; // sysdate로 받을 내 실직적인 출퇴근시간
	private String cmType; // -1 퇴근 1 출근
	// 알바생 정보
	private String abName;
	private String abPhone;
    private String abAddr;
	// 매장에 관한 정보
    private String mnName; // 관리자 이름
    private String mnCode; // 관리자 코드
    
    
    
    /////////

	private String nnn;
	private String paName;
	private String sTime;
	private String eTime;
	private String aPhone;
	private int aPay;
	private int restTime;
	private int timeTotal;
	private int payTotal;
	private String sDate;
		
}
