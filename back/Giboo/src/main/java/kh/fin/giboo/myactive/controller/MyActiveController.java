package kh.fin.giboo.myactive.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


import kh.fin.giboo.event.controller.EventController;
import kh.fin.giboo.myactive.model.service.MyActiveService;

@Controller
@RequestMapping("/mypage")
public class MyActiveController {
	private Logger logger = LoggerFactory.getLogger(EventController.class);
	
	
	// 나의 활동1(기부)
		@GetMapping(value = "/myactive_1")
		public String myactive_1() {
			logger.info("나의활동1");
			return "mypage/myactive_1";
		}

		// 나의 활동2(봉사)
		@GetMapping(value = "/myactive_2")
		public String myactive_2() {
			logger.info("나의활동2");
			return "mypage/myactive_2";
		}

		// 나의 활동3(참여한 이벤트)
		@GetMapping(value = "/myactive_3")
		public String myactive_3() {
			logger.info("나의활동3");
			return "mypage/myactive_3";
		}
		
		// 인증서 출력
		@GetMapping(value = "/reportPrint")
		public String reportPrint() {
			logger.info("인증서 출력");
			return "mypage/reportPrint";
		}
		
		//==========================================
	
	
}
