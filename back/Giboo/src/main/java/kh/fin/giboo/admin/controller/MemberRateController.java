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

        int updatedMemberCount = service.updateMemberRatesByRate();
    	
        redirectAttributes.addFlashAttribute("updatedMemberCount", updatedMemberCount);
        System.out.println(updatedMemberCount);
        

    	  List<Member> updatedMemberList = service.selectmemberRateList();
    	    model.addAttribute("memberRateList", updatedMemberList);
    	System.out.println("업데이트정보 : "+updatedMemberList);
        return "admin/memberRate";
    }
    
}
