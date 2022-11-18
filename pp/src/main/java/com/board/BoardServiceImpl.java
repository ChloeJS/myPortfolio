package com.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.BoardMapper;
import com.board.BoardVO;
import com.comment.CommentVO;
import com.file.FileVO;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	BoardMapper mapper;
	
	// 목록(+페이징처리)
	@Override
	public List<BoardVO> index(BoardVO vo) {
		return mapper.list(vo);
	}
	
	// 등록
	@Override
	public boolean insert(BoardVO vo) {
		return mapper.insert(vo) > 0 ? true : false;
	}
	
	// 수정
	@Override
	public BoardVO edit(int no) {
		return mapper.view(no);
	}
	
	@Override
	public boolean update(BoardVO vo) {
		return mapper.update(vo) > 0 ? true : false;
	}
	
	// 삭제
	@Override
	public boolean delete(int no) {
		return mapper.delete(no) > 0 ? true : false;
	}
	
	// 상세
	@Override
	public BoardVO view(int no) {
		return mapper.view(no);
	}
	
	// 전체 게시물 수 체크 
	@Override
	public int totalCount(BoardVO vo) {
		return mapper.totalCount(vo);
	}
	
	// 페이징 처리 된 목록
	@Override
	public List<BoardVO> getListPage(BoardVO vo) {
		return mapper.getListPage(vo);
	}
	
	// 조회수 증가
	@Override
	public int updateViewcount(int no) {
		return mapper.updateViewcount(no);
	}
	
	// 파일------------------------------------------------------------
	
	// 파일등록
	@Override
	public boolean insert_file(FileVO fvo) {
		return mapper.insert_file(fvo) > 0 ? true : false;
	}
	
	// 파일조회(다중)
	@Override
	public List<FileVO> get_fileList(FileVO fvo) {
		return mapper.get_fileList(fvo);
	}
	
	// 파일삭제
	@Override
	public boolean delete_file(int file_no) {
		return mapper.delete_file(file_no) > 0 ? true : false;
	}
	
	// 댓글수체크
	@Override
	public int count_comment(CommentVO cvo) {
		return mapper.count_comment(cvo);
	}
	
	

}
