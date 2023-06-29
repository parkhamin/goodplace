package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.BoardVO;

public class BoardDAO {
	
	SqlSession sqlSession;
	public BoardDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	// 게시글 불러오기
	public List<BoardVO> selectlist(){
		List<BoardVO> list = sqlSession.selectList("b.list_board");
		return list;
	}
	
	// 게시글 작성하기
	public int insertboard(BoardVO vo) {
		int res = sqlSession.insert("b.insert_board", vo);
		return res;
	}
	
	// 게시글 수정하기
	public int updateboard(BoardVO vo) {
		int res = sqlSession.update("b.update_board",vo);
		return res;
	}
	
	// 게시글 삭제
	public int deleteboard(int idx) {
		int res = sqlSession.delete("b.delete_board",idx);
		return res;
	}
	
}