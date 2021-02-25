package icia.oap.mapper;

import java.util.ArrayList;

import org.springframework.web.servlet.ModelAndView;

import icia.oap.beans.ManageBean;

public interface ManageMapper {

	public ArrayList<ManageBean> getMyWorkZoneList(ManageBean mBean);

	public ArrayList<ManageBean> getAlbaList(ManageBean mBean);

	public ArrayList<ManageBean> getAlbaSearch(ManageBean mBean);

	public ArrayList<ManageBean> getAlbaDetailSearch(ManageBean mBean);

	public ArrayList<ManageBean> getCommuteList(ManageBean mBean);

	public ArrayList<ManageBean> getzCode(ManageBean mBean);

	public ArrayList<ManageBean> getTypeCode(ManageBean mBean);

	public ArrayList<ManageBean> getPayList(ManageBean mBean);

	public ManageBean getPayInfo(ManageBean mBean);

	public ArrayList<ManageBean> getPayDate(ManageBean mBean);

	public ArrayList<ManageBean> getScheduleList(ManageBean mBean);

	public ArrayList<ManageBean> getLogList(ManageBean mBean);

	public ModelAndView logDetailSelect(ManageBean mBean);

	public ArrayList<ManageBean> larborList(ManageBean mBean);

	public ModelAndView larborDetailSelect(ManageBean mBean);


}
