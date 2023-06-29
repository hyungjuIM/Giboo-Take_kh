package kh.fin.giboo.member.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.fin.giboo.member.model.service.KakaoLoginService;
import kh.fin.giboo.member.model.service.MemberService;
import kh.fin.giboo.member.model.vo.Manager;
import kh.fin.giboo.member.model.vo.Member;
  
@Controller
@RequestMapping("/main")
@SessionAttributes({ "loginMember" })

public class MemberController {

	// 로거 객체 생성
	private Logger logger = LoggerFactory.getLogger(MemberController.class);

	// 서비스 불러오기
	@Autowired
	private MemberService service;
	
	@Autowired
	private KakaoLoginService kakaoservice;

	// 로그인 페이지 이동
	@GetMapping(value = "/login")
	public String login() {
		logger.info("로그인페이지로이동.");
		return "main/login";
	}


	// 로그인 기능
	@PostMapping("/login")
	/* == @RequestMapping(value="login" method=RequestMethod.POST) */
	public String login(@ModelAttribute Member inputMember,
			@ModelAttribute Manager inputManager,
			Model model,
			RedirectAttributes ra, HttpServletResponse resp, HttpServletRequest req,
			@RequestParam(value="saveId", required = false) String saveId) {


		// 아이디, 비밀번호가 일치하는 회원 정보를 조회하는 service 호출 후 결과 받기
		Member loginMember = service.loginMember(inputMember);
		if(loginMember != null) { //로그인 성공 
			model.addAttribute("loginMember", loginMember);

			Cookie cookie = new Cookie("saveId", loginMember.getMemberId());
			
			if(saveId != null) { // 아이디 저장이 체크 되었을 때
				cookie.setMaxAge(60 * 60 * 24 * 365); 
			} else { // 체크 되지 않았을 때
				cookie.setMaxAge(0); 
			}
			// 쿠키가 적용될 범위(경로) 지정
			cookie.setPath(req.getContextPath());
			
			resp.addCookie(cookie);	
			
			
			
			

			logger.info("로그인 기능 수행됨");
	} else {
		logger.info("로그인 실패.");
		ra.addFlashAttribute("message", "아이디 또는 비밀번호가 일치하지 않습니다.");
		
		return "redirect:/main/login";
		
	}
		return "redirect:/";
		
		
		
	}
	
 //회원가입 화면 전환
	@GetMapping(value="/signUp")
	public String signUp() {
		logger.info("회원가입 페이지로 이동");
		return "main/signUp";
	}
	
	//이메일 중복 검사
	@ResponseBody
	@GetMapping("/emailDupCheck")
	public int emailDupCheck(String memberEmail) {
		int result = service.emailDupCheck(memberEmail);
		return result;
	}
	
	
	//닉네임 중복 검사 
	@ResponseBody
	@GetMapping("/nicknameDupCheck")
	public int nicknameDupCheck(String memberNick) {
		
		int result = service.nicknameDupCheck(memberNick);
		return result;
	}
	
	//아이디 중복 검사 
	@ResponseBody
	@GetMapping("/IdDupCheck")
	public int IdDupCheck(String memberId) {
		int result = service.IdDupCheck(memberId);
		return result;
	}
	
	
	//회원가입 
	
	@PostMapping("/signUp")
	public String signUp(Member inputMember, RedirectAttributes ra, String[] memberAddr,
			@RequestParam("memberType") String memberType) {
		
		inputMember.setMemberAddr(String.join(",,", memberAddr));
		
		if(inputMember.getMemberAddr().equals(",,,,")) {
			inputMember.setMemberAddr(null);
		}
		//radio 버튼값에 따라 memberType DB 설정
		if (memberType.equals("user")) {
	        inputMember.setMemberType("Y");
	    } else if (memberType.equals("admin")) {
	        inputMember.setMemberType("N");
	    }

		//회원 가입 서비스 호출
		int result = service.signUp(inputMember);
		
		String message = null;
		String path = null;
		
		if(result > 0) { //회원 가입 성공
			
			message = "회원 가입 성공";
			path = "redirect:/main/login"; //로그인 페이지 
			
		}else { //실패 
			
			message ="회원 가입 실패";
			path="redirect:/main/signUp"; //회원 가입 페이지
			
		}
		
		ra.addFlashAttribute("message", message);
		return path;
	}
	
	// 로그아웃
	@GetMapping("/logout")
	public String logout(SessionStatus status,HttpSession session) {
		logger.info("로그아웃 수행됨");
		 String access_Token = (String)session.getAttribute("access_Token");

	        if(access_Token != null && !"".equals(access_Token)){
	            kakaoservice.kakaoLogout(access_Token);
	            session.removeAttribute("access_Token");
	            session.removeAttribute("loginMember");
	            session.invalidate();
	        }else{
	            System.out.println("access_Token is null");
	            //return "redirect:/";
	        }
		status.setComplete();
		return "redirect:/";
	}
}