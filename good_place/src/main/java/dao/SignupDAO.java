package dao;

import org.apache.ibatis.session.SqlSession;

import vo.SignupVO;

public class SignupDAO {
	SqlSession sqlSession;
	public SignupDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//회원추가
		public int insertUser(SignupVO vo) {
			
			int res = sqlSession.insert("s.insert_user", vo);
			return res;
			
		}
		
		//아이디 중복체크
		public SignupVO checkId( String id ) {
			SignupVO vo = sqlSession.selectOne("s.checkid", id);
			return vo;
		}
}
