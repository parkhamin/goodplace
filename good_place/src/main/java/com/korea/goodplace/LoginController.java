package com.korea.goodplace;

import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.LoginDAO;
import vo.SignupVO;

@Controller
public class LoginController {
	public static final String PATH = "/WEB-INF/views/login/";

	LoginDAO login_dao;

	public LoginController(LoginDAO login_dao) {
		this.login_dao = login_dao;
	}

	@RequestMapping("/login_list.do")
	public String firstPage() {
		return PATH + "login_form.jsp";
	}

	@RequestMapping("/login.do")
	@ResponseBody
	public String login(SignupVO vo, HttpServletRequest request) {
		// login.do?id=aaa&pwd=1111
		SignupVO baseVO = login_dao.checkId(vo.getId());

		HttpSession session = request.getSession();

		if (baseVO == null) {// id가 없는 경우
			return "[{'res':'no_id'}]";
		}

		if (!baseVO.getPwd().equals(vo.getPwd())) {// 비밀번호 불일치
			return "[{'res':'no_pwd'}]";
		}

		if (baseVO.getUserpower() == 1) {
			session.setAttribute("admin", baseVO); //세션에 admin라는 이름으로 SignupVO객체를 저장
		} else if (baseVO.getUserpower() == 2) {
			session.setAttribute("user", baseVO); // 세션에 user라는 이름으로 SignupVO객체를 저장
		}
		// 아이디/비밀번호 체크에 문제가 없었다면 session에 baseVO객체를 저장한다
		// 세션 유지시간을 1시간으로 변경(기본값 30분)
		session.setMaxInactiveInterval(3600);

		return "[{'res':'clear'}]";// 로그인 성공
	}

	// 로그인 실패했을때 돌아올 경로
	@RequestMapping("/clear.do")
	public String clear() {
		return "/WEB-INF/views/main/" + "mainpage.jsp";
	}

	// 로그아웃
	@RequestMapping("/logout.do")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();

		// user로 저장된 세션객체를 삭제
		session.removeAttribute("user");

		return "redirect:login_list.do";
	}
}
