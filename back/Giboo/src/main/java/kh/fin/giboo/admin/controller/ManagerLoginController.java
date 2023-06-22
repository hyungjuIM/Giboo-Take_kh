package kh.fin.giboo.admin.controller;






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
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.fin.giboo.member.model.service.MemberService;
import kh.fin.giboo.member.model.vo.Manager;
import kh.fin.giboo.member.model.vo.Member;

@Controller
@RequestMapping("/admin")
@SessionAttributes({ "loginManager" })
public class ManagerLoginController {

	// 로거 객체 생성
	private Logger logger = LoggerFactory.getLogger(ManagerLoginController.class);

	// 서비스 불러오기
	@Autowired
	private MemberService service;

	// 로그인 페이지 이동
	@GetMapping(value = "/mLogin")
	public String login() {
		logger.info("로그인페이지로이동.");
		return "admin/mLogin";
	}


	// 로그인 기능
	@PostMapping("/mLogin")
	/* == @RequestMapping(value="login" method=RequestMethod.POST) */
	public String login(
			@ModelAttribute Manager inputManager,
			Model model,
			RedirectAttributes ra, HttpServletResponse resp, HttpServletRequest req) {


		// 아이디, 비밀번호가 일치하는 회원 정보를 조회하는 service 호출 후 결과 받기
		Manager loginManager = service.loginManager(inputManager);
		if(loginManager != null) { //로그인 성공 
			model.addAttribute("loginManager", loginManager);
			
			logger.info("로그인 기능 수행됨");
		} else {
			logger.info("로그인 실패.");
			ra.addFlashAttribute("message", "아이디 또는 비밀번호가 일치하지 않습니다.");

			return "redirect:/admin/mLogin";
		}
			return "redirect:/admin/home";
	}
}