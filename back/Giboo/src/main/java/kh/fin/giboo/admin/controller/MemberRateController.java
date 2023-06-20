package kh.fin.giboo.admin.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.fin.giboo.admin.model.service.AdminService;
import kh.fin.giboo.member.model.vo.Member;

@Controller
@RequestMapping("/admin")
public class MemberRateController {
	private Logger logger = LoggerFactory.getLogger(AdminController.class);

    @Autowired
    private AdminService service;
    // 등급관리
    @GetMapping("memberRate")
    public String memberRate(Model model) {
        logger.info("회원 등급 관리");

        List<Member> memberRateList = service.selectmemberRateList();

        model.addAttribute("memberRateList", memberRateList);
        System.out.println(memberRateList);
        return "admin/memberRate";
    }
    
//    @GetMapping("/memberRateUpdate")
//    @ResponseBody
//    public int memberRateUpdate(Model model,
//    		@RequestBody List<Member> updateMember) {
//    	int result = service.memberRateUpdate(updateMember);
//    	
//    	
//    	
//    	return result;
//    }
}
