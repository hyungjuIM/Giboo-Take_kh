package giboo.kh.fin.main.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;


@ControllerAdvice
public class  ExceptionController {
	
	
	
	@ExceptionHandler(Exception.class)
	public String exceptionHandler(Exception e, Model model) {
		e.printStackTrace();
		
		model.addAttribute("errorMessage", "?ÑúÎπÑÏä§ ?ù¥?ö© Ï§? Î¨∏Ï†úÍ∞? Î∞úÏÉù?ñà?äµ?ãà?ã§.");
		model.addAttribute("e", e);
		
		
		return "common/error";
	}
	
	
}
