
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

  // 봉사 즐겨찾기 추가
  @ResponseBody
  @GetMapping("/volunteer/addFavorite") 
  public String addFavoriteVolunteer(
		  	 int memberNo,
	         int volunteerNo)
   { 
	    

	  logger.info("memberNo" , memberNo);
	  logger.info("volunteerNo" , volunteerNo);

	  // 즐겨찾기 중복 제거 
	  boolean isFavorite = service.checkFavoriteVolunteer(memberNo, volunteerNo);
	  
	  if (isFavorite) {
		  return "duplicate";
	  }
	  
	  int result = service.addFavoriteVolunteer(memberNo,volunteerNo);
	  if (result > 0 ) {
	        return "success";
	    } else {
	        return "error";
	    }
  

  
  
	  
   }
  
  // 기부 즐겨찾기 추가
  @ResponseBody
  @GetMapping("/donation/addFavorite") 
  public String addFavoriteDonation(
		  	 int memberNo,
	         int donationNo)
   { 
	    

//	  logger.info("memberNo" , memberNo);
//	  logger.info("donationNo" , donationNo);

	    
	  boolean isFavorite = service.checkFavoriteDonation(memberNo, donationNo);
	  
	  if (isFavorite) {
		  return "duplicate";
	  }
	  
	// 즐겨찾기 중복 제거 
	  int result = service.addFavoriteDonation(memberNo,donationNo);
	  if (result > 0 ) {
	        return "success";
	    } else {
	        return "error";
	    }
  

  
  
	  
   }
  	
  
  // 기부 즐겨찾기 삭제
  @ResponseBody
  @GetMapping("/donation/removeFavorite")
  public String removeFavoriteDonation(int memberNo, int donationNo) {

      logger.info("memberNo: " + memberNo);
      logger.info("donationNo: " + donationNo);

      

      int result = service.removeFavoriteDonation(memberNo, donationNo);
      if (result > 0) {
          return "success";
      } else {
          return "error";
      }
  }
  
  
  
  
  
  
  
  
  
  }
 