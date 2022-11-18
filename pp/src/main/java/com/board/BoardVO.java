package com.board;

import com.util.pageInfo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardVO  extends pageInfo  {
	
	private int no; // 글번호
	private String title; // 제목
	private String content; // 내용
	private String regdate; // 작성일
	private int viewcount; // 조회수
	private int user_no; // 사용자번호 = 작성자확인
	private String filename_org; // 원본파일
	private String filename_real; // 서버저장 실제파일
	
	
	private String user_name; // 사용자이름 = 작성자확인
	
	private int comment_count; // 댓글 수
}
