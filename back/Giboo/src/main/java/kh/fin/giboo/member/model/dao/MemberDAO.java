package kh.fin.giboo.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.fin.giboo.member.model.vo.Member;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	public Member loginMember(Member inputMember) {
		Member loginMember = sqlSession.selectOne("member-mapper.login", inputMember);
		return loginMember;
	}

}
