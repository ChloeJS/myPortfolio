package com.reply;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.util.pageInfo;

@Controller
public class ReplyController {
	
	@Autowired
	ReplyService service;
	
	// 목록
	@GetMapping("/portfolio/reply/index.do")
	public String index(ReplyVO vo, Model model) {
		//System.out.println("==========================리스트========"+ service.getListPage(vo));
		int totalCount = service.totalCount(vo);
		pageInfo pageinfo = new pageInfo(vo.getPageNum(), 10, totalCount);
		vo.setStartIdx(pageinfo.getStartIdx());
		model.addAttribute("pageinfo", pageinfo);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("data", service.getListPage(vo));
		return "portfolio/reply/index";
	}
	
	// 글등록폼
	@GetMapping("/portfolio/reply/write.do")
	public String write(Model model) {
		return "portfolio/reply/write";
	}
	
	// 글등록
	@PostMapping("/portfolio/reply/write.do")
	public String insert( ReplyVO vo, Model model) {
		if (service.insert(vo)) {
		
			service.gnoUpdate(vo.getReply_no());
			
			model.addAttribute("message", "정상적으로 글이 등록되었습니다.");
			model.addAttribute("url", "index.do");
			return "common/alert";
		} else {
			model.addAttribute("message", "등록 실패했습니다.");
			 return "common/alert";
		}
	}
	
	// 답변등록폼
	@GetMapping("/portfolio/reply/addReply.do")
	public String reply(ReplyVO vo, Model model){
		ReplyVO data = service.edit(vo.getReply_no());
		model.addAttribute("data", data);
		return "portfolio/reply/addReply";
	}
	
	// 답변등록
	@PostMapping("/portfolio/reply/addReply.do")
	public String insert_reply(ReplyVO vo, Model model) {
		if (service.insert_reply(vo)) {
			model.addAttribute("message", "정상적으로 답변이 등록되었습니다.");
			model.addAttribute("url", "index.do");
			return "common/alert";
		} else {
			model.addAttribute("message", "답변등록 실패했습니다.");
			return "common/alert";
		}
	}
	
	// 글상세보기
	@GetMapping("/portfolio/reply/view.do")
	public String view(ReplyVO vo, Model model) {
		//System.out.println("======================="+service.view(vo.getReply_no()));
		model.addAttribute("data", service.view(vo.getReply_no()));
		return "portfolio/reply/view";
	}
	
	// 글수정폼
	@GetMapping("/portfolio/reply/edit.do")
	public String edit(ReplyVO vo, Model model) {
		model.addAttribute("data", service.edit(vo.getReply_no()));
		return "portfolio/reply/edit";
	}
	
	// 글수정
	@PostMapping("/portfolio/reply/update.do")
	public String update(ReplyVO vo, Model model) {
		if(service.update(vo)) {
			model.addAttribute("message", "정상적으로 글이 수정되었습니다.");
			model.addAttribute("url", "view.do?reply_no="+vo.getReply_no());
			return "common/alert";
		} else {
			model.addAttribute("message", "수정 실패했습니다.");
			return "common/alert";
		}
	}
	
	// 글삭제
	@GetMapping("/portfolio/reply/delete.do")
	public String delete(ReplyVO vo, Model model) {
		if (service.delete(vo.getReply_no())) {
			model.addAttribute("message", "정상적으로 글이 삭제되었습니다.");
			model.addAttribute("url", "index.do");
			return "common/alert";
		} else {
			model.addAttribute("message", "삭제 실패했습니다.");
			return "common/alert";
		}
	}
}
