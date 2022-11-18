package com.notice;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.file.FileVO;

@Mapper
public interface NoticeMapper {
	List<NoticeVO> list(NoticeVO vo); // 목록
	List<NoticeVO> getListPage(NoticeVO vo); // 페이징
	int insert(NoticeVO vo); // 등록
	NoticeVO view(int notice_no); // 상세
	int totalCount(NoticeVO vo); // 게시물 수 체크
	int updateViewcount(int notice_no); // 조회 수 증가체크
	int update(NoticeVO vo); // 수정
	int delete(int notice_no); // 삭제
	
	// 파일영역
	int insert_file(FileVO fvo); // 파일등록
	List<FileVO> get_fileList(FileVO fvo); // 파일조회(다중)
	int delete_file(int file_no); // ajax로 파일삭제
}  
