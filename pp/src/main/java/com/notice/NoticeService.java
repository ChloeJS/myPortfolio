package com.notice;

import java.util.List;
import java.util.Map;

import com.file.FileVO;

public interface NoticeService {
	
	// 게시글 영역
	public List<NoticeVO> index(NoticeVO vo); // 목록
	public boolean insert(NoticeVO vo); // 글등록
	public NoticeVO view(int notice_no); // 상세
	public boolean update(NoticeVO vo); // 수정update
	public NoticeVO edit(int notice_no); // 수정edit
	public boolean delete(int notice_no); // 삭제
	public int totalCount(NoticeVO vo); // 전체 게시물 수 
	public List<NoticeVO> getListPage(NoticeVO vo);   // 페이징
	public int updateViewcount(int notice_viewcount); // 조회수
	
	// 파일 영역
	public boolean insert_file(FileVO fvo); // 파일등록
	public List<FileVO> get_fileList(FileVO fvo); // 파일조회(다중)
	public boolean delete_file(int file_no); // ajax로 파일삭제
	
}
