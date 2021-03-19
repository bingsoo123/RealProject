package icia.oap.services.alba;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import icia.oap.beans.AlbaBean;
import icia.oap.mapper.AlbaMapper;

@Service
public class AlbaModify {

	ModelAndView mav = null;

	@Autowired
	private AlbaMapper mapperW;
	@Autowired
	private Gson gson;
	@Autowired
	private PlatformTransactionManager tran;

	public AlbaModify() {

	}

	public ModelAndView entrance(AlbaBean aBean) {

		switch (aBean.getAction()) {

		case "albaApplyDelete":
			mav = this.albaApplyDeleteCtl(aBean);
			break;
		case "albaApplyMyAccountUpdate":
			mav = this.albaApplyMyAccountUpdateCtl(aBean);
			break;
		case "Modify":
			mav = this.modifyCtl(aBean);
			break;
		case "ModifyComplete":
			mav = this.modifyCompleteCtl(aBean);
			break;
		case "ModifyComplete2":
			mav = this.modifyComplete2Ctl(aBean);
			break;
		case "ModifyComplete3":
			mav = this.modifyComplete3Ctl(aBean);
			break;
		case "DeleteAccountInfo":
			mav = this.deleteAccountInfo(aBean);
			break;
		case "AddAccountInfo":
			mav = this.addAccountInfo(aBean);
			break;
		}

		return mav;
	}

	// 비밀번호 수정
	private ModelAndView modifyCompleteCtl(AlbaBean aBean) {
		mav = new ModelAndView();

		TransactionStatus status = tran.getTransaction(new DefaultTransactionDefinition());

		if (this.editPassword(aBean)) {
			System.out.println("비밀번호 수정 성공");
			tran.commit(status);
		}
		return mav;
	}

	// 이름 수정
	private ModelAndView modifyComplete2Ctl(AlbaBean aBean) {
		mav = new ModelAndView();

		TransactionStatus status = tran.getTransaction(new DefaultTransactionDefinition());
		if (this.editName(aBean)) {
			System.out.println("이름 수정 성공");
			tran.commit(status);
		}
		return mav;
	}

	// 계좌 수정
	private ModelAndView modifyComplete3Ctl(AlbaBean aBean) {
		mav = new ModelAndView();
		System.out.println("com3진입");

		System.out.println("aBean.getEditAcBankName()::" + aBean.getEditAcBankName());
		System.out.println("aBean.getEditAcAccount()::" + aBean.getEditAcAccount());
		System.out.println("aBean.getAbCode()::" + aBean.getAbCode());
		System.out.println("aBean.getAcAccount()::" + aBean.getAcAccount());

		String message = "";

		if ((countSsAccount(aBean) + countSiaAccount(aBean)) == 0) {

			message = "계좌 수정 완료";
			mav.addObject("message", message);
			this.editAccount(aBean);
			System.out.println("계좌 수정 완료");

		} else {
			message = "계좌번호를 지원서에서 사용중이므로 수정이 불가능합니다.";
			mav.addObject("message", message);
			System.out.println("계좌번호를 지원서에서 사용중이므로 수정이 불가능합니다.");
		}

		mav.setViewName("modify");

		return mav;
	}

	// 계좌 삭제
	private ModelAndView deleteAccountInfo(AlbaBean aBean) {
		mav = new ModelAndView();
		System.out.println("deleteAccountInfo 진입");
		String message = "";

		if ((countSsAccount(aBean) + countSiaAccount(aBean)) == 0) {

			message = "계좌 삭제 완료";
			mav.addObject("message", message);
			this.deleteAccount(aBean);
			System.out.println("계좌 삭제 완료");

		} else {
			message = "계좌번호를 지원서에서 사용중이므로 삭제가 불가능합니다.";
			mav.addObject("message", message);
			System.out.println("계좌번호를 지원서에서 사용중이므로 삭제가 불가능합니다.");
		}

		mav.setViewName("modify");

		return mav;
	}

	// 계좌 추가
	private ModelAndView addAccountInfo(AlbaBean aBean) {
		mav = new ModelAndView();
		System.out.println("AlbaModify 진입");

		// TransactionStatus status = tran.getTransaction(new
		// DefaultTransactionDefinition());
		// if(this.addAccount(aBean)) {
		// tran.commit(status);
		this.addAccount(aBean);
		System.out.println("계좌 추가 성공");
		// }

		mav.setViewName("workMan");
		return mav;
	}

	// 알바생 정보 조회
	private ModelAndView modifyCtl(AlbaBean aBean) {
		mav = new ModelAndView();
		String jsonData = gson.toJson(this.getAlbaInfo(aBean));

		mav.addObject("memInfo", jsonData);
		mav.setViewName("modify");
		return mav;
	}

	// 정보조회 매퍼
	private ArrayList<AlbaBean> getAlbaInfo(AlbaBean aBean) {

		return mapperW.getAlbaInfo(aBean);
	}

	private boolean editName(AlbaBean aBean) {
		return convertToBoolean(mapperW.editName(aBean));
	}

	private boolean editPassword(AlbaBean aBean) {
		return convertToBoolean(mapperW.editPassword(aBean));
	}

	private boolean editAccount(AlbaBean aBean) {
		return convertToBoolean(mapperW.editAccount(aBean));
	}

	private boolean deleteAccount(AlbaBean aBean) {
		return convertToBoolean(mapperW.deleteAccount(aBean));
	}

	private boolean addAccount(AlbaBean aBean) {
		return convertToBoolean(mapperW.addAccount(aBean));
	}

	private int countSsAccount(AlbaBean aBean) {
		return mapperW.countSsAccount(aBean);
	}

	private int countSiaAccount(AlbaBean aBean) {
		return mapperW.countSiaAccount(aBean);
	}

	private ModelAndView albaApplyMyAccountUpdateCtl(AlbaBean aBean) {
		mav = new ModelAndView();
		String albaApplyState = "";
		if (this.albaApplyMyAccountUpdate(aBean)) {
			albaApplyState = "updateComplete";
		} else {
			albaApplyState = "updateFail";
		}
		String albaApplyUpdate = gson.toJson(albaApplyState);
		mav.addObject("albaApplyUpdate", albaApplyUpdate);
		return mav;
	}

	public boolean albaApplyMyAccountUpdate(AlbaBean aBean) {
		return convertToBoolean(mapperW.albaApplyMyAccountUpdate(aBean));
	}

	private ModelAndView albaApplyDeleteCtl(AlbaBean aBean) {
		mav = new ModelAndView();
		String albaApplyState = "";
		if (this.albaApplyDelete(aBean)) {
			albaApplyState = "deleteComplete";
		} else {
			albaApplyState = "deleteFail";
		}
		String albaApplyDelete = gson.toJson(albaApplyState);
		mav.addObject("albaApplyDelete", albaApplyDelete);
		return mav;
	}

	public boolean albaApplyDelete(AlbaBean aBean) {
		return convertToBoolean(mapperW.albaApplyDelete(aBean));
	}

	private boolean convertToBoolean(int data) {
		return (data == 1) ? true : false;
	}

}
