package dao;

import org.apache.ibatis.session.SqlSession;

public class SignupDAO {
	SqlSession sqlSession;
	public SignupDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
}
