package kh.fin.giboo.admin.controller;

import kh.fin.giboo.admin.model.service.AdminService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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

        Map<String, Object> map = null;

        map = service.selectAllMemberList();

        return "admin/member";
    }

    @GetMapping("/manager")
    public String manager() {
        logger.info("관리자 관리");

        return "admin/manager";
    }

    @GetMapping("/chat")
    public String chat() {
        logger.info("1 대 1 채팅 상담");

        return "admin/chat";
    }

    @GetMapping("/volunteerDonation")
    public String volunteerDonation() {
        logger.info("기부/봉사 관리");

        return "admin/volunteerDonation";
    }

    @GetMapping("/event")
    public String event() {
        logger.info("이벤트 관리");

        return "admin/event";
    }

    @GetMapping("/category")
    public String category() {
        logger.info("카테고리 관리");

        return "admin/category";
    }

    @GetMapping("faq")
    public String faq() {
        logger.info("자주 찾는 질문 관리");

        return "admin/faq";
    }
}
