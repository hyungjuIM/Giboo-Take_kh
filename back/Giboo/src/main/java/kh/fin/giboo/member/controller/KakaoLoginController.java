package kh.fin.giboo.member.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import kh.fin.giboo.member.model.service.KakaoLoginService;
import kh.fin.giboo.member.model.vo.Member;


	
@SessionAttributes({ "loginMember" })
@Controller
//@RequestMapping(value="/Giboo")
public class KakaoLoginController {
	// 로거 객체 생성
		private Logger logger = LoggerFactory.getLogger(MemberController.class);
	@Autowired
	private KakaoLoginService kakaoservice;
	@Autowired
	private HttpSession session;
	
	@RequestMapping("/oauth/kakao")
	public String kakaoLogin(@RequestParam(value = "code" ,required = false) String code,
			Model model) throws Exception {
		System.out.println("#########" + code);
		String access_Token = kakaoservice.getAccessToken(code);
		Member loginMember = kakaoservice.getUserInfo(access_Token);
		System.out.println("###access_Token#### : " + access_Token);
		System.out.println("loginMember : "+loginMember);
		session.setAttribute("loginMember", loginMember);
		if(loginMember !=null) {
			session.setAttribute("loginMember", loginMember);
			session.setAttribute("access_Token", access_Token);
			 return "redirect:/main";
        } else {
            // 회원 정보가 없으면 로그인 실패 처리
            
            // 로그인 실패 메시지를 모델에 추가
            model.addAttribute("message", "로그인에 실패하였습니다.");
            
            // 로그인 실패 시 이동할 페이지로 포워드
            return "redirect:/main/login";
        }
		
	}


	
}
