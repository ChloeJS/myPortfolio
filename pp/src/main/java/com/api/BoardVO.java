package com.api;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardVO{
	private int no;
	private String title;
	private String member_name;
	private int comment_count;
	private String regdate;
	
	// 날짜 타입 (별도의 타입)
}
