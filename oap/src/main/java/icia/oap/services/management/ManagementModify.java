package icia.oap.services.management;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.web.servlet.ModelAndView;

import icia.oap.beans.ManageBean;
import icia.oap.mapper.ManageMapper;

@Service
public class ManagementModify {

	ModelAndView mav = null;
	
	@Autowired
	private ManageMapper mapperM;
	@Autowired
	private PlatformTransactionManager tran;
	
	public ManagementModify() {
		
	}
	

	public ModelAndView entrance(ManageBean mBean) {
		
		switch (mBean.getSCode()) {
		case "laborDelete":
			mav = this.laborDeleteCtl(mBean);
			break;
		default:
			break;
		}
		
		return mav;
	}
	
	private ModelAndView laborDeleteCtl(ManageBean mBean) {
		mav = new ModelAndView();
		
		// laborDelete(mBean); // 배열에 abCode
		String [] abCodeArr = mBean.getAbCode().split(",");
		int deleteStateText;
		for(int i = 0; i< abCodeArr.length; i++) {
			System.out.println("SHCODE:"+ mBean.getShCode() );
			System.out.println("ABCODE: " + abCodeArr[i]);
			mBean.setAbCode(abCodeArr[i]);
			
			mBean = this.getDeleteLaborLcRoot(mBean);
			
			System.out.println("mBean.getLcRoot() :: " + mBean.getLcRoot());
			
			File file = new File(mBean.getLcRoot());
			if( file.exists() ){
				if(file.delete()){
					System.out.println("shCode :" + mBean.getShCode() + "  abCode :" + mBean.getAbCode() + "의 경로 " + mBean.getLcRoot());
					System.out.println("mBean.getAbCode()::" + mBean.getAbCode());
					this.laborDelete(mBean); // 삭제
					System.out.println("삭제 " + i+1 + "스택");
					// deleteStateText = "선택하신 계약서를 삭제 하였습니다.";
					deleteStateText = 1;
				}else{
					// deleteStateText = "계약서 삭제 실패";
					deleteStateText = -1;
				} 
			}else{
				// deleteStateText = "파일이 존재하지 않습니다.";
				deleteStateText = 0;
			}
			mav.addObject("deleteStateText",deleteStateText);
			
		}
		
		return mav;
	}
	
	// [근로계약서] 삭제 눌렀을때 매장코드, 알바 코드로 그 삭제 누른 사람의 근로계약서 이미지 경로 (lcRoot)
	private ManageBean getDeleteLaborLcRoot(ManageBean mBean) {
		return mapperM.getDeleteLaborLcRoot(mBean);
	}
	// [근로계약서] 삭제
	private boolean laborDelete(ManageBean mBean){
		return convertToBoolean(mapperM.laborDelete(mBean));
	}
	
	private ModelAndView changeCtl(ManageBean mBean) {
		
		mav = new ModelAndView();
		
		return mav;
	}
	
	private boolean change(ManageBean mBean) {
		return this.convertToBoolean(mapperM.change(mBean));
	}


	private boolean convertToBoolean(int data) {
		return (data==1)?true:false;
	}
	
	private ModelAndView dropCtl(ManageBean mBean) {
		
		mav = new ModelAndView();
		
		return mav;
	}
	
	private boolean drop(ManageBean mBean) {
		return this.convertToBoolean(mapperM.drop(mBean));
	}
	
	private ModelAndView deleteScheduleCtl(ManageBean mBean) {
		
		mav = new ModelAndView();
		
		return mav;
	}
	
	private boolean deleteSchedule(ManageBean mBean) {
		return this.convertToBoolean(mapperM.deleteSchedule(mBean));
	}
	
}










