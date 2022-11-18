package com.comment;

import java.sql.Timestamp;

import com.util.pageInfo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CommentVO extends pageInfo{
	
	private int comment_no;
	private String comment_content;
	private String comment_regdate;
	private int user_no;
	private String user_name;
	
	private int board_no;
	private String tablename;
	
	//private int pageNum;
	//private int startIdx;
	//private int pageRow;
	

	
}
