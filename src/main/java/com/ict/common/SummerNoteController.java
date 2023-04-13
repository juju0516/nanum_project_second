package com.ict.common;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@RestController
public class SummerNoteController {
	@Autowired
	private FileReName fileReName;
	
	@RequestMapping(value="saveImage.do", method=RequestMethod.POST)
	@ResponseBody
	//public Map<String, String> saveImage(ImgVO vo, HttpServletRequest request) {
	public Map<String, String> saveImage(HttpServletRequest request,
			@RequestParam("s_file") MultipartFile s_file) {
		Map<String, String> map = new HashMap<String, String>();
		
		System.out.println("[saveImage] s_file : " + s_file);
		
		// 넘어온 파일 검증
		//MultipartFile f = vo.getS_file();
		String fname = null;
		
//		if(f.getSize() > 0) {
//			// 첨부파일을 저장할 위치 - 절대 경로
//			String path = request.getSession().getServletContext().getRealPath("/resources/upload");
//			fname = f.getOriginalFilename();
//			
//			// 첨부파일이 이미 저장된 파일이름과 동일할 경우는 알아서 체크해야 - FileRenameUtil
//			fname = fileReName.exec(path, fname);
//			try {
//				f.transferTo(new File(path, fname));
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//		}
		
		if(s_file.getSize() > 0) {
			// 첨부파일을 저장할 위치 - 절대 경로
			String path = request.getSession().getServletContext().getRealPath("/resources/upload/system/s_editor");
			fname = s_file.getOriginalFilename();
			
			// 첨부파일이 이미 저장된 파일이름과 동일할 경우는 알아서 체크해야 - FileRenameUtil
			fname = fileReName.exec(path, fname);
			try {
				s_file.transferTo(new File(path, fname));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		// 비동기식 요청한 곳으로 저장된 파일의 경로와 파일명을 보내야 한다.
		// 현재 서버 경로
		String path = request.getContextPath();
		map.put("path", path+"/resources/upload/system/s_editor");
		map.put("fname", fname);
		
		// pom.xml 에 추가 하기  => json 변환 기능
		// https://mvnrepository.com/artifact/com.google.code.gson/gson
				
		return map; // map ---> "path":"/editor_imag",
		            //          "fname":"flag.png"
	}
}
