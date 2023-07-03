package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.SignupVO;

public class AdminDAO {
	SqlSession sqlSession;

	public AdminDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	// 전체 회원목록 조회
	public List<SignupVO> selectAll() {
		List<SignupVO> list = sqlSession.selectList("a.admin_list");
		return list;
	}

	// 회원삭제
	public int deleteMember(int idx) {

		int res = sqlSession.delete("a.admin_delete", idx);
		return res;
	}

}