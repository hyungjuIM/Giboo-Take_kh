
  package kh.fin.giboo.mypage.controller;
  
  import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import kh.fin.giboo.donation.model.vo.Donation;
import kh.fin.giboo.member.model.vo.Member;
import kh.fin.giboo.mypage.model.service.FavoriteService;
//import kh.fin.giboo.mypage.model.service.FavoriteService;
import kh.fin.giboo.volunteer.model.vo.Volunteer; 
  
  //즐겨찾기 컨트롤러
  
  @Controller
  @SessionAttributes({ "loginMember" })
  public class FavoriteController {
  private Logger logger = LoggerFactory.getLogger(FavoriteController.class);
  
  @Autowired 
  private FavoriteService service;
  
  @ResponseBody
  @GetMapping("/volunteer/addFavorite") 
  public String addFavorite(
		  	 int memberNo,
	         int volunteerNo)
   { 
	    

	  logger.info("memberNo" , memberNo);
	  logger.info("volunteerNo" , volunteerNo);

	    
	  boolean isFavorite = service.checkFavorite(memberNo, volunteerNo);
	  
	  if (isFavorite) {
		  return "duplicate";
	  }
	  
	  int result = service.addfavorite(memberNo,volunteerNo);
	  if (result > 0 ) {
	        return "success";
	    } else {
	        return "error";
	    }
  

  
  
	  
   }
  
  }
 