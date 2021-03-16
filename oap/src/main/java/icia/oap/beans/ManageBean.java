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
	private String stCode;
	// 2021-03-13 추가한것. 진주
	private String siaPay; // sia테이블이 제일 최상위인 급여인거같아서 만듬.
	private String siaDate; // 입사 날짜.
	private String abEmail;
	private String ssBankName;
	private String ssAccount;
	private String mrGrade; // 등급
	private String workCmTime; // 출근 시간
	private String leaveCmTime; // 퇴근 시간
	private String acBankName;
	private String acAccount;
	// type은 cmType으로
	
	// 알바생 정보
	private String abName;
	private String abPhone;
    private String abAddr;
	// 매장에 관한 정보
    private String mnName; // 관리자 이름
    private String mnCode; // 관리자 코드
    
    // 급여
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
		
	//근무일지
	public String wltime;
	public String workTime;
	public String moneyt;
	public String mCount;
	public String rtTime;
	public String rtType;
	public String note;
	
	
	// 업무관리
	public String zCode;
	public int tlNumber;
	public String tlComment;
	public String mtDetail;
	private String editMtDetail;
	private String editTlNumber;
	
	// 알바생관리
	private String abGender;
	private String abId;
	private String abBirth;
	private String Account;
	private String rsName;
	private String bName;
	
	
	
	//일정 추가 쪽에서 쓰는 컬럼
	private String startDay;
	

	
	
	
	
	
	

}
