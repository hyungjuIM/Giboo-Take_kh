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
	public String myactive_1(@RequestParam(value = "cp", required = false, defaultValue = "1") int cp, Model model
	// , HttpSession session
	) {
		Map<String, Object> map = null;

		map = service.selectMyactiveDonationList(cp, model);
		model.addAttribute("map", map);

//			List<MyActiveDonationList> myActiveDonationList = service.selectMyactiveDonationList();
//			model.addAttribute("myActiveDonationList",myActiveDonationList);

		logger.info("기부 목록조회(나의활동1)로 이동");
		// Member loginMember = (Member)session.getAttribute("loginMember");
		// System.out.println(loginMember);

		return "mypage/myActiveDonationList";
	}

	// ==========================================

	// 나의 활동2(봉사 목록 조회)
	@GetMapping(value = "/myActiveVolunteerList")
	public String myactive_2(@RequestParam(value = "cp", required = false, defaultValue = "1") int cp, Model model) {

		Map<String, Object> map = null;

		map = service.selectMyActiveVolunteerList(cp, model);
		model.addAttribute("map", map);

		logger.info("봉사 목록조회(나의활동2)로 이동");

		return "mypage/myActiveVolunteerList";
	}

	// ==========================================

	// 나의 활동3(참여한 이벤트 목록 조회)
	@GetMapping(value = "/myActiveEventList")
	public String myactive_3(@RequestParam(value = "cp", required = false, defaultValue = "1") int cp, Model model) {

		Map<String, Object> map = null;

		map = service.selectMyActiveEventList(cp, model);
		model.addAttribute("map", map);

		logger.info("참여한 이벤트 목록 조회(나의활동3)로 이동");

		return "mypage/myActiveEventList";
	}

	// 인증서 출력
	@GetMapping(value = "/reportPrint")
	public String reportPrint() {
		logger.info("인증서 출력");
		return "mypage/reportPrint";
	}

}
