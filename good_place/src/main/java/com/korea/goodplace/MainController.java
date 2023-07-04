package com.korea.goodplace;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


//메인 페이지에서 단순히 페이지 이동을 위한 관리 페이지
@Controller
public class MainController {
	
	public static final String PATH = "/WEB-INF/views/";
	
	// 홈버튼 클릭시
	@RequestMapping(value = { "/", "/main.do" })
	public String clear() {
		return PATH + "/main/mainpage.jsp";
	}
	
	// 로그인버튼 클릭시
	@RequestMapping("/login_list.do")
	public String boardlist() {
		return PATH + "/login/login_form.jsp";
	}
	
	// start버튼 클릭시
	@RequestMapping("/map.do")
	public String selectList() {
		return PATH + "/main/map.jsp";
	}

}
