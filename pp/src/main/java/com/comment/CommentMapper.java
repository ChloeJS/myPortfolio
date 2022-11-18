package com.comment;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CommentMapper {
	int insert(CommentVO vo); // 댓글 등록
	
	// count, list는 list에서 같이 실행 -> map으로 함께 리턴할 수 있도록 처리
	int count(CommentVO vo); // 전체 댓글 개수
	List<CommentVO> getListPage(CommentVO vo); // 댓글 목록
	int update(int comment_no); // 댓글 수정
	int delete(int comment_no); // 댓글 삭제
}
