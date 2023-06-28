package dao;

import org.apache.ibatis.session.SqlSession;

import vo.SignupVO;

public class LoginDAO {
	SqlSession sqlSession;
	public LoginDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//로그인
	public SignupVO checkId( String id ) {
		SignupVO vo = sqlSession.selectOne("l.check_id", id);
		return vo;
	}
}
