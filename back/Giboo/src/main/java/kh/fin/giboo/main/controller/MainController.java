package kh.fin.giboo.main.controller;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.List;
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
import kh.fin.giboo.volunteer.model.vo.Volunteer;
import kh.fin.giboo.volunteer.model.vo.VolunteerDetail;




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
		
	List<Volunteer> mVolunteerList =volService.selectVolunteer();
	List<Volunteer> subList = mVolunteerList.subList(0, 6); // 0부터 5번째 인덱스까지의 서브리스트
	List<VolunteerDetail> volunteerDetails = new ArrayList<>();
	for (Volunteer volunteer : subList) {
		int volunteerNo2 = volunteer.getVolunteerNo();
		VolunteerDetail volunteerDetail = volService.getVolunteerDetail2(volunteerNo2);
		LocalDate currentDate = LocalDate.now();
		LocalDate dDay = LocalDate.of(volunteerDetail.getEndRecruitDate().getYear() + 1900, volunteerDetail.getEndRecruitDate().getMonth() + 1, volunteerDetail.getEndRecruitDate().getDate());
        long untilDay = ChronoUnit.DAYS.between(currentDate, dDay);
        volunteerDetail.setDDay(untilDay);
        int percent = (volunteerDetail.getVolunteerCount() * 100) / volunteerDetail.getTargetPeople();
        volunteerDetail.setPercent(percent);
        System.out.println(percent);
        System.out.println(volunteerDetail.getVolunteerAttachment());
        System.out.println(untilDay);
        volunteerDetails.add(volunteerDetail);
	}
	model.addAttribute("volunteerDetails", volunteerDetails);
		model.addAttribute("mVolunteerList",subList);
		System.out.println(mVolunteerList);
		
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
