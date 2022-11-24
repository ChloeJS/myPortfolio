package com.user;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {
	
	// 마이페이지 이동
	@GetMapping("/portfolio/mypage/index.do")
	public String mypage(HttpSession sess, Model model) {
		return null;
	}
}
