package kh.fin.giboo.main.controller;

import java.sql.SQLException;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class ExceptionController {
	
	@ExceptionHandler(Exception.class)
	public String exceptionHandler(Exception e, Model model) {
		e.printStackTrace();
		
		model.addAttribute("errorMessage", "서비스 이용중 문제가 발생하였습니다.");
		model.addAttribute("e", e);
		return "common/error";
	}
	
	// SQL exception 등 여러개의 exception을 생성할수있따.
	@ExceptionHandler(SQLException.class)
	public String exceptionHandler(SQLException e, Model model) {
		e.printStackTrace();
		
		model.addAttribute("errorMessage", "서비스 이용중 문제가 발생하였습니다.");
		model.addAttribute("e", e);
		return "common/error";
	}
	
}
