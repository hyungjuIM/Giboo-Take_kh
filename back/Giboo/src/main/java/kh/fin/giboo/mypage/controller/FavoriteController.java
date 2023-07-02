
  package kh.fin.giboo.mypage.controller;
  
  import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import kh.fin.giboo.donation.model.vo.Donation;
import kh.fin.giboo.member.model.vo.Member;
//import kh.fin.giboo.mypage.model.service.FavoriteService;
import kh.fin.giboo.volunteer.model.vo.Volunteer; 
  
  //즐겨찾기 컨트롤러
  
  @Controller
  
  @RequestMapping("/main")
  
  @SessionAttributes({ "loginMember" })
  
  public class FavoriteController {
  private Logger logger = LoggerFactory.getLogger(FavoriteController.class);
  
//  @Autowired private FavoriteService service;
  
  @ResponseBody
  @PostMapping("/addfavorite") 
  public String addfavorite(@RequestParam(value ="cp", required = false, defaultValue = "1") int cp , Model model
  ,@ModelAttribute("loginMember") Member loginMember
  ,@ModelAttribute("volunteer") Volunteer volunteer
  ,@ModelAttribute("donationNo") Donation donation
  )
   { 
	 
	  int memberNo = loginMember.getMemberNo();
	  int volunteerNo = volunteer.getVolunteerNo();
	  int donationNo = donation.getDonationNo();
	  
	  	Map<String, Object> paramMap = new HashMap<>();
	    paramMap.put("member", loginMember);
	    paramMap.put("volunteer", volunteer);
	    paramMap.put("donation", donation);
	    
//	    int result = service.addfavorite(paramMap);
	    
  
	    logger.info("paramMap: {}", paramMap);

  
  
	    return "result";
   }
  
  }
 