package kh.fin.giboo.myactive.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import kh.fin.giboo.event.controller.EventController;
import kh.fin.giboo.member.model.vo.Member;
import kh.fin.giboo.myactive.model.service.MyActiveService;

@Controller
@RequestMapping("/mypage")
@SessionAttributes({"loginMember"})
public class MyActiveController {
	private Logger logger = LoggerFactory.getLogger(EventController.class);
	
	@Autowired
	private MyActiveService service;
	
	// 나의 활동1(기부 목록 조회)
		@GetMapping(value = "/myactive_1/{boardCode}")
		public String myactive_1(@PathVariable("boardCode") int boardCode,
								@RequestParam(value = "cp", required = false, defaultValue = "1") int cp,
								Model model, HttpSession session ) {
			Map<String, Object> map = null;
			
			map = service.selectMyactiveDonationList(cp, boardCode);
			model.addAttribute("map",map);
			logger.info("기부 목록조회(나의활동1)로 이동");
			Member loginMember = (Member)session.getAttribute("loginMember");
			System.out.println(loginMember);
			
			return "mypage/myactive_1";
		}
		
		
		
		//==========================================
		

		// 나의 활동2(봉사 목록 조회)
		@GetMapping(value = "/myactive_2")
		public String myactive_2() {
			logger.info("나의활동2");
			return "mypage/myactive_2";
		}
		
		
		//==========================================

		// 나의 활동3(참여한 이벤트 목록 조회)
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
		
		
	
	
}