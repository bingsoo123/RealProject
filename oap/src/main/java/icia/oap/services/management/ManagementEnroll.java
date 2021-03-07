package icia.oap.services.management;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.UUID;

import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.web.servlet.ModelAndView;

import icia.oap.beans.ManageBean;
import icia.oap.mapper.ManageMapper;

@Service
public class ManagementEnroll {
	
	@Autowired
	private ManageMapper mapperM;
	@Autowired
	private PlatformTransactionManager tran;
	
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
		
		
		}
		
		return mav;
	}
	
	private ModelAndView laborAddCtl(ManageBean mBean) {
		mav = new ModelAndView();
		FileOutputStream stream = null;
		String binaryData = mBean.getLcName();
		System.out.println("ImgSaveTest 메서드 실행");
		// mBean.setAbCode("100000003"); // 임의로 넣은것, 근로계약서는 어떻게 abCode를 넣을지 구상..
		// 적을때 id를 적게해서.. abcode를 불러올까?
		try{
			System.out.println("mBean.getLcName() "  + binaryData);
			if(binaryData == null || binaryData.trim().equals("")) {
			    throw new Exception();
			}
			binaryData = binaryData.replaceAll("data:image/png;base64,", "");
			byte[] file = Base64.decodeBase64(binaryData);
			String fileNameUUID =  UUID.randomUUID().toString();
			String laborfileName = "_" + mBean.getShCode() + "_" + mBean.getAbCode();
			// String laborPath =  request.getSession().getServletContext().getRealPath("/resources/laborContract/");
			// String laborPath = "C:/Users/Gaon/git/repository/oap/src/main/webapp/resources/laborContract/";
			//String laborPath = "C:/Users/sacri/git/ALBATAPA/oap/src/main/webapp/resources/laborContract/";
			String laborPath = "C:/Users/CHAE BIN SU/git/repository/oap/src/main/webapp/resources/laborContract/";
			mBean.setLcRoot(laborPath +fileNameUUID+ laborfileName +".png");
			//파일 씀
			stream = new FileOutputStream(mBean.getLcRoot());
			stream.write(file);
			stream.close();
			
			if(laborAdd(mBean)) {
				System.out.println("정상적으로 DB에 삽입 완료");
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
		return mav;
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
	
	private ModelAndView workAddCtl(ManageBean mBean) {
		
		mav = new ModelAndView();
		
		return mav;
	}
	
	// 업무추가하기 >>>>
	private boolean workAdd(ManageBean mBean) {
		return this.convertToBoolean(mapperM.workAdd(mBean));
	}
	
	private boolean convertToBoolean(int data) {
		return (data==1)?true : false;
	}
	
	private ModelAndView addWorkCtl(ManageBean mBean) {
		
		mav = new ModelAndView();
		
		return mav;
	}
	// 업무추가 입력후  추가하기 버튼 
	private boolean addWork(ManageBean mBean) {
		
		return this.convertToBoolean(mapperM.addWork(mBean));
	}
	
	private ModelAndView addScheduleCtl(ManageBean mBean) {
		
		mav = new ModelAndView();
		
		return mav;
	}
	
	private boolean addSchedule(ManageBean mBean) {
		return this.convertToBoolean(mapperM.addSchedule(mBean));
	}
	
}













