package kh.fin.giboo.admin.controller;

import kh.fin.giboo.admin.model.service.AdminService;
import kh.fin.giboo.admin.model.vo.Category;
import kh.fin.giboo.admin.model.vo.ParentCategory;
import kh.fin.giboo.common.Util;
import kh.fin.giboo.cs.model.vo.Faq;
import kh.fin.giboo.donation.model.vo.Donation;
import kh.fin.giboo.event.model.vo.Event;
import kh.fin.giboo.event.model.vo.EventDetail;
import kh.fin.giboo.member.model.vo.Manager;
import kh.fin.giboo.member.model.vo.Member;
import kh.fin.giboo.notice.model.vo.NoticeDetail;
import kh.fin.giboo.volunteer.model.vo.Volunteer;
import kh.fin.giboo.volunteer.model.vo.VolunteerDetail;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.StringEscapeUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.JsonObject;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/admin")
public class AdminController {
    private Logger logger = LoggerFactory.getLogger(AdminController.class);

    @Autowired
    private AdminService service;

    @GetMapping("/home")
    public String home() {
        logger.info("관리 페이지");

        return "admin/home";
    }

    @GetMapping("/member")
    public String member(Model model) {
        logger.info("회원관리");

        List<Member> memberList = service.selectMemberList();

        model.addAttribute("memberList", memberList);

        return "admin/member";
    }

    @GetMapping("/manager")
    public String manager(Model model) {
        logger.info("관리자 관리");

        List<Manager> managerList = service.selectManagerList();

        model.addAttribute("managerList", managerList);

        return "admin/manager";
    }

    @GetMapping("/chat")
    public String chat() {
        logger.info("1 대 1 채팅 상담");

        return "admin/chat";
    }

    @GetMapping("/volunteerDonation")
    public String volunteerDonation(Model model) {
        logger.info("기부/봉사 관리");

        List<Volunteer> volunteerList = service.selectVolunteerList();
        List<Donation> donationList = service.selectDonationList();

        model.addAttribute("volunteerList", volunteerList);
        model.addAttribute("donationList", donationList);

        return "admin/volunteerDonation";
    }

    @GetMapping("/event")
    public String event(Model model) {
        logger.info("이벤트 관리");

        List<Event> eventList = service.selectEventList();

        model.addAttribute("eventList", eventList);

        return "admin/event";
    }

    @GetMapping("/category")
    public String category(Model model) {
        logger.info("카테고리 관리");

        List<Category> categoryList = service.selectCategoryList();
        List<ParentCategory> parentCategoryList = service.selectParentCategoryList();

        model.addAttribute("categoryList", categoryList);
        model.addAttribute("parentCategoryList", parentCategoryList);

        return "admin/category";
    }

    @ResponseBody
    @GetMapping("/category/removeCategory")
    public int removeCategory(String type, int id) {
        logger.info("카테고리 삭제");

        int result = 0;

        switch (type) {
            case "parentCategoryRemove":
                result = service.removeParentCategory(id);
                break;
            case "categoryRemove":
                result = service.removeCategory(id);
                break;
        }

        return result;
    }

    @GetMapping("/faq")
    public String faq(Model model) {
        logger.info("자주 찾는 질문 관리");

        List<Faq> faqList = service.selectFaqList();

        model.addAttribute("faqList", faqList);

        return "admin/faq";
    }

    @ResponseBody
    @GetMapping("/faq/removeFaq")
    public int removeFaq(int id) {
        logger.info("자주 찾는 질문 삭제");

        return service.removeFaq(id);
    }
    
    
    
    @GetMapping("/eventWrite")
    public String eventWrite(
    		String mode, @RequestParam(value = "no", required = false, defaultValue = "0") int eventNo,
            Model model
    		) {
        logger.info("이벤트 작성폼");

        if (mode.equals("update")) {
			EventDetail eventDetail = service.selectEventDetail(eventNo);

			eventDetail.setEventContent(eventDetail.getEventContent().replaceAll("&quot;", "&#039;"));

			String unescapedContent = StringEscapeUtils.unescapeHtml(eventDetail.getEventContent());
			eventDetail.setEventContent(unescapedContent);

			model.addAttribute("eventDetail", eventDetail);
		}
        return "admin/eventWrite";
    }
    
    
    @ResponseBody
    @PostMapping("/uploadSNoticeImageFile")
    public String eventUploadImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request) {
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

    
    @PostMapping("/write")
    public String write(EventDetail eventDetail, 			   
    					@ModelAttribute("loginManager") Manager loginManager,
                        RedirectAttributes ra, HttpServletRequest req, String mode
                        ,@RequestParam(value="cp", required=false, defaultValue="1") int cp
                        ) {
        logger.info("이벤트 등록");

        eventDetail.setManagerNo(loginManager.getManagerNo());

        String path = null;
        String message = null;

        if (mode.equals("insert")) {
            int eventNo = service.insertEvent(eventDetail);
            path = "../event/eventDetailMain/" + eventNo;
            logger.info("게시글 등록 성공");
        } else {
            int result = service.updateEvent(eventDetail);
            path = "../event/eventDetailMain/" + eventDetail.getEventNo() + "?cp=" + cp;
            logger.info("게시글 수정 성공");
        }

        return "redirect:" + path;
    }

    
}
