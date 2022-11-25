package com.user;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserVO {
	// 회원정보
	private int user_no;
	private String user_id;
	private String user_pwd;
	private String user_name;
	private String user_email;
	private String user_hp;
	private String user_zipcode;
	private String user_addr1;
	private String user_addr2;
	private String regdate;
}
