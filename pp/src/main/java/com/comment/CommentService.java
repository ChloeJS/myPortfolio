package com.comment;

import java.util.List;

public interface CommentService {
	
	int insert(CommentVO vo);
	int delete(int comment_no);
	int count(CommentVO vo);
	List<CommentVO> getListPage(CommentVO vo);
	int update(int comment_no);
}
