package kh.fin.giboo.member.model.service;

import java.util.HashMap;
import java.util.Map;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kh.fin.giboo.member.model.dao.MemberDAO;
import kh.fin.giboo.member.model.vo.Manager;
import kh.fin.giboo.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private BCryptPasswordEncoder bcrypt;
	
	@Autowired
	private MemberDAO dao;
	
	@Autowired
	public JavaMailSender sender;
	
	public void setJavaMailSender(JavaMailSender sender) {
		this.sender = sender;
	}
	
	//로그인 
	@Override
	public Member loginMember(Member inputMember) {
		Member loginMember = dao.loginMember(inputMember);
		if(loginMember !=null) {
			if(bcrypt.matches(inputMember.getMemberPw(), loginMember.getMemberPw())){
				loginMember.setMemberPw(null);
			}else {
				loginMember =null;
			}
		}
		return loginMember;
	}

	/** 관리자 로그인
	 *
	 */
	@Override
	public Manager loginManager(Manager inputManager) {
		return dao.loginManager(inputManager);
	}

	@Override
	public int emailDupCheck(String memberEmail) {
		return dao.emailDupCheck(memberEmail);
	}

	/** 이메일 인증
	 *
	 */
	
	//6자리 인증번호 생성
	
	private String CertificationNumber() {
		String cNumber = "";
		for (int i = 0; i < 6; i++) {

			int sel1 = (int) (Math.random() * 3); // 0:숫자 / 1,2:영어

			if (sel1 == 0) {

				int num = (int) (Math.random() * 10); // 0~9
				cNumber += num;

			} else {

				char ch = (char) (Math.random() * 26 + 65); // A~Z

				int sel2 = (int) (Math.random() * 2); // 0:소문자 / 1:대문자

				if (sel2 == 0) {
					ch = (char) (ch + ('a' - 'A')); // 대문자로 변경
				}

				cNumber += ch;
			}

		}
		return cNumber;
	}
	
	@Override
	public int sendCertificationCode(String email2) throws Exception {
		String certificationNumber = CertificationNumber();

		// 메일 전송
		MimeMessage message = sender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message);
		helper.setTo(email2);
		helper.setSubject("이메일 인증을 진행해주세요.");
		helper.setText("인증번호: " + certificationNumber);
		helper.setFrom("gibootake@gmail.com");
		sender.send(message);

		Map<String, Object> map = new HashMap<>();
		map.put("memberEmail", email2);
		map.put("cNumber", certificationNumber);
		// 인증번호를 DB에 저장
		int result = dao.insertCertification(map);
		return result;
	}
	
	@Override
	public int isValidCertification(String email2, String cNumber) {
		Map<String, Object> map = new HashMap<>();
		map.put("memberEmail", email2);
		map.put("cNumber", cNumber);
		int result = dao.selectCertification(map);
		return result;
	}

	@Override
	public int nicknameDupCheck(String memberNick) {
		return dao.nicknameDupCheck(memberNick);
	}

	@Override
	public int IdDupCheck(String memberId) {
		return dao.IdDupCheck(memberId);
	}

	
//	회원가입 
	@Override
	public int signUp(Member inputMember) {
		
		//비밀번호 암호화(bcrypt)
		
		String encPw = bcrypt.encode(inputMember.getMemberPw());
		inputMember.setMemberPw(encPw);
		
		int result = dao.signUp(inputMember);
		return result;
	}
	
	
	
	

	
	
	

	
	
	

}
