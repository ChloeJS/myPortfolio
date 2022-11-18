package com.reply;

import com.util.pageInfo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReplyVO extends pageInfo {

		
		// 답변게시판 기본정보
		private int reply_no;
		private String reply_title;
		private String reply_content;
		private String reply_regdate;
		private int reply_viewcount;
		
		// 사용자정보
		private int user_no;
		private String user_name;
		
		// 파일정보
		private String filename_org;
		private String filename_real;
		
		// 글의 답변 처리를 위한 정보
		private int group_no; // 그룹핑한 그룹 번호 (=어떤 게시판)
		private int order_no; // 그룹 내의 순번 (=어떤 게시판의 몇번 게시글)
		private int depth; // 들여쓰기(깊이) -> 답글의 답글일수록 커진다.
		
		private int comment_count;

	}
