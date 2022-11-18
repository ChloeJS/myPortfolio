package com.notice;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.file.FileVO;
import com.util.FileInfo;
import com.util.pageInfo;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class NoticeController {

	@Autowired
	NoticeService service;

	// 목록
	@GetMapping("/portfolio/notice/index.do")
	public String index(Model model, NoticeVO vo) {

		int totalCount = service.totalCount(vo); // 전체 게시물 수
		pageInfo pageinfo = new pageInfo(vo.getPageNum(), 10, totalCount);
		vo.setStartIdx(pageinfo.getStartIdx());

		model.addAttribute("pageInfo", pageinfo);

		// System.out.println("totalCount:" + totalCount);
		// System.out.println("pageinfo.getStartPage():" + pageinfo.getStartPage());
		// System.out.println("pageinfo.getEndPage():" + pageinfo.getEndPage());

		model.addAttribute("totalCount", totalCount); // totalCount를 jsp에서 꺼내 쓸거니까 model에 담아줘야 한다.★
		// model.addAttribute("data", service.index(vo));
		model.addAttribute("data", service.getListPage(vo));

		return "portfolio/notice/index";
	}

	// 등록
	@GetMapping("/portfolio/notice/write.do")
	public String write(Model model) {
		return "portfolio/notice/write";
	}

	// 등록처리 (파일첨부)
	@PostMapping("/portfolio/notice/write.do")
	public String insert(NoticeVO vo, Model model, @RequestParam("filename") List<MultipartFile> filename,
			HttpServletRequest req) {

		// 다중 첨부파일 처리 -> List<MultipartFile>
		FileInfo fileInfo = new FileInfo(); // FileInfo에서 return하는 map에 파일을 저장하기 위해 생성?

		if (service.insert(vo)) { // vo에 notice_vo가 자동set -> get할 수 있다.
			// 이미지 등록처리
			if (!filename.get(0).isEmpty()) { // filename이 비었는지 확인 -> 확인하지 않으면 nullpointerexception 에러발생

				// 파일명 구하기
				for (int i = 0; i < filename.size(); i++) {

					FileVO fvo = new FileVO();

					Map map = fileInfo.FileSet(filename.get(i), req);
					fvo.setFilename_org((String) map.get("filename_org"));
					fvo.setFilename_real((String) map.get("filename_real"));
					fvo.setFile_type("NOTICE");
					fvo.setFileOrder(i);
					fvo.setNo(vo.getNotice_no());

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
	@GetMapping("/portfolio/notice/update.do")
	public String edit(Model model, NoticeVO vo, FileVO fvo) {
		fvo.setNo(vo.getNotice_no());
		fvo.setFile_type("NOTICE");
		List<FileVO> fileList = service.get_fileList(fvo);

		model.addAttribute("view", service.edit(vo.getNotice_no()));
		model.addAttribute("fileList", fileList);
		return "portfolio/notice/edit";
	}

	// 수정처리
	@PostMapping("/portfolio/notice/update.do")
	public String update(NoticeVO vo, FileVO fvo, Model model, @RequestParam("filename") List<MultipartFile> filename, HttpServletRequest req) {
		boolean res = false;
		res = service.update(vo);

		fvo.setNo(vo.getNotice_no());
		fvo.setFile_type("NOTICE");
		FileInfo fileInfo = new FileInfo();
		
		// 이미지 등록처리
		if (!filename.get(0).isEmpty()) { // filename이 비었는지 확인 -> 확인하지 않으면 nullpointerexception 에러발생

			// 파일명 구하기
			for (int i = 0; i < filename.size(); i++) {

				Map map = fileInfo.FileSet(filename.get(i), req);
				fvo.setFilename_org((String) map.get("filename_org"));
				fvo.setFilename_real((String) map.get("filename_real"));
				fvo.setFileOrder(i);
				// fvo.setNo(vo.getNotice_no());

				res = service.insert_file(fvo);
				System.out.println("============================ res : " + res);
			}
		}
		if (res) {
			model.addAttribute("view", service.update(vo));
			model.addAttribute("message", "정상적으로 수정되었습니다.");
			model.addAttribute("url", "view.do?notice_no=" + vo.getNotice_no());
			return "common/alert";
		} else {
			model.addAttribute("message", "수정 실패했습니다.");
			return "common/alert";
		}
	}

	// 상세보기
	@GetMapping("/portfolio/notice/view.do")
	public String view(NoticeVO vo, Model model, FileVO fvo) {
		service.updateViewcount(vo.getNotice_no());

		fvo.setNo(vo.getNotice_no());
		fvo.setFile_type("NOTICE");

		List<FileVO> fileList = service.get_fileList(fvo);
		model.addAttribute("view", service.view(vo.getNotice_no()));
		model.addAttribute("fileList", fileList); // 파일조회

		return "portfolio/notice/view";
	}

	// 삭제
	@GetMapping("/portfolio/notice/delete.do")
	public String delete(int notice_no, Model model) {

		if (service.delete(notice_no)) {
			model.addAttribute("message", "정상적으로 삭제되었습니다.");
			model.addAttribute("url", "index.do");
			return "common/alert";
		} else {
			model.addAttribute("message", "삭제 실패했습니다.");
			return "common/alert";
		}
	}

	// 파일삭제
	@GetMapping("/portfolio/notice/deleteFile.do")
	@ResponseBody
	public boolean delete_file(@RequestParam int file_no, FileVO fvo) {
		System.out.println("확인합니다."+file_no);
		System.out.println("확인합니다."+fvo.getFile_no());
		boolean result = service.delete_file(file_no);
		
				
		System.out.println("파일 삭제=====================" + result);
		return result;
	}

}
