package kh.fin.giboo.map.controller;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;


import kh.fin.giboo.map.model.service.MapService;
import kh.fin.giboo.map.model.vo.MapDetailHome;
import kh.fin.giboo.map.model.vo.MapDetailReviewReply;
import kh.fin.giboo.map.model.vo.MapDetailReviewStory;
import kh.fin.giboo.map.model.vo.MapDetailTop;
import kh.fin.giboo.map.model.vo.Marker;
import kh.fin.giboo.volunteer.model.vo.Volunteer;

@Controller
@RequestMapping("/map")
public class MapController {
   private Logger logger = LoggerFactory.getLogger(MapController.class);
   
   @Autowired
   private MapService service;
   
//   @GetMapping(value="/mapList")
//   public String mapList(Model model) {
// 
//      logger.info("맵");
//      return "map/mapList";
//   }
   
//	@ResponseBody
   // ajax로 하려했는데 잘 모르겠어서 이걸로. 기부 검색 안됨. 기부 검색도 넣을 예정. 
	@GetMapping("/mapList")
	public String selectMapList(
			@RequestParam Map<String, Object> paramMap
			, Model model
			,@RequestParam(value = "cp", required = false, defaultValue = "1" )  int cp   
			) {
		
		Map<String, Object> map = null;
//		 List<Volunteer> markers = service.selectMarkerVolunteer();
//		    model.addAttribute("markers", markers);
		if(paramMap.get("key") == null) { // 검색이 아닌 경우
			
			map = service.selectMapList(cp, model);
			model.addAttribute("map", map);
			
		}else { // 검색인 경우
			
			paramMap.put("cp", cp);
			paramMap.put("model", model);
			
			map = service.searchMapList(paramMap);
			
			model.addAttribute("map",map);
		}
				
		
//		model.addAttribute("map", map);
		
		logger.info("map" +  map);
//		return new Gson().toJson(map);
	      logger.info("맵");
	      return "map/mapList";
	}
	
	
	// 지도 상세(탑, 홈)
	@GetMapping("/mapHome/{volunteerNo}")
	public String MapHome(
			@PathVariable("volunteerNo") int volunteerNo			
			, @RequestParam(value = "cp", required = false, defaultValue = "1") int cp
			, Model model
			) {
		
		MapDetailTop mapDetailTop = service.selectMapDetailTop(volunteerNo);
		
		if(mapDetailTop != null) {
			MapDetailHome mapDetailHome = service.selectMapDetailHome(volunteerNo);
			model.addAttribute("mapDetailHome", mapDetailHome);
			logger.info("mapDetailHome" + mapDetailHome);
		}
		
		model.addAttribute("mapDeta"
				+ "ilTop", mapDetailTop);
		logger.info("mapDetailTop" + mapDetailTop);

		
		return "map/mapHome";	
	}
	
	// ajax로 하고싶은데.............................
	@GetMapping("/mapVoRe/{volunteerNo}")
	public String mapVoRe(
			@PathVariable("volunteerNo") int volunteerNo			
			, @RequestParam(value = "cp", required = false, defaultValue = "1") int cp
			, Model model
			) {
		
		MapDetailTop mapDetailTop = service.selectMapDetailTop(volunteerNo);
		if(mapDetailTop != null) {
			List<MapDetailReviewReply> mapDetailReviewReply = service.selectMapDetailReviewReply(volunteerNo);
			model.addAttribute("mapDetailReviewReply", mapDetailReviewReply);
			logger.info("mapDetailReviewReply" + mapDetailReviewReply);
		}
		model.addAttribute("mapDetailTop", mapDetailTop);
		return "map/mapVoRe";	
	}
	
	@GetMapping("/mapVoSo/{volunteerNo}")
	public String mapVoSo(
			@PathVariable("volunteerNo") int volunteerNo			
			, @RequestParam(value = "cp", required = false, defaultValue = "1") int cp
			, Model model
			) {
		
		MapDetailTop mapDetailTop = service.selectMapDetailTop(volunteerNo);
		if(mapDetailTop != null) {
			List<MapDetailReviewStory> mapDetailReviewStory = service.selectMapDetailReviewStory(volunteerNo);
			model.addAttribute("mapDetailReviewStory", mapDetailReviewStory);
			logger.info("mapDetailReviewStory" + mapDetailReviewStory);
		}
		model.addAttribute("mapDetailTop", mapDetailTop);
		return "map/mapVoSo";	
	}
	
	
	@GetMapping("/map/mapList")
	@ResponseBody
	public String handleMapListRequest(@RequestParam("address") String address) {
		
	    return new Gson().toJson(address); 
	}

	
	// 즐겨찾기
//	@ResponseBody
//	@PostMapping(value = "/insertFav")
//	public int insertFav(@RequestParam("memberNo") int memberNo, @RequestParam("volunteerNo") int volunteerNo) {
//
//		return service.insertFav(memberNo, volunteerNo);
//	}
	
//	@ResponseBody
//	@PostMapping(value = "/insertFav")
//	public int insertFav(
//			@RequestParam("memberNo") int memberNo, 
//			@RequestParam("volunteerNo") int volunteerNo, 
//			HttpServletResponse response,
//			HttpServletRequest req) {
//	    // 쿠키 생성 및 추가
//	    Cookie favoriteCookie = new Cookie("favorite", "true");
//	    favoriteCookie.setMaxAge(365 * 24 * 60 * 60); // 1년 설정 (초 단위)
////	    favoriteCookie.setPath("/map");
//	    favoriteCookie.setPath(req.getContextPath());
//
//	    response.addCookie(favoriteCookie);
//
//	    return service.insertFav(memberNo, volunteerNo);
//	}
	
	@ResponseBody
	@PostMapping(value = "/insertFav")
	public String insertFav(
	        @RequestParam("memberNo") int memberNo,
	        @RequestParam("volunteerNo") int volunteerNo,
	        HttpServletResponse response,
	        HttpServletRequest req) {

	    int result = service.insertFav(memberNo, volunteerNo);

	    if (result > 0) {
	    	
	    	 HttpSession session = req.getSession();
	         session.setAttribute("volunteerNo", volunteerNo);
	        // 쿠키 생성 및 추가
	        Cookie favoriteCookie = new Cookie("favorite", "true");
	        favoriteCookie.setMaxAge(365 * 24 * 60 * 60); // 1년 설정 (초 단위)
	        favoriteCookie.setPath(req.getContextPath() + "/map/mapHome/" + volunteerNo); // 쿠키의 경로 설정
	        response.addCookie(favoriteCookie);
	        return "red";
	    } else {
	        return "failed";
	    }
	}
	
	
	
	@ResponseBody
	@GetMapping(value = "/getFavoriteColor")
	public String getFavoriteColor(
	        @RequestParam("memberNo") int memberNo,
	        @RequestParam("volunteerNo") int volunteerNo,
	        HttpServletRequest request) {
		// 세션에서 volunteerNo 값을 가져옴
		HttpSession session = request.getSession();
		int sessionVolunteerNo = (int) session.getAttribute("volunteerNo");

		// 쿠키를 읽어와 비교
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
		    for (Cookie cookie : cookies) {
		        if (cookie.getName().equals("favorite") && cookie.getValue().equals("true") && cookie.getPath().equals(request.getContextPath() + "/map/mapHome/" + sessionVolunteerNo)) {
		            return "red";
		        }
		    }
		}

		return "none";

	}


	
	
	

}

	
