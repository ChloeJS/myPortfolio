package com.reply;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReplyMapper {
	
	public int insert(ReplyVO vo); // 글등록
	public int insert_reply(ReplyVO vo); // 답변등록
	
	public int gnoUpdate(int group_no); // 답변처리>그룹번호 
	public int onoUpdate(ReplyVO vo); // 답변처리>그룹내 순서번호 ->왜 변수가 vo일까? : 조건에 필요한 변수가 group_no와 order_no 두개니까 vo로!
	
	public List<ReplyVO> getListPage(ReplyVO vo); // 목록
	public ReplyVO view(int reply_no); // 상세보기
	public int updateViewcount(int reply_no); // 조회수 1증가
	public int update(ReplyVO vo); // 글수정
	public int delete(int reply_no); // 글삭제
	public int totalCount(ReplyVO vo); // 글갯수확인
	
	
	
	
	
}
