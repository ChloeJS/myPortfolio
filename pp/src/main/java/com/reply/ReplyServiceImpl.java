package com.reply;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Autowired
	ReplyMapper mapper;
	
	@Override
	public List<ReplyVO> getListPage(ReplyVO vo) {
		return mapper.getListPage(vo);
	}
	
	// 글등록 + 그룹번호가 업데이트
	@Override
	public boolean insert(ReplyVO vo) {
		boolean result = mapper.insert(vo) > 0 ? true : false ;
		if (result) mapper.gnoUpdate(vo.getGroup_no());
		return result;
	}

	@Override
	public ReplyVO view(int reply_no) {
		return mapper.view(reply_no);
	}

	@Override
	public boolean update(ReplyVO vo) {
		return mapper.update(vo) > 0 ? true : false ;
	}

	@Override
	public ReplyVO edit(int reply_no) {
		return mapper.view(reply_no);
	}

	@Override
	public boolean delete(int reply_no) {
		return mapper.delete(reply_no) > 0 ? true : false ;
	}
	
	// 답변등록 + 그룹내 답변순서번호 업데이트, 들여쓰기도 업데이트
	@Override
	public boolean insert_reply(ReplyVO vo) {
		mapper.onoUpdate(vo);
		vo.setOrder_no(vo.getOrder_no()+1);
		vo.setDepth(vo.getDepth()+1);
		return mapper.insert_reply(vo) > 0 ? true : false;
	}

	@Override
	public int totalCount(ReplyVO vo) {
		return mapper.totalCount(vo);
	}

	@Override
	public int gnoUpdate(int group_no) {
		return mapper.gnoUpdate(group_no);
	}

	@Override
	public int onoUpdate(ReplyVO vo) {
		return mapper.onoUpdate(vo);
	}

}
