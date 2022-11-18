package com.comment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommentServiceImpl implements CommentService {
	
	@Autowired
	CommentMapper mapper;
	
	@Override
	public int insert(CommentVO vo) {
		return mapper.insert(vo);
	}

	@Override
	public int delete(int comment_no) {
		return mapper.delete(comment_no) ;
	}

	// 페이징처리된 목록
	@Override
	public List<CommentVO> getListPage(CommentVO vo) {
		return mapper.getListPage(vo);
	}

	@Override
	public int count(CommentVO vo) {
		return mapper.count(vo);
	}

	@Override
	public int update(int comment_no) {
		return mapper.update(comment_no);
	}



}
