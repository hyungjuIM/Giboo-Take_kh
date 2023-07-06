package kh.fin.giboo.mypage.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import kh.fin.giboo.member.model.vo.Member;
import kh.fin.giboo.mypage.model.service.MyStampService;
import kh.fin.giboo.mypage.model.vo.Stamp;

@Controller
@RequestMapping("/mypage")
@SessionAttributes({ "loginMember" })
public class MyStampController {

	private Logger logger = LoggerFactory.getLogger(MyActiveController.class);

	@Autowired
	private MyStampService service;
	
	@GetMapping(value = "/myStamp")
	public String myStamp(

			) {
		
		logger.info("나의 스템프 페이지");
		return "mypage/myStamp";
	}
}
