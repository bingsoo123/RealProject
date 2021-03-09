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
}
