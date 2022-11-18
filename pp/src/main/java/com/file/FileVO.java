package com.file;

import lombok.Data;

@Data
public class FileVO {
	
	private int file_no; // 파일 번호(auto)
	
	private int no; // 지정 번호
	
	private String filename_org; // 원본파일
	private String filename_real; // 실제파일

	private String file_type; // 게시판 타입(공지사항, 갤러리, 답변및댓글)
	private int fileOrder; // 게시판타입별 파일 번호
	
		
}
