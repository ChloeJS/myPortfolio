package com.board;

import java.util.List;

import com.board.BoardVO;
import com.comment.CommentVO;
import com.file.FileVO;

public interface BoardService {

		// 게시글 영역
		public List<BoardVO> index(BoardVO vo); // 목록
		public boolean insert(BoardVO vo); // 글등록
		public BoardVO view(int no); // 상세
		public boolean update(BoardVO vo); // 수정update
		public BoardVO edit(int no); // 수정edit
		public boolean delete(int no); // 삭제
		public int totalCount(BoardVO vo); // 전체 게시물 수 
		public List<BoardVO> getListPage(BoardVO vo);   // 페이징
		public int updateViewcount(int viewcount); // 조회수
		
		public int count_comment(CommentVO cvo); // 댓글 수 체크
		
		// 파일 영역
		public boolean insert_file(FileVO fvo); // 파일등록
		public List<FileVO> get_fileList(FileVO fvo); // 파일조회(다중)
		public boolean delete_file(int file_no); // ajax로 파일삭제
}
