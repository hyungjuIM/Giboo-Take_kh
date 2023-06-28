package kh.fin.giboo.stamp.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import kh.fin.giboo.member.model.vo.Member;
import kh.fin.giboo.stamp.model.service.StampService;
import kh.fin.giboo.stamp.model.vo.Stamp;


@Controller
@RequestMapping("/stamp")
@SessionAttributes({ "loginMember" })
public class StampController {
	private Logger logger = LoggerFactory.getLogger(StampController.class);

	@Autowired
	private StampService service;
	
	@GetMapping(value="/stampList")
	public String stampList(
				Model model
				, @ModelAttribute("loginMember") Member loginMember
		) {
		
		int memberNo = loginMember.getMemberNo();

		List<Stamp> stamp = service.selectStampList(memberNo);
		
		model.addAttribute("stamp",stamp );

		logger.info("stamp???" + stamp);
		return "stamp/stampList";
		
	}
}
