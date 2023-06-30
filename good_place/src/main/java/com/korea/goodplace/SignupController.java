package com.korea.goodplace;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.SignupDAO;
import vo.SignupVO;

@Controller
public class SignupController {

	public static final String PATH = "/WEB-INF/views/signup/";
	
	SignupDAO signup_dao;
	public SignupController(SignupDAO signup_dao) {
		this.signup_dao = signup_dao;
	}
	
	//회원가입 폼으로 이동
		@RequestMapping("/signup_insert_form.do")
		public String moveInsertForm() {
			return PATH + "signup_insert_form.jsp";
		}
		
		//회원가입
		@RequestMapping("/insert.do")
		public String insertUser(SignupVO vo) {
			
			int res = signup_dao.insertUser(vo);
			return "redirect:login_list.do";
		}
		
		//아이디 중복체크를 위한 메서드
		@RequestMapping("/check_id.do")
		@ResponseBody //Ajax로 요청받은 url매핑은 작업완료후 콜백 메서드로 돌아가기 위해 어노테이션 사용
		public String check_id( String id ) {
			SignupVO vo = signup_dao.checkId( id );
			
			String result = "no";
			if( vo != null ) {
				result = "yes";//아이디가 중복될 경우
			}
			
			return result;//result값을 가지고 콜백 메서드로 복귀
		}
		
	
}














