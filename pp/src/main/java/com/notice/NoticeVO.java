package com.notice;

import java.sql.Timestamp;

import com.util.pageInfo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class NoticeVO extends pageInfo {

	private int notice_no; // pk, 번호
	private String notice_title; // 제목
	private String notice_content; // 내용
	private Timestamp notice_regdate; // 작성일
	private String notice_writer; // 작성자
	private int notice_viewcount; // 조회수
	
	private String filename_org;
	private String filename_real;
	private int file_no;

	
}
   