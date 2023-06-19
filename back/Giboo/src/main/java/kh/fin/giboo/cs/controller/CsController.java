package kh.fin.giboo.cs.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.fin.giboo.cs.model.service.CsService;

@Controller
@RequestMapping("/cs")
public class CsController {
	
	@Autowired
	private CsService service;
	
	private Logger logger = LoggerFactory.getLogger(CsController.class);
	
	
	
	
	// 공지사항 리스트
//	@GetMapping("/csMain")
//	public String csMain() {
//		logger.info("고객센터");
//		return "cs/csMain";
//	}
	
	
	
}
