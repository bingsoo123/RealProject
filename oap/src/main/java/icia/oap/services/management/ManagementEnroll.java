package icia.oap.services.management;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.UUID;

import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import icia.oap.beans.ManageBean;
import icia.oap.mapper.ManageMapper;

@Service
public class ManagementEnroll {
	
	@Autowired
	private ManageMapper mapperM;
	@Autowired
	private PlatformTransactionManager tran;
	@Autowired
	private Gson gson;
	
	ModelAndView mav = null;
	
	public ManagementEnroll() {
		
		
	}
	
	public ModelAndView entrance(ManageBean mBean) {
		
		
		switch(mBean.getSCode()) {
		case "addWorkZone":
			mav = this.addWorkZoneCtl(mBean);
			break;
		case "laborAdd":
			// [추가] -> [계약서 작성] 후 완료버튼 눌렀을때.
			mav = this.laborAddCtl(mBean);
			break;
		case "WorkAdd":
			mav = workAddCtl(mBean);
			break;
			
		case "WorkAddComplete":
			mav = workAddCompleteCtl(mBean);
			break;
        case "insPay":
				mav = this.insPayCtl(mBean);
				break; 	
		case "AddSchedule":
			mav = this.addScheduleCtl(mBean);
			break;
		case "albaManagementAddComplete":
			mav = this.albaManagementAddCompleteCtl(mBean);
			break;
		
		}
		
		return mav;
	}
	
	private ModelAndView albaManagementAddCompleteCtl(ManageBean mBean) {
		mav = new ModelAndView();
		int insertState = -1;
		System.out.println("-----------");
		System.out.println(mBean.getAbCode());
		System.out.println(mBean.getShCode());
		System.out.println(mBean.getMrGrade());
		System.out.println(mBean.getSiaPay());
		System.out.println(mBean.getRestTime());
		System.out.println(mBean.getSsAccount());
		
		if(this.albaManagementAddComplete(mBean)) {
			insertState = 1;
			// 등록을 완료했다면 SS 테이블에서 삭제.
			if(this.albaManagementAddDelete(mBean)) {
				System.out.println("알바 등록및 삭제 완료");
			}
		}else {
			insertState = 0;
		}
		
		mav.addObject("insertState",insertState);
		return mav;
	}
	
	private boolean albaManagementAddComplete(ManageBean mBean) {
		return convertToBoolean(mapperM.albaManagementAddComplete(mBean));
	}
	private boolean albaManagementAddDelete(ManageBean mBean) {
		return convertToBoolean(mapperM.albaManagementAddDelete(mBean));
	}
	
	
	private ModelAndView insPayCtl(ManageBean mBean) {

		TransactionStatus status = tran.getTransaction(new DefaultTransactionDefinition());

		String insPayState;
		mav = new ModelAndView();

		if (true != this.payCount(mBean)) {

			if (this.inspaylist1(mBean)) {
				System.out.println("pa성공");
				if (this.inspaylist2(mBean)) {
					System.out.println("pd성공");
					tran.commit(status);
					insPayState = "1";
				} else {
					System.out.println("pd불가능");
					insPayState = "0";
				}
			} else {
				System.out.println("pa불가능");
				insPayState = "0";
			}
		} else {
			System.out.println("똑같은 값이 있단다.");
			insPayState = "-1";
		}

		mav.addObject("insPayState", insPayState);

		return mav;
	}
	
	private boolean payCount(ManageBean mBean) {
	      return convertToBoolean(mapperM.payCount(mBean));
	   }
	
	private boolean inspaylist1(ManageBean mBean) {
		return convertToBoolean(mapperM.inspaylist1(mBean));
	}
	
	private boolean inspaylist2(ManageBean mBean) {
		return convertToBoolean(mapperM.inspaylist2(mBean));
	}
	
	private ArrayList<ManageBean> getShname(ManageBean mBean) {
		return mapperM.getShname(mBean);
	}
	
	private ModelAndView laborAddCtl(ManageBean mBean) {
		if(!this.isLabor(mBean)) {
			mav = new ModelAndView();
			FileOutputStream stream = null;
			String binaryData = mBean.getLcName();
			System.out.println("ImgSaveTest 메서드 실행");
			try{
				System.out.println("mBean.getLcName() "  + binaryData);
				if(binaryData == null || binaryData.trim().equals("")) {
				    throw new Exception();
				}
				binaryData = binaryData.replaceAll("data:image/png;base64,", "");
				byte[] file = Base64.decodeBase64(binaryData);
				String fileNameUUID =  UUID.randomUUID().toString();
				String laborfileName = "_" + mBean.getShCode() + "_" + mBean.getAbCode();
				//String laborPath = "C:/Users/sacri/git/ALBATAPA/oap/src/main/webapp/resources/laborContract/";
				String laborPath = "C:/Users/CHAE BIN SU/git/repository/oap/src/main/webapp/resources/laborContract/";
				mBean.setLcRoot(laborPath +fileNameUUID+ laborfileName +".png");
				//파일 씀
				stream = new FileOutputStream(mBean.getLcRoot());
				stream.write(file);
				stream.close();
				
				if(laborAdd(mBean)) {
					System.out.println("정상적으로 DB에 삽입 완료");
					mav.addObject("laborRoot", mBean.getLcRoot());
				}
			}catch(Exception e){
				e.printStackTrace();
				System.out.println("에러 발생");
			}finally{
				if(stream != null) {
					try {
						stream.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}else {
			mBean.setLcRoot("-1");
			mav.addObject("laborRoot", mBean.getLcRoot()); // lcroot가 -1 이면 이미 있는것 처리 .... (jsp단에서)
			
		}
		return mav;
	}
	
	//
	private boolean isLabor(ManageBean mBean) {
		return convertToBoolean(mapperM.isLabor(mBean));
	}
	
	private boolean laborAdd(ManageBean mBean){
		return convertToBoolean(mapperM.laborAdd(mBean));
	}
	
	
	// 매장추가하기
	private ModelAndView addWorkZoneCtl(ManageBean mBean) {
	
		ModelAndView mav = new ModelAndView();
	
		mav.addObject("Road", mBean.getRoad());
		mav.addObject("detail", mBean.getDetail());

		mav.setViewName("addWorkZone");
		return mav;
	}
	
	// 업무 추가 버튼 누르면 작동하는 메소드
	private ModelAndView workAddCtl(ManageBean mBean) {
		
		mav = new ModelAndView();
		
		/* Work Info & Convert to JSON */
		String nameData = gson.toJson(this.selectName(mBean));
		System.out.println(nameData);
		mav.addObject("nameData", nameData);
		
		String tlComment = gson.toJson(this.selectComment(mBean));
		System.out.println(tlComment);
		mav.addObject("commentData", tlComment);
		
		mav.setViewName("addWork");
		return mav;
	}
	
	private ArrayList<ManageBean> selectName(ManageBean mBean) {
		return mapperM.getNameData(mBean);
	}
	
	private ArrayList<ManageBean> selectComment(ManageBean mBean) {
		return mapperM.getCommentData(mBean);
	}
	
	private boolean convertToBoolean(int data) {
		return (data==1)?true : false;
	}
	
	private ModelAndView workAddCompleteCtl(ManageBean mBean) {
		
		mav = new ModelAndView();
		mav.addObject("test",this.workAddComplete(mBean));
		return mav;
	}
	
	// 업무추가 입력후  추가하기 버튼 
	private boolean workAddComplete(ManageBean mBean) {
		
		return this.convertToBoolean(mapperM.workAddComplete(mBean));
	}
	
	
	private ModelAndView addScheduleCtl(ManageBean mBean) {
		mav = new ModelAndView();
		System.out.println("addScheduleCtl:: " + mBean);
		
		String stCodeArr [] = mBean.getStCode().split(",");
		String insertState = "0"; 
		
		for(int i = 0; i < stCodeArr.length; i++) { // 요일코드에 따라 insert 갯수.
			mBean.setStCode(stCodeArr[i]);
			if(this.isSchedule(mBean)) {
				insertState  = "-1";
				System.out.println("이미 있는 데이터");
			}else {
				if(this.addSchedule(mBean)) {
					System.out.println(mBean.getStCode() + "에 관한 insert " + i + "번째" );
					insertState = "1"; 
				}else {
					System.out.println(mBean.getStCode() + "에 관해 insert를 실패하였습니다");
					insertState = "0";
				}
				
			}
		}
		System.out.println(insertState);
		mav.addObject("insertState", insertState);
		return mav;
	}
	// 일정 관리 INSERT를 하기 위한 원래 있는 데이터냐 검사 .. 조회쪽에 넣어야하나? 잘모르겠음.
	private boolean isSchedule(ManageBean mBean) {
		return this.convertToBoolean(mapperM.isSchedule(mBean));
	}
	
	// 일정추가하기 버튼 >> INSERT
	private boolean addSchedule(ManageBean mBean) {
		return this.convertToBoolean(mapperM.addSchedule(mBean));
	}
	
}













