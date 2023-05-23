package kh.fin.giboo.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;




@Controller // 생성 된 bean이 Controller 임을 명시한다.
public class MainController {
	//private MemberService service;
	
	/* index.jsp 주소로 보내주기위한 controller
	 * http://localhost:8080/comm/>>>>>>main
	 * 
	 * 실제 주소는
	 * http://localhost:8080/comm/
	 * 
	 * index.html에서
	 * forward를 받아서 main.jsp로 이동
	 * 
	 */

	@RequestMapping("/main")
	public String mainForward() {
		
		return "common/main";
		
		// 서블릿으로 이동
		// dispatcherServlet으로 이동
		// >>> view resolver로 이동
		
		
	
}

}
