package kh.fin.giboo.volunteer.controller;

import kh.fin.giboo.member.model.vo.Member;
import kh.fin.giboo.mypage.model.vo.Favorite;
import kh.fin.giboo.volunteer.model.service.VolunteerService;
import kh.fin.giboo.volunteer.model.vo.VolunteerDetail;
import kh.fin.giboo.volunteer.model.vo.VolunteerStory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/volunteer")
@SessionAttributes({ "loginMember" })
public class VolunteerController {
    private Logger logger = LoggerFactory.getLogger(VolunteerController.class);

    @Autowired
    private VolunteerService service;

    @GetMapping("/home")
    public String home(@RequestParam(value = "category", required = false, defaultValue = "0") int category,
                       @RequestParam(value = "cp", required = false, defaultValue = "1") int cp,
                       Model model, HttpSession session) {
        logger.info("봉사페이지 메인");

        Member loginMember = (Member)session.getAttribute("loginMember");
        if (loginMember != null) {
            int memberNo = loginMember.getMemberNo();
            List<Favorite> favoriteList = service.getFavoriteList(memberNo);
            model.addAttribute("memberNo", memberNo);
            model.addAttribute("favoriteList", favoriteList);
        }

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

    @GetMapping("/story/{volunteerStoryNo}")
    public String story(@PathVariable("volunteerStoryNo") int volunteerStoryNo,
                        @RequestParam(value = "cp", required = false, defaultValue = "1") int cp,
                        Model model,
                        HttpSession session,
                        HttpServletRequest req, HttpServletResponse resp) {
        logger.info("봉사 이야기");

        VolunteerStory story = service.selectVolunteerStory(volunteerStoryNo);

        if (story != null) {
            Member loginMember = (Member) session.getAttribute("loginMember");

            int memberNo = 0;

            if (loginMember != null) {
                memberNo = loginMember.getMemberNo();
            }

            if (story.getMemberNo() != memberNo) {
                Cookie cookie = null;

                Cookie[] cArr = req.getCookies();

                if (cArr != null && cArr.length > 0) {
                    for (Cookie c : cArr) {
                        if (c.getName().equals("readVolunteerStoryNo")) {
                            cookie = c;
                        }
                    }
                }

                int result = 0;

                if (cookie == null) {
                    cookie = new Cookie("readVolunteerStoryNo", volunteerStoryNo + "");
                    result = service.updateViewCount(volunteerStoryNo);
                } else {
                    String[] temp = cookie.getValue().split("/");

                    List<String> list = Arrays.asList(temp);

                    if (list.indexOf(volunteerStoryNo+"") == -1) {
                        cookie.setValue(cookie.getValue() + "/" + volunteerStoryNo);
                        result = service.updateViewCount(volunteerStoryNo);
                    }
                }

                if (result > 0) {
                    story.setViewCount(story.getViewCount() + 1);
                    cookie.setPath(req.getContextPath());
                    cookie.setMaxAge(60 * 60 * 1);
                    resp.addCookie(cookie);
                }
            }
        }
        model.addAttribute("story", story);
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
    
    // 봉사 참여
    @ResponseBody
    @PostMapping("/doVolunteer")
    public Map<String, Object> doVolunteer(@RequestParam("volunteerNo") int volunteerNo,
                                          HttpSession session) {
      Map<String, Object> response = new HashMap<>();

      Member loginMember = (Member) session.getAttribute("loginMember");
      int memberNo = loginMember.getMemberNo();
      
      int result = service.selectVolunteer(volunteerNo, memberNo);
      if (result == 0) {
        service.insertVolunteer(volunteerNo, memberNo);
        response.put("message", "봉사 참여가 완료되었습니다.");
      } else if (result == 1) {
        response.put("message", "이미 참여한 봉사입니다.");
      }
      
      return response;
    }

}
