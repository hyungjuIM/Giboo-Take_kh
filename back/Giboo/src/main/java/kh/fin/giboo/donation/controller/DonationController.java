package kh.fin.giboo.donation.controller;

import kh.fin.giboo.donation.model.service.DonationService;
import kh.fin.giboo.donation.model.vo.Donation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.time.LocalDate;
import java.util.List;

@Controller
@RequestMapping("/donation")
public class DonationController {

    private Logger logger = LoggerFactory.getLogger(DonationController.class);

    @Autowired
    private DonationService service;

    @GetMapping("/home")
    public String home(Model model) {
        logger.info("기부페이지 메인");

        List<Donation> donationList = service.selectDonationList();

        for (Donation d : donationList) {
//            System.out.println(d.getEndRecruitDate().getYear() + 1900);
//            System.out.println(d.getEndRecruitDate().getHours());
            LocalDate fromDate = LocalDate.now();
//            LocalDate toDate = LocalDate.of(d.getEndRecruitDate().getYear());
        }

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
