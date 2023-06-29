package kh.fin.giboo.donation.controller;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;
import kh.fin.giboo.donation.model.service.DonationService;
import kh.fin.giboo.donation.model.vo.DonationDetail;
import kh.fin.giboo.member.model.vo.Member;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.DecimalFormat;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/donation")
@SessionAttributes({ "loginMember" })
public class DonationController {

    private Logger logger = LoggerFactory.getLogger(DonationController.class);

    @Autowired
    private DonationService service;

    private IamportClient api;

    public DonationController() {
        this.api = new IamportClient("6188008171654432", "kzGY3QwAc5fYBtqiCU4NrpXGfuAAVJFDJnqTDdKyYOR8ddxROogALM7as5f3pIuUpdN6mbwpPxi2VNO6");
    }

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

    @GetMapping("/storyList")
    public String storyList(@RequestParam(value = "cp", required = false, defaultValue = "1")int cp,
                            Model model) {
        logger.info("기부 이야기 목록");

        Map <String, Object> map = null;

        map = service.getStoryList(cp, model);

        model.addAttribute("map", map);

        return "donation/storyList";
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

    @ResponseBody
    @PostMapping("/verify/{imp_uid}")
    public IamportResponse<Payment> verify(Model model, HttpSession session,
                                           @PathVariable("imp_uid") String imp_uid) throws IamportResponseException, IOException {
        logger.info("기부 결제 검증");

        System.out.println(imp_uid);

        return api.paymentByImpUid(imp_uid);
    }

    @ResponseBody
    @PostMapping("/sync")
    public int sync(String impUid, String payMethod, int paidAmount, int donationNo,
                    Model model , HttpSession session, HttpServletRequest req, HttpServletResponse resp) {
        Map<String, Object> map = new HashMap<String, Object>();

        Member loginMember = (Member)session.getAttribute("loginMember");
        int memberNo = loginMember.getMemberNo();

        map.put("impUid", impUid);
        map.put("payMethod", payMethod);
        map.put("paidAmount", paidAmount);
        map.put("donationNo", donationNo);
        map.put("memberNo", memberNo);

        return service.sync(map);
    }

    @GetMapping("/write")
    public String write() {
        logger.info("기부 작성 페이지");

        return "donation/write";
    }
}
