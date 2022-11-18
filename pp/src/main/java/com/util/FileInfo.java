package com.util;

import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.file.FileMapper;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class FileInfo {

	@Autowired
	FileMapper mapper;
	
	public static Map FileSet(@RequestParam MultipartFile filename, HttpServletRequest req) {
		
		// (공부)
		// 파일명 구하기
		String org = filename.getOriginalFilename(); // 사용자가 첨부한 원본파일의 이름을 가져온다.
		String ext = org.substring(org.lastIndexOf(".")); // 확장자 명을 가져온다.
		String real = new Date().getTime() + ext; // 변경된 filename + .확장자명
		
		// 파일저장
		String path = req.getRealPath("/upload/"); // 경로 불러오기
		try {
			filename.transferTo(new File(path+real));
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("이미지 업로드 중 예외 발생");
		}
			
		Map map = new HashMap();
		map.put("filename_org", org);
		map.put("filename_real", real);
		
		return map;
	}
}
