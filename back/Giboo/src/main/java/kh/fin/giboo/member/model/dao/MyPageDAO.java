package kh.fin.giboo.member.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyPageDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//회원정보 변경
	public int memberChange(Map<String, Object> paramMap) {
		return sqlSession.update("memberMapper.memberChange", paramMap);
	}
	
	//비번변경
	public int changePw(Map<String, Object> paramMap) {
		return sqlSession.update("memberMapper.changePw", paramMap);
	}
	
	//프로필 이미지 수정
	public int changeProfile(Map<String, Object> map) {
		return sqlSession.update("memberMapper.changeProfile", map);
	}

	//회원탈퇴
	public int withdrawal(int memberNo) {
		return sqlSession.update("memberMapper.withdrawal", memberNo);
	}

	

	
	
}
