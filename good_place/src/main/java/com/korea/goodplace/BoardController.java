package com.korea.goodplace;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import dao.BoardDAO;
import vo.BoardVO;

@Controller
public class BoardController {

	@Autowired//자동주입
	HttpServletRequest request;
	
	@Autowired
	ServletContext application;//애플리케이션의 정보를 담고있는 클래스
	
	public static final String PATH = "/WEB-INF/views/board/";
	
	BoardDAO board_dao;
	public BoardController(BoardDAO board_dao) {
		this.board_dao = board_dao;
	}
	
	// 게시글 불러오기
	@RequestMapping(value={"/", "/list.do"})
	public String boardlist(Model model) {
		List<BoardVO> list = board_dao.selectlist();
		model.addAttribute("list",list);
		return PATH+"board_list.jsp";
	}
	
	// 게시글 작성을 위한 페이지로 전환
	@RequestMapping("/board_insert_form.do")
	public String insert_form() {
		return PATH+"board_insert_form.jsp";
	}
	
	// 게시글 작성하기
	@RequestMapping("/board_insert.do")
	public String insert(BoardVO vo) {
		
		// ip 불러오기
		String ip = request.getRemoteAddr();
		vo.setIp(ip);
		
		// 절대경로를 찾기위한 준비
		String webPath = "/resources/upload/";
		String savePath = application.getRealPath(webPath);
		System.out.println("절대경로 : " + savePath);

		// 업로드를 위해 보내진 photo라는 이름의 파일정보
		MultipartFile photo = vo.getPhoto();

		String filename = "no_file";

		// 업로드 된 파일이 존재한다면
		if (!photo.isEmpty()) {
			// 업로드된 실제 파일의 이름
			filename = photo.getOriginalFilename();

			// 저장할 파일의 경로
			File saveFile = new File(savePath, filename);

			if (!saveFile.exists()) {
				saveFile.mkdirs();
			} else {
				// 동일파일명에 대한 이름 수정
				long time = System.currentTimeMillis();
				filename = String.format("%d_%s", time, filename);
				saveFile = new File(savePath, filename);
			}

			try {
				photo.transferTo(saveFile);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		// vo에 파일명 세팅 후 DB에 insert
		vo.setFilename(filename);
		board_dao.insertboard(vo);

		// Controller에서 url매핑을 호출해야 하는 경우
		// sendRedirect("list.do");
		// redirect를 나중에 게시글 jsp로 보내야함
		return "redirect:list.do";
	}
	
	// 게시글 수정을 위한 페이지로 전환
	@RequestMapping("board_update_form.do")
	public String update_form(Model model, BoardVO vo) {
		model.addAttribute("vo",vo);
		return PATH + "board_update_form.jsp";
	}
	
	// 게시글 수정
	@RequestMapping("/board_update.do")
	public String update(BoardVO vo) {
		//request로 ip를 찾는다
		String ip = request.getRemoteAddr();
		vo.setIp(ip);
		
		int res = board_dao.updateboard(vo);
		
		return "redirect:list.do";
	}
	
	// 게시글 삭제
	@RequestMapping(value="/board_delete.do", produces="application/json;charset=UTF-8" )
	@ResponseBody
	public String delete(int idx, String photo) {
		// DAO에 idx에 해당하는 게시글 삭제하는 요청
		int res = board_dao.deleteboard(idx);

		String result = "삭제 실패";

		if (res != 0) {// 삭제 성공
			result = "삭제 성공";

			// 이미지가 업로드 된 게시글시 삭제 되었다면 이미지까지 지워줘야 한다
			String webPath = "/resources/upload/";
			String savePath = application.getRealPath(webPath);

			File file = new File(savePath, photo);
			if (file.exists()) {
				file.delete();
			}

		}

		String str = String.format("[{'result':'%s'}]", result);

		// JSON구조의 str을 콜백메서드로 전달
		return str;
	}
	
}


















