package kh.fin.giboo.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.fin.giboo.member.model.dao.MemberDAO;
import kh.fin.giboo.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDAO dao;
	
	@Override
	public Member loginMember(Member inputMember) {
		Member loginMember = dao.loginMember(inputMember);
		
		return loginMember;
	}
	
	

}
