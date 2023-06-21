package kh.fin.giboo.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.functors.ExceptionClosure;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.fin.giboo.member.model.service.MemberService;

@Controller
@RequestMapping("/main")
public class CheckNumberController {
	
	@Autowired
	private MemberService service;
	
	@GetMapping("/sendEmail")
	@ResponseBody
	public int sendCertificationCode(HttpServletRequest req, Model model) throws Exception {
		String email2 = req.getParameter("memberEmail");
		System.out.println("email:"+email2);
		int result = service.sendCertificationCode(email2);
		
		model.addAttribute("email2", email2);
		return result;
	}
	
	@GetMapping("/checkNumber")
	@ResponseBody
	public int confirmCertificationCode(HttpServletRequest req, Model model) {
		String email2 = req.getParameter("memberEmail");
		String cNumber = req.getParameter("cNumber");
		int result = service.isValidCertification(email2, cNumber);
		if(result == 1) {
			model.addAttribute("message","인증되었습니다.");
			
		}else if(result == 2) {
			model.addAttribute("message","완료된 인증 번호 입니다." );
			
		}else {
			model.addAttribute("message", "인증 번호가 일치하지 않습니다.");
		
		
		}
		
		return result;
		
	}
}
