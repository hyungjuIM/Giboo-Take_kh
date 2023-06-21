package kh.fin.giboo.volunteer.controller;

import kh.fin.giboo.volunteer.model.service.VolunteerService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
@RequestMapping("/volunteer")
public class VolunteerController {
    private Logger logger = LoggerFactory.getLogger(VolunteerController.class);

    @Autowired
    private VolunteerService service;

    @GetMapping("/home")
    public String home(@RequestParam(value = "category", required = false, defaultValue = "0") int category,
                       @RequestParam(value = "cp", required = false, defaultValue = "1") int cp,
                       Model model) {
        logger.info("봉사페이지 메인");

        model.addAttribute("category", category);

        Map<String, Object> map = null;
        map = service.selectVolunteerList(category, cp, model);

        model.addAttribute("map", map);

        return "volunteer/home";
    }

    @GetMapping("/story")
    public String story() {
        logger.info("봉사 이야기");

        return "volunteer/story";
    }

    @GetMapping("/detail")
    public String detail() {
        logger.info("봉사 상세 페이지");

        return "volunteer/detail";
    }

    @GetMapping("/write")
    public String write() {
        logger.info("봉사 작성페이지");

        return "volunteer/write";
    }
}
