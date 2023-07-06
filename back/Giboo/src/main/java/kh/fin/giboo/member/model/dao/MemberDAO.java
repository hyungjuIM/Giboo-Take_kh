package kh.fin.giboo.member.model.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.fin.giboo.member.model.vo.Manager;
import kh.fin.giboo.member.model.vo.Member;

@Repository
public class MemberDAO {
	  
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private Logger logger = LoggerFactory.getLogger(MemberDAO.class);
	
	public Member loginMember(Member inputMember) {
		Member loginMember = sqlSession.selectOne("memberMapper.login", inputMember);
		return loginMember;
	}


	/** 관리자 로그인
	 * @param inputManager
	 * @return
	 */
	public Manager loginManager(Manager inputManager) {
		return sqlSession.selectOne("memberMapper.managerLogin", inputManager);
	}

	/** 이메일 인증
	 * @param memberEmail
	 * @return
	 */
	public int emailDupCheck(String memberEmail) {
		return sqlSession.selectOne("memberMapper.emailDupCheck", memberEmail);
	}


	public int insertCertification(Map<String, Object> map) {
		return sqlSession.insert("memberMapper.insertCertification", map);
	}


	public int selectCertification(Map<String, Object> map) {
		int result = sqlSession.selectOne("memberMapper.checkNumber", map);
		return result;
	}


	/** 닉네 인증  
	 * @param memberNick
	 * @return
	 */
	public int nicknameDupCheck(String memberNick) {
		return sqlSession.selectOne("memberMapper.nicknameDupCheck", memberNick);
	}


	public int IdDupCheck(String memberId) {
		return sqlSession.selectOne("memberMapper.IdDupCheck", memberId);
	}


	public int signUp(Member inputMember) {
		return sqlSession.insert("memberMapper.signUp", inputMember);
	}


	public Member findkakao(HashMap<String, Object> userInfo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.kakao",userInfo);
	}


	public void kakaoinsert(HashMap<String, Object> userInfo) {
		sqlSession.insert("memberMapper.kakaoinsert",userInfo);
		System.out.println("userInfo: "+userInfo);
	}


	


}
