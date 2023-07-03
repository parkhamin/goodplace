package com.korea.goodplace;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.AdminDAO;
import vo.SignupVO;


@Controller
public class AdminController {

	public static final String PATH = "/WEB-INF/views/admin/";
	
	AdminDAO admin_dao;
	public AdminController(AdminDAO admin_dao) {
		this.admin_dao = admin_dao;
	}
	
	// 회원 목록 조회
	@RequestMapping(value={"/", "/list.do"})
	public String selectList(Model model) {
		List<SignupVO> list = admin_dao.selectAll();
		
		//회원목록 바인딩
		model.addAttribute("list", list);
		return PATH + "admin_list.jsp";//특정 jsp로 화면 전환(포워딩)
	}
	
	// 회원 추방
		@RequestMapping("/admin_delete.do")
		@ResponseBody
		public String memberDel(int idx) {
			int res = admin_dao.deleteMember(idx);
			return String.valueOf(res);//정수를 문자열로 바꿔서 콜백으로 전달
		}
	
	
	
}


















