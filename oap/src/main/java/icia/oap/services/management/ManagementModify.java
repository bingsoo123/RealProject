package icia.oap.services.management;

import java.io.File;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import icia.oap.beans.ManageBean;
import icia.oap.mapper.ManageMapper;

@Service
public class ManagementModify {

	ModelAndView mav = null;
	
	@Autowired
	private ManageMapper mapperM;
	@Autowired
	private PlatformTransactionManager tran;
	@Autowired
	private Gson gson;
	public ManagementModify() {
		
	}
	

	public ModelAndView entrance(ManageBean mBean) {
		
		switch (mBean.getSCode()) {
		case "laborDelete":
			mav = this.laborDeleteCtl(mBean);
			break;
		case "Change":
			mav = this.changeCtl(mBean);
			break;
			
		case "ChangeComplete":
			mav = this.changeComplete(mBean);
			break;
			
		case "Drop":
			mav = this.dropCtl(mBean);
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
			
			System.out.println("shCode :" + mBean.getShCode() + "  abCode :" + mBean.getAbCode() + "의 경로 " + mBean.getLcRoot());
			System.out.println("mBean.getAbCode()::" + mBean.getAbCode());
			if(this.laborDelete(mBean)) { // DB에서의 삭제. 아래에 파일관련된건 파일이 있으면 삭제하고. 없으면 출력문 띄우게 해놨음.
				System.out.println("삭제 " + i+1 + "스택");
				// deleteStateText = "선택하신 계약서를 삭제 하였습니다.";
				deleteStateText = 1;
			}else {
				deleteStateText = -1; // 삭제 실패
			}
			
			File file = new File(mBean.getLcRoot());
			if( file.exists() ){ 
				if(file.delete()){
					System.out.println(mBean.getLcRoot() + "경로의 파일 삭제 완료.");
				}
			}else {
				System.out.println(mBean.getLcRoot() + "는 존재하지 않음.");
				// deleteStateText = "파일이 존재하지 않습니다.";
	//			 deleteStateText = 0;
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
	
	// 업무수정
	private ModelAndView changeCtl(ManageBean mBean) {
		
		mav = new ModelAndView();
		
		// 매장정보 가져오기
		String nameData = gson.toJson(this.selectName(mBean));
		System.out.println(nameData);
		mav.addObject("nameData", nameData);
		
		// 업무타입 가져오기
		String tlComment = gson.toJson(this.selectComment(mBean));
		System.out.println(tlComment);
		mav.addObject("commentData", tlComment);
		
		// mtDetail 가져오기
		String allTaskList = gson.toJson(this.getAllTaskList(mBean));
		System.out.println(allTaskList);
		mav.addObject("allTaskList", allTaskList);
		
		mav.addObject("mtDetail", mBean.getMtDetail());
		
		mav.setViewName("editWork");
		
		return mav;
	}
	
	private ModelAndView changeComplete(ManageBean mBean) {
		
		mav = new ModelAndView();
		
		// update 설정만 해두기
		String changeTaskList = gson.toJson(this.change(mBean));
		mav.addObject("changeTaskList", changeTaskList);
		
		mav.setViewName("editWork");
		
		return mav;
	}
	
	
	// update 설정만 해두기
	private boolean change(ManageBean mBean) {
		return this.convertToBoolean(mapperM.change(mBean));
	}
	
	// 매장정보 가져오기
	private ArrayList<ManageBean> selectName(ManageBean mBean) {
		return mapperM.getNameData(mBean);
	}
	
	// 업무타입 가져오기
	private ArrayList<ManageBean> selectComment(ManageBean mBean) {
		return mapperM.getCommentData(mBean);
	}
	
	// 매장정보 가져오기
		private ArrayList<ManageBean> getAllTaskList(ManageBean mBean) {
			return mapperM.getAllTaskList(mBean);
	}


	private boolean convertToBoolean(int data) {
		return (data==1)?true:false;
	}
	
	private ModelAndView dropCtl(ManageBean mBean) {
		
		mav = new ModelAndView();
		String deleteState;
		
		if(this.drop(mBean)) {
			deleteState = "1";
		}else {
			deleteState = "0";
		}
		System.out.println("deleteState"+deleteState);
		mav.addObject("deleteState", deleteState);
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










