package icia.oap.beans;

import lombok.Data;

@Data
public class AlbaBean {

	private String abCode;
	private String abName;
	private String shCode;
	private String shName;
	private String sCode;
	private String tCode;
	private String action;
	private String lCode;
	private String oman;
	private String man;
	private String ochun;
	private String chun;
	private String obaek;
	private String baek;
	private String osip;
	private String sip;
	private String mType;
	private int mCount;
	private String detail;
	private String note;
	private int rtType;
	private String shType;
	private String maxTime;
	private String startTime;
	private String endTime;
	private String startDate;
	private String endDate;
	private String payTotal;
	private String paName;
	private int tlNumber;
	private String tlComment;
	private String mtDetail;
	
	//2021 03 16 추가한것
	private String shAddr;
	private String shTel;
	private String abPhone;
	private String abBirth;
	private String abAddr;
	private String abEmail;
	private String abGender;
	private String acBankName;
	private String acAccount;
	private String mnName;
	private String mnPhone;
	private String shImg;
	private String applyState; // 알바 지원에서 지원할건지, 이미 지원한 회사들 정보를 클릭해서 볼때 분기
	private String ssBankName;
	private String ssAccount;
	
}
