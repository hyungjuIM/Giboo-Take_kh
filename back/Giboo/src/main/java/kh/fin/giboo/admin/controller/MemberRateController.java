package kh.fin.giboo.admin.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.fin.giboo.admin.model.service.AdminService;
import kh.fin.giboo.admin.model.vo.Rate;
import kh.fin.giboo.member.model.vo.Member;

@Controller
@RequestMapping("/admin")
public class MemberRateController {
	private Logger logger = LoggerFactory.getLogger(AdminController.class);

    @Autowired
    private AdminService service;
    // 등급관리
    @GetMapping("/memberRate")
     public String updateMemberRates(
                                    Model model,
                                    RedirectAttributes redirectAttributes) {
    	logger.info("등급관리");
    	List<Member> memberList = service.selectmemberRateList();
    	model.addAttribute("memberRateList", memberList);
    	System.out.println(memberList);
    	
    	for (Member member : memberList) {
    	    // 각 회원 객체에 대한 작업 수행
    	    String rateName = member.getRateName();  // 회원의 rateName 값 가져오기
    	    int pointPrice = member.getPointPrice();  // 회원의 pointPrice 값 가져오기
    	    
    	    System.out.println("회원의 rateName: " + rateName);
    	    System.out.println("회원의 pointPrice: " + pointPrice);


    	model.addAttribute("rateName", rateName);
        model.addAttribute("pointPrice", pointPrice);
        int updatedMemberCount = service.updateMemberRatesByRate(rateName, pointPrice);
    	
        redirectAttributes.addFlashAttribute("updatedMemberCount", updatedMemberCount);
        System.out.println(updatedMemberCount);
    	}
        return "admin/memberRate";
    }
    
//    @ResponseBody
//    @GetMapping("/memberRateUpdate")
//    public int updateMemberRates( @RequestParam List<String> rateName,
//            @RequestParam List<String> pointPrice) {
//    	System.out.println(rateName);
//    	System.out.println(pointPrice);
//        int result = service.updateMemberRates(rateName,pointPrice);
//        return result; //
//    }
}
