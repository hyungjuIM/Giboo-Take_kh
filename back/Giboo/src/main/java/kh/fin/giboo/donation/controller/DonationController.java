package kh.fin.giboo.donation.controller;

import com.google.gson.JsonObject;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;
import kh.fin.giboo.common.Util;
import kh.fin.giboo.donation.model.service.DonationService;
import kh.fin.giboo.donation.model.vo.DonationDetail;
import kh.fin.giboo.donation.model.vo.DonationStory;
import kh.fin.giboo.member.model.vo.Member;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.StringEscapeUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
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
                       Model model) {
        logger.info("기부페이지 메인");

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
    public String write(String mode, @RequestParam(value = "no", required = false, defaultValue = "0") int no,
                        Model model) {
        logger.info("기부 작성 페이지");

        if (mode.equals("update")) {
            DonationDetail detail = service.getDonationDetail(no);

            detail.setDonationContent(detail.getDonationContent().replaceAll("&quot;", "&#039;"));

            String unescapedContent = StringEscapeUtils.unescapeHtml(detail.getDonationContent());
            detail.setDonationContent(unescapedContent);

            model.addAttribute("detail", detail);
        }

        return "donation/write";
    }

    @PostMapping("/write")
    public String write(DonationDetail detail, @ModelAttribute("loginMember") Member loginMember,
                         RedirectAttributes ra, HttpServletRequest req, String mode,
                         @RequestParam(value = "cp", required = false, defaultValue = "1") int cp) {
        logger.info("기부 등록");

        detail.setMemberNo(loginMember.getMemberNo());

        String path = null;
        String message = null;

        if (mode.equals("insert")) {
            int no = service.insertDonation(detail);
            path = "../donation/detail/" + no;
            logger.info("게시글 등록 성공");
        } else {
            int result = service.updateDonation(detail);
            path = "../donation/detail/" + detail.getDonationNo() + "?cp=" + cp;
            message = "게시글이 수정되었습니다.";
        }

        return "redirect:" + path;
    }

    @PostMapping("/storyWrite")
    public String storyWrite(DonationDetail detail, @ModelAttribute("loginMember") Member loginMember,
                         RedirectAttributes ra, HttpServletRequest req, String mode,
                         @RequestParam(value = "cp", required = false, defaultValue = "1") int cp) {
        logger.info("기부이야기 등록");

        detail.setMemberNo(loginMember.getMemberNo());

        String path = null;
        String message = null;

        if (mode.equals("insert")) {
            int no = service.insertStory(detail);
            path = "../story/" + no;
            logger.info("게시글 등록 성공");
        } else {
            int result = service.updateStory(detail);
            path = "../story/" + detail.getDonationNo() + "?cp=" + cp;
            message = "게시글이 수정되었습니다.";
        }

        return "redirect:" + path;
    }

    @PostMapping("/uploadSNoticeImageFile")
    @ResponseBody
    public String noticeUploadImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request) {
        JsonObject jsonObject = new JsonObject();

        // String fileRoot = "C:\\Users\\cropr\\Desktop\\test"; // 외부경로로 저장을 희망할때.

        // 내부경로로 저장
        String webPath = "/resources/images/fileupload/";

        String fileRoot = request.getServletContext().getRealPath(webPath);

        String originalFileName = multipartFile.getOriginalFilename();
        // String extension =
        // originalFileName.substring(originalFileName.lastIndexOf("."));
        String savedFileName = Util.fileRename(originalFileName);

        File targetFile = new File(fileRoot + savedFileName);
        try {
            InputStream fileStream = multipartFile.getInputStream();
            FileUtils.copyInputStreamToFile(fileStream, targetFile); // 파일 저장
            jsonObject.addProperty("url", request.getContextPath() + webPath + savedFileName); // contextroot +
            // resources + 저장할 내부
            // 폴더명
            jsonObject.addProperty("responseCode", "success");

        } catch (IOException e) {
            FileUtils.deleteQuietly(targetFile); // 저장된 파일 삭제
            jsonObject.addProperty("responseCode", "error");
            e.printStackTrace();
        }
        String result = jsonObject.toString();
        System.out.println("================================================= 이미지 는?? : : " + result);
        return result;

    }
}
