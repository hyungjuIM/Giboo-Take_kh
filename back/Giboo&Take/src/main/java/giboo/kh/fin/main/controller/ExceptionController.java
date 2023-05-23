package giboo.kh.fin.main.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;


@ControllerAdvice
public class  ExceptionController {
	
	
	
	@ExceptionHandler(Exception.class)
	public String exceptionHandler(Exception e, Model model) {
		e.printStackTrace();
		
		model.addAttribute("errorMessage", "?��비스 ?��?�� �? 문제�? 발생?��?��?��?��.");
		model.addAttribute("e", e);
		
		
		return "common/error";
	}
	
	
}
