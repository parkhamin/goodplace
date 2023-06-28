package com.korea.goodplace;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
}














