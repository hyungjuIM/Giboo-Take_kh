package kh.fin.giboo.mypage.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import kh.fin.giboo.member.model.vo.Member;
import kh.fin.giboo.mypage.model.service.MyActiveService;
import kh.fin.giboo.mypage.model.service.MyReviewService;
import kh.fin.giboo.mypage.model.vo.MyActiveDonationList;
import kh.fin.giboo.volunteer.model.vo.Reply;

@Controller
@RequestMapping("/mypage")
@SessionAttributes({ "loginMember" })
public class MyReviewController {
	private Logger logger = LoggerFactory.getLogger(MyReviewController.class);
	

	@Autowired
	private MyReviewService service;
	
	// 나의 리뷰
		@GetMapping(value = "/myReview")
		public String myreview(@RequestParam(value = "cp", required = false, defaultValue = "1") int cp, Model model
				,HttpSession session,
				MyActiveDonationList myActiveEventList,
				@ModelAttribute("loginMember") Member loginMember
				, Reply reply
				) {

			int memberNo = loginMember.getMemberNo();

			Map<String, Object> map = null;
			
			map = service.selectMyreview(cp, memberNo);
			model.addAttribute("map", map);
			return "mypage/myReview";
		}
}
