package kh.fin.giboo.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.fin.giboo.member.model.dao.MemberDAO;
import kh.fin.giboo.member.model.vo.Manager;
import kh.fin.giboo.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDAO dao;
	
	@Override
	public Member loginMember(Member inputMember) {
		Member loginMember = dao.loginMember(inputMember);
//		if(loginMember !=null) {
//			if(loginMember.getMemberPw() == inputMember.getMemberPw()) {
//				loginMember.setMemberPw(null);
//			}else {
//				loginMember =null;
//			}
//		}
		return loginMember;
	}

	/** 관리자 로그인
	 *
	 */
	@Override
	public Manager loginManager(Manager inputManager) {
		Manager loginManager = dao.loginManager(inputManager);
		return loginManager;
	}

	@Override
	public int emailDupCheck(String memberEmail) {
		return dao.emailDupCheck(memberEmail);
	}
	
	

}
