package kh.fin.giboo.mypage.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import kh.fin.giboo.member.model.vo.Member;
import kh.fin.giboo.mypage.model.service.MyPointService;
import kh.fin.giboo.mypage.model.vo.Point;

@Controller
@RequestMapping("/mypage")
@SessionAttributes({ "loginMember" })
public class MyPointController {

	private Logger logger = LoggerFactory.getLogger(MyActiveController.class);

	@Autowired
	private MyPointService service;
	
	@GetMapping(value = "/myPoint")
	public String myPoint(
			@RequestParam(value = "cp", required = false, defaultValue = "1") int cp
			, Model model
			,HttpSession session,
			@ModelAttribute("loginMember") Member loginMember,
			@RequestParam Map<String, Object> paramMap
			, Point point
			) {
		int memberNo = loginMember.getMemberNo();

		Map<String, Object> map = null;
		
		map = service.selectMyPoint(cp, memberNo);
		model.addAttribute("map", map);
		
		logger.info("나의 스템프 페이지");
		return "mypage/myPoint";
	}
}
