package com.gallery;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class GalleryVO {
	
	
	// 게시물
	private int gallery_no; // 글번호
	private String gallery_title; // 상품명
	private String gallery_content; // 상품설명
	private String gallery_regdate; // 작성일
	private int price; // 상품 가격
	
	// 사용자
	private int user_no; // 회원번호
	private String user_name; // 회원이름
	
	// 첨부파일
	private String filename_org; 
	private String filename_real;

}
