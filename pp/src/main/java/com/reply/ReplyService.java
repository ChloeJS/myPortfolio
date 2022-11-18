package com.reply;

import java.util.List;

public interface ReplyService {
	
	List<ReplyVO> getListPage(ReplyVO vo); // 글목록 -> map에 totalCount 담기
	boolean insert(ReplyVO vo); // 글등록
	ReplyVO view(int reply_no); // 글상세
	boolean update(ReplyVO vo); // 글수정
	ReplyVO edit(int reply_no); // 글수정폼
	boolean delete(int reply_no); // 글삭제
	int totalCount(ReplyVO vo); // 글갯수확인
	
	int gnoUpdate(int group_no); // 답변처리>그룹번호 
	int onoUpdate(ReplyVO vo); // 답변처리>그룹내 순서번호 
	
	boolean insert_reply(ReplyVO vo); // 답변등록
}
