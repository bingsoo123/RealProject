package icia.oap.vo;

import org.springframework.web.multipart.MultipartFile;

public class PhotoVo {

	//parameter name
	String title;         
	MultipartFile [] photo;
	
	//별도변수
	String filename1;
	String filename2;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public MultipartFile[] getPhoto() {
		return photo;
	}
	public void setPhoto(MultipartFile[] photo) {
		this.photo = photo;
	}
	public String getFilename1() {
		return filename1;
	}
	public void setFilename1(String filename1) {
		this.filename1 = filename1;
	}
	public String getFilename2() {
		return filename2;
	}
	public void setFilename2(String filename2) {
		this.filename2 = filename2;
	}
	
}
