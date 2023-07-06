
  package kh.fin.giboo.mypage.controller;
  
  import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import kh.fin.giboo.mypage.model.service.FavoriteService; 
  
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
		  @RequestParam int memberNo,
		    @RequestParam int volunteerNo,
		    @RequestParam("volunteerTitle") String volunteerTitle
	         )
   { 
	    

	  logger.info("memberNo......." , memberNo);
	  logger.info("volunteerNo" , volunteerNo);
	  logger.info("volunteerTitle" , volunteerTitle);
	 

	  // 봉사 즐겨찾기 중복 제거 
	  boolean isFavorite = service.checkFavoriteVolunteer(memberNo, volunteerNo);
	  
	  if (isFavorite) {
		  return "duplicate";
	  }
	  
	  int result = service.addFavoriteVolunteer(memberNo,volunteerNo,volunteerTitle);
	  if (result > 0 ) {
	        return "success";
	    } else {
	        return "error";
	    }
   }
	  
	// 봉사 즐겨찾기 삭제
	  @ResponseBody
	  @GetMapping("/volunteer/deleteFavorite")
	  public String deleteFavoriteVolunteer(int memberNo, int volunteerNo) {

	      logger.info("memberNo:::::::::: " + memberNo);
	      logger.info("volunteerNo: " + volunteerNo);

	      

	      int result = service.deleteFavoriteVolunteer(memberNo, volunteerNo);
	      if (result > 0) {
	          return "success";
	      } else {
	          return "error";
	      }
	  }
  
  
	  
   
  
  // 기부 즐겨찾기 추가
  @ResponseBody
  @GetMapping("/donation/addFavorite") 
  public String addFavoriteDonation(
		  @RequestParam int memberNo,
		    @RequestParam int donationNo,
		    @RequestParam String donationTitle
		    )
   { 
	    

	  logger.info("memberNo" , memberNo);
	  logger.info("donationNo" , donationNo);
	  logger.info("donationTitle" , donationTitle);
	 

	// 기부 즐겨찾기 중복 제거 
	  boolean isFavorite = service.checkFavoriteDonation(memberNo, donationNo);
	  
	  if (isFavorite) {
		  return "duplicate";
	  }
	  
	
	  int result = service.addFavoriteDonation(memberNo, donationNo,donationTitle);
	    if (result > 0 ) {
	        return "success";
	    } else {
	        return "error";
	    }
  

  
  
	  
   }
  	
  
  // 기부 즐겨찾기 삭제
  @ResponseBody
  @GetMapping("/donation/deleteFavorite")
  public String deleteFavoriteDonation(int memberNo, int donationNo) {

      logger.info("memberNo: " + memberNo);
      logger.info("donationNo: " + donationNo);

      

      int result = service.deleteFavoriteDonation(memberNo, donationNo);
      if (result > 0) {
          return "success";
      } else {
          return "error";
      }
  }
  
  // 기부, 봉사, 이벤트 조회
  @GetMapping("/mypage/favorites")
  public String selectListFavorite (@RequestParam(value= "cp",required = false, defaultValue ="1") int cp, 
		  Model model ) {
	  
	  System.out.println("qwertyuiop--------------");
	  
	  Map<String,Object> map = null;
	  
	  map = service.selectListFavorite(cp, model);
	  
	  logger.info("이거의값은???????" + map);
	  model.addAttribute("map", map); 
	  
	  
	  return "mypage/favorites"; 
	  
	  
	  
  }
  
  
  
  
  
  
  
  
  }
 