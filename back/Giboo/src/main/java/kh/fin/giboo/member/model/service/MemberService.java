package kh.fin.giboo.member.model.service;

import kh.fin.giboo.member.model.vo.Manager;
import kh.fin.giboo.member.model.vo.Member;

public interface MemberService {
	
	public abstract Member loginMember(Member inputMember);

	public abstract Manager loginManager(Manager inputManager);

	public abstract int emailDupCheck(String memberEmail);

	public abstract int sendCertificationCode(String email) throws Exception;

	public abstract int isValidCertification(String email, String cNumber);

}
