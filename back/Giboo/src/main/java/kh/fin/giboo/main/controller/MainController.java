package kh.fin.giboo.main.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;




@Controller // 생성 된 bean이 Controller 임을 명시한다.
public class MainController {
	private Logger logger = LoggerFactory.getLogger(MainController.class);
	

	@RequestMapping("/main")
	public String mainForward() {
		logger.info("main페이지");
		return "main/main";
		
		
		
		
	
}

}
