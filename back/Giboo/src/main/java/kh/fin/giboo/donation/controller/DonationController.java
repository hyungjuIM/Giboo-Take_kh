package kh.fin.giboo.donation.controller;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;
import kh.fin.giboo.donation.model.service.DonationService;
import kh.fin.giboo.donation.model.vo.DonationDetail;
import kh.fin.giboo.donation.model.vo.DonationStory;
import kh.fin.giboo.member.model.vo.Member;
import kh.fin.giboo.mypage.model.vo.Favorite;

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
import java.io.IOException;
import java.text.DecimalFormat;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
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
                       Model model, HttpSession session) {
        logger.info("기부페이지 메인");

        Member loginMember = (Member)session.getAttribute("loginMember");
        if (loginMember != null) {
            int memberNo = loginMember.getMemberNo();
            List<Favorite> favoriteList = service.getFavoriteList(memberNo);
            System.out.println("asdfg" + favoriteList);
            model.addAttribute("memberNo", memberNo);
            model.addAttribute("favoriteList", favoriteList);
        }
        
        
        
        
        model.addAttribute("category", category);

        Map<String, Object> map = null;
        map = service.selectDonationList(category, cp, model);

        model.addAttribute("map", map);

        return "donation/home";
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

    @GetMapping("/storyList")
    public String storyList(@RequestParam(value = "cp", required = false, defaultValue = "1")int cp,
                            Model model, HttpSession session, HttpServletRequest req, HttpServletResponse resp) {
        logger.info("기부 이야기 목록");

        Map <String, Object> map = null;

        Member loginMember = (Member)session.getAttribute("loginMember");

        map = service.getStoryList(cp, model);

        model.addAttribute("map", map);
        model.addAttribute("loginMember", loginMember);

        return "donation/storyList";
    }

    @GetMapping("/story/{donationStoryNo}")
    public String story(@PathVariable("donationStoryNo") int donationStoryNo,
    @RequestParam(value = "cp", required = false, defaultValue = "1") int cp,
                        Model model,
                        HttpSession session,
                        HttpServletRequest req, HttpServletResponse resp) {
        logger.info("기부 이야기");

        DonationStory story = service.selectDonationStory(donationStoryNo);

        if (story != null) {
            Member loginMember = (Member) session.getAttribute("loginMember");

            int memberNo = 0;

            if (loginMember != null) {
                memberNo = loginMember.getMemberNo();
            }

            if (story.getMemberNo() != memberNo) {
                Cookie cookie = null;

                Cookie[] cArr = req.getCookies();

                if(cArr != null && cArr.length > 0) {
                    for(Cookie c : cArr) {
                        if(c.getName().equals("readDonationStoryNo")) {
                            cookie = c;
                        }
                    }
                }

                int result = 0;

                if (cookie == null) {
                    cookie = new Cookie("readDonationStoryNo", donationStoryNo + "");
                    result = service.updateViewCount(donationStoryNo);
                } else {
                    String[] temp = cookie.getValue().split("/");

                    List<String> list = Arrays.asList(temp);

                    if (list.indexOf(donationStoryNo+"") == -1) {
                        cookie.setValue(cookie.getValue() + "/" + donationStoryNo);
                        result = service.updateViewCount(donationStoryNo);
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
        return "donation/story";
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

        int result = service.updateAmount(map);

        return service.sync(map);
    }

    @GetMapping("/write")
    public String write() {
        logger.info("기부 작성 페이지");

        return "donation/write";
    }

//    @PostMapping("/write")
//    public String insert(DonationDetail detail, @ModelAttribute("loginMember") Member loginMember,
//                         RedirectAttributes ra, HttpServletRequest req
//                         ) {
//        logger.info("기부 등록");
//
//        detail.setMemberNo(loginMember.getMemberNo());
//
//        int donationNo = service.insertDonation(detail);
//
//        return "redirect:../donation/home";
//    }
}
