package kh.fin.giboo.mypage.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.fin.giboo.event.controller.EventController;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	private Logger logger = LoggerFactory.getLogger(EventController.class);
	
	//나의 문의목록
	@GetMapping(value="/myask")
	public String myask() {
		logger.info("나의문의 목록");
		return "mypage/myask";
	}
	
	//나의 리뷰
	@GetMapping(value="/myreview")
	public String myreview() {
		logger.info("나의리뷰 목록");
		return "mypage/myreview";
	}
	
	
}
