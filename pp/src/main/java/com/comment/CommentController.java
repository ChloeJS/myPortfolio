package com.comment;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.util.pageInfo;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class CommentController {
	
	@Autowired
	CommentService cService;
	
	// 해당 게시글에 있는 전체 댓글
    /*
     * MyBatis는 두 개 이상의 데이터를 파라미터로 전달하기 위해선 
     * 1) 별도의 객체로 구성하거나 2) Map 이용 방식 3) Param을 이용해 이름을 사용하는 방식이 있다.
     * @Param 의 속성값은 MyBatis에서 SQL을 이용할 때 #{}의 이름으로 사용 가능하다.
     */
	@GetMapping("/portfolio/comment/index.do")
	public String list(CommentVO vo, Model model) {
		
		int totalCount = cService.count(vo); // 전체 게시물 수
		pageInfo pageinfo = new pageInfo(vo.getPageNum(), 10, totalCount);
		vo.setStartIdx(pageinfo.getStartIdx());
		vo.setPageRow(pageinfo.getPageRow()); // CommentVO에 pageRow 필드를 선언했으니 pageInfo를 상속받았다 하더라도 컨트롤러에서는 pageRow값을 저장해줘야한다. 잊지말자!!!
		
		model.addAttribute("pageInfo", pageinfo);
		model.addAttribute("commList", cService.getListPage(vo));
		return "/portfolio/comment/index";
	}
	
	@GetMapping("/portfolio/comment/insert.do")
	@ResponseBody
	public int insert(CommentVO vo, Model model) {
		//model.addAttribute("comRes", cService.insert(vo)); // model에 담고 return을 또 하면 두번 등록!
		return cService.insert(vo); // 0 혹은 1이 출력될 것
		// comRes에 담긴 값을 ajax로 처리
	}
	
	@GetMapping("/portfolio/comment/delete.do")
	@ResponseBody
	public int delete(CommentVO vo, Model model) {
		//model.addAttribute("comRes", cService.delete(vo.getComment_no())); // 에러 : model에 담고 return을 또 해줘서 0이 찍혔던 것!! 
		return cService.delete(vo.getComment_no()); // 0 혹은 1이 출력될 것
		// comRes에 담긴 값을 ajax로 처리
	}
	
	
	@GetMapping("/portfolio/comment/update.do")
	@ResponseBody
	public int update(int comment_no) {
		System.out.println("출력해보자 ================== "+ cService.update(comment_no));
		return cService.update(comment_no);
	}
	
}
