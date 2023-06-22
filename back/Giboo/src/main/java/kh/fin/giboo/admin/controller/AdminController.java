package kh.fin.giboo.admin.controller;

import kh.fin.giboo.admin.model.service.AdminService;
import kh.fin.giboo.admin.model.vo.Category;
import kh.fin.giboo.admin.model.vo.ParentCategory;
import kh.fin.giboo.cs.model.vo.Faq;
import kh.fin.giboo.donation.model.vo.Donation;
import kh.fin.giboo.event.model.vo.Event;
import kh.fin.giboo.member.model.vo.Manager;
import kh.fin.giboo.member.model.vo.Member;
import kh.fin.giboo.mypage.model.vo.Rate;
import kh.fin.giboo.volunteer.model.vo.Volunteer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class AdminController {
    private Logger logger = LoggerFactory.getLogger(AdminController.class);

    @Autowired
    private AdminService service;

    @GetMapping("/home")
    public String home() {
        logger.info("관리 페이지");

        return "admin/home";
    }

    @GetMapping("/member")
    public String member(Model model) {
        logger.info("회원관리");

        List<Member> memberList = service.selectMemberList();

        model.addAttribute("memberList", memberList);

        return "admin/member";
    }

    @GetMapping("/manager")
    public String manager(Model model) {
        logger.info("관리자 관리");

        List<Manager> managerList = service.selectManagerList();

        model.addAttribute("managerList", managerList);

        return "admin/manager";
    }

    @GetMapping("/chat")
    public String chat() {
        logger.info("1 대 1 채팅 상담");

        return "admin/chat";
    }

    @GetMapping("/volunteerDonation")
    public String volunteerDonation(Model model) {
        logger.info("기부/봉사 관리");

        List<Volunteer> volunteerList = service.selectVolunteerList();
        List<Donation> donationList = service.selectDonationList();

        model.addAttribute("volunteerList", volunteerList);
        model.addAttribute("donationList", donationList);

        return "admin/volunteerDonation";
    }

    @GetMapping("/event")
    public String event(Model model) {
        logger.info("이벤트 관리");

        List<Event> eventList = service.selectEventList();

        model.addAttribute("eventList", eventList);

        return "admin/event";
    }

    @GetMapping("/category")
    public String category(Model model) {
        logger.info("카테고리 관리");

        List<Category> categoryList = service.selectCategoryList();
        List<ParentCategory> parentCategoryList = service.selectParentCategoryList();

        model.addAttribute("categoryList", categoryList);
        model.addAttribute("parentCategoryList", parentCategoryList);

        return "admin/category";
    }

    @GetMapping("/category/removeCategory")
    public String removeCategory(String type, String id) {
        logger.info("카테고리 삭제");

        Map<String, String> map = new HashMap<String, String>();

        map.put("type", type);
        map.put("id", id);

        int result = service.removeCategory(map);

        return null;
    }

    @GetMapping("faq")
    public String faq(Model model) {
        logger.info("자주 찾는 질문 관리");

        List<Faq> faqList = service.selectFaqList();

        model.addAttribute("faqList", faqList);

        return "admin/faq";
    }
    

}
