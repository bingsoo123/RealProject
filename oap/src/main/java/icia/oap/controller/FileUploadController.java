package icia.oap.controller;

import java.io.File;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import icia.oap.vo.PhotoVo;


@Controller
public class FileUploadController {

	// 자동엮기 (auto injection) : Dispatcher Servlet이 자동연결해줌
	// Servlet-context에서 <context:annotation-config/> 해줘야 함
	@Autowired
	ServletContext application;

	// 입력폼 띄우기
	@RequestMapping("/TT")
	public String insert_form() {
		return "insert_form";
	}

	// 낱개로 받기
	// upload1.do?title=제목&photo=a.jpg&photo=b.jpg
	@RequestMapping("/UPLOAD")
	public String upload3(String title, @RequestParam("photo") MultipartFile[] photo_array, Model model)
			throws Exception {

		String web_path = "D:\\Spring\\IMG";
		// 상대경로 -> 절대경로
		//String abs_path = application.getRealPath(web_path);
		String abs_path = application.getRealPath(web_path);
		System.out.println(abs_path);

		String filename1 = "no_file";
		String filename2 = "no_file";

		// for(MultipartFile photo : photo_array) {
		for (int i = 0; i < photo_array.length; i++) {
			MultipartFile photo = photo_array[i];
			String filename = "";

			// 업로드된 파일이 있으면
			if (photo.isEmpty() == false) {
				// 엄르도된 파일명
				filename = photo.getOriginalFilename();
				File f = new File(abs_path, filename);
				
				// 동일파일이 있는지 검사, 동일 파일이 없을 때 까지
				while (f.exists()) {
					// 현재 시스템 시간(milisecond)
					long t = System.currentTimeMillis();

					filename = String.format("%d_%s", t, filename);
					f = new File(abs_path, filename);
				}

				// 임시 업로드된 파일 -> 지정된 위치로 복사
				photo.transferTo(f);
			}

			if (i == 0)
				filename1 = filename;
			else if (i == 1)
				filename2 = filename;
		}

		model.addAttribute("title", title);
		model.addAttribute("filename1", filename1);
		model.addAttribute("filename2", filename2);

		return "result_upload1";
	}

	// 객체로 받기
	@RequestMapping("/UPLOAD2")
	public String upload4(PhotoVo vo, Model model) throws Exception {
		String web_path = "/resources/upload/";
		// 상대경로->절대경로
		String abs_path = application.getRealPath(web_path);
		// System.out.println(abs_path);

		String filename = "no_file";
		// 업로드된 화일이 있으면
		MultipartFile[] photo_array = vo.getPhoto();

		for (int i = 0; i < photo_array.length; i++) {
			MultipartFile photo = photo_array[i];

			if (photo.isEmpty() == false) {
				// 업로드된 화일명
				filename = photo.getOriginalFilename();
				File f = new File(abs_path, filename);

				// 동일화일이 있는지 검사
				if (f.exists()) {
					// 현재 시스템 시간(milisecond)
					long t = System.currentTimeMillis();
					// 123456789_a.jpg
					filename = String.format("%d_%s", t, filename);
					f = new File(abs_path, filename);
				}
				// 임시업로된 화일 -> 지정된 위치로 복사
				photo.transferTo(f);
				if (i == 0)
					vo.setFilename1(filename);
				else
					vo.setFilename2(filename);
			}
		}

		// 결과적 : request binding
		model.addAttribute("vo", vo);

		return "result_upload2";

	}
}