package giboo.kh.fin.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller // 컨트롤러임을 명시 + bean 등록  (컴포넌트 스캔 시 bean으로 생성됨)
public class MainController {
	
	/*
	 * http://localhost:8080/comm/main
	 * http://localhost:8080/comm/
	 * 
	 * */
	
	
	@RequestMapping("/main")
	public String mainForward() {
		
		
		// index.jsp의 forward을 처리하는  mainForward()에서
		// 다시 한번 common/main.jsp로 forward
		return "common/main";
		
	}
}