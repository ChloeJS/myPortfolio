package com.notice;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.file.FileVO;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	NoticeMapper mapper;
	
	// 목록(+페이징처리)
	@Override
	public List<NoticeVO> index(NoticeVO vo) {
		return mapper.list(vo);
	}
	
	// 등록
	@Override
	public boolean insert(NoticeVO vo) {
		return mapper.insert(vo) > 0 ? true : false;
	}
	
	// 수정
	@Override
	public NoticeVO edit(int notice_no) {
		return mapper.view(notice_no);
	}
	
	@Override
	public boolean update(NoticeVO vo) {
		return mapper.update(vo) > 0 ? true : false;
	}
	
	// 삭제
	@Override
	public boolean delete(int notice_no) {
		return mapper.delete(notice_no) > 0 ? true : false;
	}
	
	// 상세
	@Override
	public NoticeVO view(int notice_no) {
		return mapper.view(notice_no);
	}
	
	// 전체 게시물 수 체크 
	@Override
	public int totalCount(NoticeVO vo) {
		return mapper.totalCount(vo);
	}
	
	// 페이징 처리 된 목록
	@Override
	public List<NoticeVO> getListPage(NoticeVO vo) {
		return mapper.getListPage(vo);
	}
	
	// 조회수 증가
	@Override
	public int updateViewcount(int notice_no) {
		return mapper.updateViewcount(notice_no);
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
	
	

}
   