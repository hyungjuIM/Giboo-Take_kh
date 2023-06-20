package kh.fin.giboo.donation.controller;

import kh.fin.giboo.admin.model.vo.ParentCategory;
import kh.fin.giboo.donation.model.service.DonationService;
import kh.fin.giboo.donation.model.vo.Donation;
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
@RequestMapping("/donation")
public class DonationController {

    private Logger logger = LoggerFactory.getLogger(DonationController.class);

    @Autowired
    private DonationService service;

    @GetMapping("/home")
    public String home(@RequestParam(value = "category", required = false, defaultValue = "0") int category, Model model) {
        logger.info("기부페이지 메인");

        List<ParentCategory> parentCategoryList = service.selectParentCategoryList();
        List<Donation> donationList = null;
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
            donationList = service.selectCategoryDonationList(category);
        } else {
            donationList = service.selectDonationList();
        }

        for (Donation d : donationList) {
            LocalDate currentDate = LocalDate.now();
            LocalDate dDay = LocalDate.of(d.getEndRecruitDate().getYear() + 1900, d.getEndRecruitDate().getMonth() + 1, d.getEndRecruitDate().getDate());
            long untilDay = ChronoUnit.DAYS.between(currentDate, dDay);
            d.setDDay(untilDay);

            int percent = (d.getDonationAmount() * 100) / d.getTargetAmount();
            d.setPercent(percent);
        }

        model.addAttribute("parentCategoryList", parentCategoryList);
        model.addAttribute("donationList", donationList);

        return "donation/home";
    }

    @GetMapping("/story")
    public String story() {
        logger.info("기부 이야기");

        return "donation/story";
    }

    @GetMapping("/detail")
    public String detail() {
        logger.info("기부 상세 페이지");

        return "donation/detail";
    }

    @GetMapping("/write")
    public String write() {
        logger.info("기부 작성 페이지");

        return "donation/write";
    }
}
