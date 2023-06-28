package com.korea.goodplace;

import org.springframework.stereotype.Controller;

import dao.BoardDAO;

@Controller
public class BoardController {

	public static final String PATH = "/WEB-INF/views/";
	
	BoardDAO board_dao;
	public BoardController(BoardDAO board_dao) {
		this.board_dao = board_dao;
	}
	
	
}


















