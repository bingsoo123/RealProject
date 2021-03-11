package icia.oap.mapper;

import java.util.ArrayList;

import icia.oap.beans.AuthBean;
import icia.oap.beans.Money;

public interface AuthMapper {

	public int joinCheck(AuthBean auBean);

	public int joinInsert(AuthBean auBean);

	public int isMemberManage(AuthBean auBean);
	
	public int isMemberAlba(AuthBean auBean);

	public int isPasswordManage(AuthBean auBean);
	
	public int isPasswordAlba(AuthBean auBean);

	public int insertCommute(AuthBean auBean);

	public int logInQr(AuthBean auBean);

	public int leaveQr(AuthBean auBean);

	public Money getStartWork();
	
	public String maxCode();

	public int accountInsert(AuthBean auBean);

	public String getAlbaCode(AuthBean auBean);

	public String getManageCode(AuthBean auBean);

	public String getDbPw(AuthBean auBean);

}
