package kh.fin.giboo.main.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.fin.giboo.mypage.model.service.MyActiveService;
import kh.fin.giboo.volunteer.model.service.VolunteerService;




@Controller // 생성 된 bean이 Controller 임을 명시한다.
public class MainController {
	private Logger logger = LoggerFactory.getLogger(MainController.class);
	
	
	@Autowired
	private MyActiveService countService;
	
	 @Autowired
	private VolunteerService volService;

	@RequestMapping("/main")
	public String mainForward( Model model) {
		logger.info("main페이지");
		
//		 Map<String, Object> map = null;
//	        map = volService.selectVolunteerList();
//
//	        model.addAttribute("map", map);
		
		
		return "main/main";
}
	//메인 페이지 봉사인원 카운트
	@ResponseBody
	@GetMapping("/volCount")
    public int getCount() {
        return countService.getCount();
    }
	@ResponseBody
	@GetMapping("/volMoney")
	public int getVolMoney() {
		return countService.getVolMoney();
	}

}
