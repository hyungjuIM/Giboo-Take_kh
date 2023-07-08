package kh.fin.giboo.main.controller;

import java.text.DecimalFormat;
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

import kh.fin.giboo.donation.model.service.DonationService;
import kh.fin.giboo.donation.model.vo.Donation;
import kh.fin.giboo.donation.model.vo.DonationDetail;
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
	 @Autowired
	 private DonationService doService;
	 

	 

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
	List<Donation> mDonationList = doService.selectDonation();
	List<Donation> subList2 = mDonationList.subList(0, 6); // 0부터 5번째 인덱스까지의 서브리스트
	List<DonationDetail> donationDetails = new ArrayList<>();
	for (Donation donation : subList2) {
		int donationNo2 = donation.getDonationNo();
		DonationDetail donationDetail = doService.getDonationDetail2(donationNo2);
		LocalDate currentDate = LocalDate.now();
		LocalDate dDay = LocalDate.of(donationDetail.getEndRecruitDate().getYear() + 1900, donationDetail.getEndRecruitDate().getMonth() + 1, donationDetail.getEndRecruitDate().getDate());
        long untilDay = ChronoUnit.DAYS.between(currentDate, dDay);
        donationDetail.setDDay(untilDay);
        int percent = (Integer.parseInt(donationDetail.getDonationAmount()) * 100) / Integer.parseInt(donationDetail.getTargetAmount());
        donationDetail.setPercent(percent);
        System.out.println(percent);
       System.out.println("count"+donationDetail.getFavCount());
        System.out.println(untilDay);
        donationDetails.add(donationDetail);
	}
	model.addAttribute("volunteerDetails", volunteerDetails);
		model.addAttribute("mVolunteerList",subList);
		model.addAttribute("donationDetails",donationDetails);
		model.addAttribute("mDonationList",subList2);
		System.out.println(mVolunteerList);
		
		return "main/main";
}
	
  
	
	//메인 페이지 봉사인원 카운트
	@ResponseBody
	@GetMapping("/volCount")
    public String getCount() {
		DecimalFormat df = new DecimalFormat("###,###");
		int result =volService.getCount();
		String res = df.format(result);
        return res;
    }
	@ResponseBody
	@GetMapping("/volMoney")
	public String getVolMoney() {
		DecimalFormat df = new DecimalFormat("###,###");
    
	      int result = countService.getVolMoney();

	      String res = df.format(result);

	      System.out.println(res);

	      return res;
	}

}
