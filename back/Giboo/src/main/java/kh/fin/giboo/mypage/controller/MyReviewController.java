package kh.fin.giboo.mypage.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;


import kh.fin.giboo.mypage.model.service.MyActiveService;
import kh.fin.giboo.mypage.model.service.MyReviewService;

@Controller
@RequestMapping("/mypage")
@SessionAttributes({ "loginMember" })
public class MyReviewController {
	private Logger logger = LoggerFactory.getLogger(MyReviewController.class);
	

	@Autowired
	private MyReviewService service;
	
	// 나의 리뷰
		@GetMapping(value = "/myReview")
		public String myreview(@RequestParam(value = "cp", required = false, defaultValue = "1") int cp, Model model) {

			Map<String, Object> map = null;

			map = service.selectMyReview(cp, model);
			model.addAttribute("map", map);

			logger.info("리뷰 목록조회로 이동");

			return "mypage/myReview";
		}
}
