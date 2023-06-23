package kh.fin.giboo.donation.controller;

import kh.fin.giboo.donation.model.service.DonationService;
import kh.fin.giboo.donation.model.vo.DonationDetail;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.text.DecimalFormat;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.Map;

@Controller
@RequestMapping("/donation")
public class DonationController {

    private Logger logger = LoggerFactory.getLogger(DonationController.class);

    @Autowired
    private DonationService service;

    @GetMapping("/home")
    public String home(@RequestParam(value = "category", required = false, defaultValue = "0") int category,
                       @RequestParam(value = "cp", required = false, defaultValue = "1") int cp,
                       Model model) {
        logger.info("기부페이지 메인");

        model.addAttribute("category", category);

        Map<String, Object> map = null;
        map = service.selectDonationList(category, cp, model);

        model.addAttribute("map", map);

        return "donation/home";
    }

    @GetMapping("/story")
    public String story() {
        logger.info("기부 이야기");

        return "donation/story";
    }

    @GetMapping("/detail/{donationNo}")
    public String detail(@PathVariable("donationNo") int donationNo,
                         @RequestParam(value = "cp", required = false, defaultValue = "1") int cp,
                         Model model
                         ) {
        logger.info("기부 상세 페이지");

        DonationDetail donationDetail = service.getDonationDetail(donationNo);

        LocalDate currentDate = LocalDate.now();
        LocalDate dDay = LocalDate.of(donationDetail.getEndRecruitDate().getYear() + 1900, donationDetail.getEndRecruitDate().getMonth() + 1, donationDetail.getEndRecruitDate().getDate());
        long untilDay = ChronoUnit.DAYS.between(currentDate, dDay);
        donationDetail.setDDay(untilDay);

        int percent = (Integer.parseInt(donationDetail.getDonationAmount()) * 100) / Integer.parseInt(donationDetail.getTargetAmount());
        donationDetail.setPercent(percent);

        DecimalFormat df = new DecimalFormat("###,###");
        donationDetail.setDonationAmount(df.format(Integer.parseInt(donationDetail.getDonationAmount())));
        donationDetail.setTargetAmount(df.format(Integer.parseInt(donationDetail.getTargetAmount())));

        model.addAttribute("donationDetail", donationDetail);

        return "donation/detail";
    }

    @GetMapping("/write")
    public String write() {
        logger.info("기부 작성 페이지");

        return "donation/write";
    }
}
