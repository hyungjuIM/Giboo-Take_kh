package kh.fin.giboo.mypage.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import kh.fin.giboo.member.model.vo.Member;
import kh.fin.giboo.mypage.model.service.MyActiveService;
import kh.fin.giboo.mypage.model.vo.MyActiveDonationList;
import kh.fin.giboo.mypage.model.vo.MyActiveEventList;
import kh.fin.giboo.mypage.model.vo.MyActiveVolunteerList;

@Controller
@RequestMapping("/mypage")
@SessionAttributes({ "loginMember" })
public class MyActiveController {
	private Logger logger = LoggerFactory.getLogger(MyActiveController.class);

	@Autowired
	private MyActiveService service;

	// 나의 활동1(기부 목록 조회)
	@GetMapping(value = "/myActiveDonationList")
	public String myactive_1(@RequestParam(value = "cp", required = false, defaultValue = "1") int cp
	, Model model
	,HttpSession session,
	MyActiveDonationList myActiveDonationList,
	@ModelAttribute("loginMember") Member loginMember,
	@RequestParam Map<String, Object> paramMap
	) {
		int memberNo = loginMember.getMemberNo();
		 
		Map<String, Object> map = null;
		
		if(paramMap.get("key") == null) { // 검색이 아닌 경우
			map = service.selectMyactiveDonationList(cp, memberNo);
			model.addAttribute("map", map);

		}else { 			
			paramMap.put("cp", cp);  // 검색 있으면 값으로 덮어쓰기, 없으면 추가
			paramMap.put("memberNo", memberNo);
			map = service.searchMyactiveDonationList(paramMap);	
			model.addAttribute("map", map);	
		}
		return "mypage/myActiveDonationList";
	}

	// ==========================================

	// 나의 활동2(봉사 목록 조회)
	@GetMapping(value = "/myActiveVolunteerList")
	public String myactive_2(@RequestParam(value = "cp", required = false, defaultValue = "1") int cp, Model model
			,HttpSession session,
			MyActiveDonationList myActiveVolunteerList,
			@ModelAttribute("loginMember") Member loginMember,
			@RequestParam Map<String, Object> paramMap) {
		
		 int memberNo = loginMember.getMemberNo();
		 
		Map<String, Object> map = null;
		
		if(paramMap.get("key") == null) { // 검색이 아닌 경우
			map = service.selectMyActiveVolunteerList(cp, memberNo);
			model.addAttribute("map", map);
			logger.info("map 봉사 검색아닌경우" + map.toString());
		
			
		}else { 
			
			paramMap.put("cp", cp);  // 있으면 같으면 값으로 덮어쓰기, 없으면 추가
			paramMap.put("memberNo", memberNo);
			System.out.println("paramMAp:::"+paramMap);
			
			
			map = service.searchMyActiveVolunteerList(paramMap);
			
			model.addAttribute("map", map);
			
			logger.info("map 봉사 검색인경우" + map.toString());
			
		}

		logger.info("봉사 목록조회(나의활동2)로 이동");
		logger.info("memberNo" + memberNo);
		logger.info("===========봉사 목록조회 map===========" + map.toString());
		
		System.out.println("map" + map.toString());
		return "mypage/myActiveVolunteerList";
	}

	// ==========================================

	// 나의 활동3(참여한 이벤트 목록 조회)
	@GetMapping(value = "/myActiveEventList")
	public String myactive_3(@RequestParam(value = "cp", required = false, defaultValue = "1") int cp, Model model
			,HttpSession session,
			MyActiveDonationList myActiveEventList,
			@ModelAttribute("loginMember") Member loginMember,
			@RequestParam Map<String, Object> paramMap
			
			) {
		int memberNo = loginMember.getMemberNo();
		 
		Map<String, Object> map = null;
		
		if(paramMap.get("key") == null) { // 검색이 아닌 경우
			map = service.selectMyActiveEventList(cp, memberNo);
			model.addAttribute("map", map);

		}else { 			
			paramMap.put("cp", cp);  // 검색 있으면 값으로 덮어쓰기, 없으면 추가
			paramMap.put("memberNo", memberNo);
			map = service.searchMyActiveEventList(paramMap);	
			model.addAttribute("map", map);	
			
			
			
			logger.info("map 이벤트 검색인경우" + map.toString());
			System.out.println("paramMAp:::"+paramMap);
		}
		return "mypage/myActiveEventList";
	}

	// 인증서 출력
	@GetMapping(value = "/reportPrint")
	public String reportPrint() {
		logger.info("인증서 출력");
		return "mypage/reportPrint";
	}

}
