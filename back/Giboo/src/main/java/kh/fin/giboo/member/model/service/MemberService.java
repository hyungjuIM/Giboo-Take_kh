package kh.fin.giboo.member.model.service;

import kh.fin.giboo.member.model.vo.Manager;
import kh.fin.giboo.member.model.vo.Member;

public interface MemberService {
	
	public abstract Member loginMember(Member inputMember);

	public abstract Manager loginManager(Manager inputManager);

	public abstract int emailDupCheck(String memberEmail);

	public abstract int sendCertificationCode(String email2) throws Exception;

	public abstract int isValidCertification(String email2, String cNumber);

	public abstract int nicknameDupCheck(String memberNick);

	public abstract int IdDupCheck(String memberId);

	public abstract int signUp(Member inputMember);

}
