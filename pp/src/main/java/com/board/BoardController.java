package com.board;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.comment.CommentService;
import com.file.FileVO;
import com.util.FileInfo;
import com.util.pageInfo;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class BoardController {
	
	@Autowired
	BoardService service;
	
	// 목록
	@GetMapping("/portfolio/board/index.do")
	public String index(Model model, BoardVO vo) {
		System.out.println("아 코딩~~~~~~~~~~~~~~~~~~ 댓글 수~~~ "+vo);
		
		int totalCount = service.totalCount(vo); // 전체 게시물 수
		pageInfo pageinfo = new pageInfo(vo.getPageNum(), 10, totalCount);
		vo.setStartIdx(pageinfo.getStartIdx());

		model.addAttribute("pageInfo", pageinfo);

		model.addAttribute("totalCount", totalCount); // totalCount를 jsp에서 꺼내 쓸거니까 model에 담아줘야 한다.★
		// model.addAttribute("data", service.index(vo));
		model.addAttribute("data", service.getListPage(vo));

		return "/portfolio/board/index";
	}

	// 등록
	// @ResponseBody를 붙인 메소드에서 return한 값은 그대로 AJAX succes함수의 파라미터로 온다.
	// javascript에는 List<ReplyVO>라는 자료타입이 없으므로 JSON형태로 바꿔줄 것.
	@GetMapping("/portfolio/board/write.do")
	public String write(Model model) {
		return "portfolio/board/write";
	}

	// 등록처리 (파일첨부)
	@PostMapping("/portfolio/board/write.do")
	public String insert(BoardVO vo, Model model, @RequestParam("filename") List<MultipartFile> filename,
			HttpServletRequest req) {

		// 다중 첨부파일 처리 -> List<MultipartFile>
		FileInfo fileInfo = new FileInfo(); // FileInfo에서 return하는 map에 파일을 저장하기 위해 생성?

		if (service.insert(vo)) { // vo에 vo가 자동set -> get할 수 있다.
			// 이미지 등록처리
			if (!filename.get(0).isEmpty()) { // filename이 비었는지 확인 -> 확인하지 않으면 nullpointerexception 에러발생

				// 파일명 구하기
				for (int i = 0; i < filename.size(); i++) {

					FileVO fvo = new FileVO();

					Map map = fileInfo.FileSet(filename.get(i), req);
					fvo.setFilename_org((String) map.get("filename_org"));
					fvo.setFilename_real((String) map.get("filename_real"));
					fvo.setFile_type("BOARD");
					fvo.setFileOrder(i);
					fvo.setNo(vo.getNo());

					boolean res = service.insert_file(fvo);
					System.out.println("============================ res : " + res);
				}
			}

			model.addAttribute("message", "정상적으로 등록되었습니다.");
			model.addAttribute("url", "index.do");
			return "common/alert";
		} else {
			model.addAttribute("message", "등록 실패했습니다.");
			return "common/alert";
		}
	}

	// 수정
	@GetMapping("/portfolio/board/update.do")
	public String edit(Model model, BoardVO vo, FileVO fvo) {
		fvo.setNo(vo.getNo());
		fvo.setFile_type("BOARD");
		List<FileVO> fileList = service.get_fileList(fvo);

		model.addAttribute("view", service.edit(vo.getNo()));
		model.addAttribute("fileList", fileList);
		return "/portfolio/board/edit";
	}

	// 수정처리
	@PostMapping("/portfolio/board/update.do")
	public String update(BoardVO vo, FileVO fvo, Model model, @RequestParam("filename") List<MultipartFile> filename, HttpServletRequest req) {
		boolean res = false;
		res = service.update(vo);

		fvo.setNo(vo.getNo());
		fvo.setFile_type("BOARD");
		FileInfo fileInfo = new FileInfo();
		
		// 이미지 등록처리
		if (!filename.get(0).isEmpty()) { // filename이 비었는지 확인 -> 확인하지 않으면 nullpointerexception 에러발생

			// 파일명 구하기
			for (int i = 0; i < filename.size(); i++) {

				Map map = fileInfo.FileSet(filename.get(i), req);
				fvo.setFilename_org((String) map.get("filename_org"));
				fvo.setFilename_real((String) map.get("filename_real"));
				fvo.setFileOrder(i);
				// fvo.setNo(vo.getno());

				res = service.insert_file(fvo);
				System.out.println("============================ res : " + res);
			}
		}
		if (res) {
			model.addAttribute("view", service.update(vo));
			model.addAttribute("message", "정상적으로 수정되었습니다.");
			model.addAttribute("url", "view.do?no=" + vo.getNo());
			return "common/alert";
		} else {
			model.addAttribute("message", "수정 실패했습니다.");
			return "common/alert";
		}
	}

	// 상세보기
	@GetMapping("/portfolio/board/view.do")
	public String view(BoardVO vo, Model model, FileVO fvo) {
		service.updateViewcount(vo.getNo());

		fvo.setNo(vo.getNo());
		fvo.setFile_type("BOARD");

		List<FileVO> fileList = service.get_fileList(fvo);
		model.addAttribute("view", service.view(vo.getNo()));
		model.addAttribute("fileList", fileList); // 파일조회

		return "/portfolio/board/view";
	}

	// 삭제
	@GetMapping("/portfolio/board/delete.do")
	public String delete(int no, Model model) {

		if (service.delete(no)) {
			model.addAttribute("message", "정상적으로 삭제되었습니다.");
			model.addAttribute("url", "index.do");
			return "common/alert";
		} else {
			model.addAttribute("message", "삭제 실패했습니다.");
			return "common/alert";
		}
	}

	// 파일삭제
	@GetMapping("/portfolio/board/deleteFile.do")
	@ResponseBody
	public boolean delete_file(@RequestParam int file_no, FileVO fvo) {
		System.out.println("확인합니다."+file_no);
		System.out.println("확인합니다."+fvo.getFile_no());
		boolean result = service.delete_file(file_no);
		
				
		System.out.println("파일 삭제=====================" + result);
		return result;
	}

}
