package kh.fin.giboo.mypage.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.fin.giboo.event.controller.EventController;


@Controller
@RequestMapping("/mypage")
public class MyAskController {
	private Logger logger = LoggerFactory.getLogger(EventController.class);
	
	// 나의 문의
		@GetMapping(value = "/myask")
		public String myask() {
			logger.info("나의문의");
			return "mypage/myask";
		}
		
		// 나의 문의내역 글쓰기
		@GetMapping(value = "/myaskWrite")
		public String myaskWrite() {
			logger.info("나의문의 글쓰기");
			return "mypage/myaskWrite";
		}

		// 나의 문의내역 상세내용
		@GetMapping(value = "/myaskDetail")
		public String myaskDetail1() {
			logger.info("나의문의 상세");
			return "mypage/myaskDetail";
		}
		
		//==========================================
	
}
