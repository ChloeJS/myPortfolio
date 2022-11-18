package com.board;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.board.BoardVO;
import com.comment.CommentVO;
import com.file.FileVO;

@Mapper
public interface BoardMapper {
	
	List<BoardVO> list(BoardVO vo); // 목록
	List<BoardVO> getListPage(BoardVO vo); // 페이징
	int insert(BoardVO vo); // 등록
	BoardVO view(int no); // 상세
	int totalCount(BoardVO vo); // 게시물 수 체크
	int updateViewcount(int no); // 조회 수 증가체크
	int update(BoardVO vo); // 수정
	int delete(int no); // 삭제
	
	int count_comment(CommentVO cvo); // 댓글 수 체크
	
	// 파일영역
	int insert_file(FileVO fvo); // 파일등록
	List<FileVO> get_fileList(FileVO fvo); // 파일조회(다중)
	int delete_file(int file_no); // ajax로 파일삭제
}
