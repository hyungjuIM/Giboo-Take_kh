package kh.fin.giboo.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.fin.giboo.member.model.vo.Manager;
import kh.fin.giboo.member.model.vo.Member;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	public Member loginMember(Member inputMember) {
		Member loginMember = sqlSession.selectOne("memberMapper.login", inputMember);
		return loginMember;
	}


	/** 관리자 로그인
	 * @param inputManager
	 * @return
	 */
	public Manager loginManager(Manager inputManager) {
		Manager loginManager = sqlSession.selectOne("memberMapper.managerLogin", inputManager);
		return loginManager;
	}

}
