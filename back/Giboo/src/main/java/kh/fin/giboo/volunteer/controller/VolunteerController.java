package kh.fin.giboo.volunteer.controller;

import kh.fin.giboo.volunteer.model.service.VolunteerService;
import kh.fin.giboo.volunteer.model.vo.VolunteerDetail;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
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

    @GetMapping("/storyList")
    public String storyList(@RequestParam(value = "cp", required = false, defaultValue = "1")int cp,
                            Model model) {
        logger.info("봉사 이야기 목록");

        Map<String, Object> map = null;

        map = service.getStoryList(cp, model);

        model.addAttribute("map", map);

        return "volunteer/storyList";
    }

    @GetMapping("/story")
    public String story() {
        logger.info("봉사 이야기");

        return "volunteer/story";
    }

    @GetMapping("/detail/{volunteerNo}")
    public String detail(@PathVariable("volunteerNo") int volunteerNo,
                         @RequestParam(value = "cp", required = false, defaultValue = "1") int cp,
                         Model model) {
        logger.info("봉사 상세 페이지");

        VolunteerDetail volunteerDetail = service.getVolunteerDetail(volunteerNo);

        LocalDate currentDate = LocalDate.now();
        LocalDate dDay = LocalDate.of(volunteerDetail.getEndRecruitDate().getYear() + 1900, volunteerDetail.getEndRecruitDate().getMonth() + 1, volunteerDetail.getEndRecruitDate().getDate());
        long untilDay = ChronoUnit.DAYS.between(currentDate, dDay);
        volunteerDetail.setDDay(untilDay);

        int percent = (volunteerDetail.getVolunteerCount() * 100) / volunteerDetail.getTargetPeople();
        volunteerDetail.setPercent(percent);

        model.addAttribute("volunteerDetail", volunteerDetail);

        return "volunteer/detail";
    }

    @GetMapping("/write")
    public String write() {
        logger.info("봉사 작성페이지");

        return "volunteer/write";
    }
}
