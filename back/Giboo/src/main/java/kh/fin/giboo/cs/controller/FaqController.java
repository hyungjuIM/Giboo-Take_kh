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
import kh.fin.giboo.cs.model.vo.*;

@Controller
@RequestMapping("/cs")
public class FaqController {
	
	@Autowired
	private FaqService service;
	
	private Logger logger = LoggerFactory.getLogger(FaqController.class);
	
	  @GetMapping("/faqList") 
	  public String csMain(@RequestParam(value= "cp",required = false, defaultValue ="1") int cp, 
			  Model model ) {
		  
		  Map<String,Object> map = null;
		  
		 map = service.selectFaqList(cp, model);
		  
		  model.addAttribute("map", map); 
		  //logger.info("이거의값은???????" + map);
		  //logger.info("고객센터");
		  
		  return "cs/faqList"; 
		  }

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
	public String faqDonation(@RequestParam(value= "cp", required = false, defaultValue ="1") int cp,
			Model model)  {
		
		Map<String,Object> map = null;
		
		map = service.selectFaqDanation(cp, model);
		
		model.addAttribute("map", map);
		logger.info("이거의값은???????" + map);
		logger.info("기부!!");
	   
		
		return "cs/faqDonation";
	}
	
	// 이벤트 카테고리만 생성
	@GetMapping("/faqEvent")
	public String faqEvent(@RequestParam(value= "cp", required = false, defaultValue ="1") int cp,
			Model model)  {
		
		Map<String,Object> map = null;
		
		map = service.selectFaqEvent(cp, model);
		
		model.addAttribute("map", map);
		logger.info("이거의값은???????" + map);
		logger.info("이벤트!!");
	   
		
		return "cs/faqEvent";
	}
	
		// 일반 카테고리만 생성
		@GetMapping("/faqCommon")
		public String faqCommon(@RequestParam(value= "cp", required = false, defaultValue ="1") int cp,
				Model model)  {
			
			Map<String,Object> map = null;
			
			map = service.selectFaqCommon(cp, model);
			
			model.addAttribute("map", map);
			logger.info("이거의값은???????" + map);
			logger.info("일반!!");
		   
			
			return "cs/faqCommon";
		}
}
	
	
	

