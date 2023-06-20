package kh.fin.giboo.volunteer.controller;

import kh.fin.giboo.admin.model.vo.ParentCategory;
import kh.fin.giboo.volunteer.model.service.VolunteerService;
import kh.fin.giboo.volunteer.model.vo.Volunteer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.List;

@Controller
@RequestMapping("/volunteer")
public class VolunteerController {
    private Logger logger = LoggerFactory.getLogger(VolunteerController.class);

    @Autowired
    private VolunteerService service;

    @GetMapping("/home")
    public String home(@RequestParam(value = "category", required = false, defaultValue = "0") int category, Model model) {
        logger.info("봉사페이지 메인");

        List<ParentCategory> parentCategoryList = service.selectParentCategoryList();
        List<Volunteer> volunteerList = null;
        Boolean categoryValidate = null;

        for (ParentCategory pc : parentCategoryList) {
            if (pc.getParentCategoryNo() == category) {
                categoryValidate = true;
                break;
            } else {
                categoryValidate = false;
            }
        }

        if (categoryValidate) {
            volunteerList = service.selectCategoryVolunteerList(category);
        } else {
            volunteerList = service.selectVolunteerList();
        }

        for(Volunteer v : volunteerList) {
            LocalDate currentDate = LocalDate.now();
            LocalDate dDay = LocalDate.of(v.getEndRecruitDate().getYear() + 1900, v.getEndRecruitDate().getMonth() + 1, v.getEndRecruitDate().getDate());
            long untilDay = ChronoUnit.DAYS.between(currentDate, dDay);
            v.setDDay(untilDay);

            int percent = (v.getVolunteerCount() * 100) / v.getTargetPeople();
            v.setPercent(percent);
        }

        model.addAttribute("parentCategoryList", parentCategoryList);
        model.addAttribute("volunteerList", volunteerList);

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
