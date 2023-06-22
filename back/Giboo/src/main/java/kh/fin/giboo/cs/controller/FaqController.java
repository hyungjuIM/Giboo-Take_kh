package kh.fin.giboo.cs.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kh.fin.giboo.cs.model.service.FaqService;

@Controller
@RequestMapping("/cs")
public class FaqController {
	
	@Autowired
	private FaqService service;
	
	private Logger logger = LoggerFactory.getLogger(FaqController.class);
	
	

	
	// 봉사 카테고리만 생성
	@GetMapping("/faqVolunteer")
	public String faqVolunteer(@RequestParam(value= "cp", required = false, defaultValue ="1") int cp,
			Model model)  {
		
		Map<String,Object> map = null;
		
		map = service.selectFaqVolunteer(cp, model);
		
		model.addAttribute("map", map);
		logger.info("이거의값은???????" + map);
		logger.info("봉사!!");
	 
		return "cs/faqVolunteer";
	}
	
	
	// 기부 카테고리만 생성
	@GetMapping("/faqDonation")
	public String faqDonation()  {
		
	return "cs/faqDonation";
	}
	
	// 이벤트 카테고리만 생성
	@GetMapping("/faqEvent")
	public String faqEvent()  {
		
	return "cs/faqEvent";
	}
}
	
	
	

