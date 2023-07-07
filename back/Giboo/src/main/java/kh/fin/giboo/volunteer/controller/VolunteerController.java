package kh.fin.giboo.volunteer.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.StringEscapeUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import kh.fin.giboo.admin.model.vo.ParentCategory;
import kh.fin.giboo.common.Util;
import kh.fin.giboo.member.model.vo.Member;
import kh.fin.giboo.mypage.model.vo.Favorite;
import kh.fin.giboo.volunteer.model.service.VolunteerService;
import kh.fin.giboo.volunteer.model.vo.Reply;
import kh.fin.giboo.volunteer.model.vo.VolunteerDetail;
import kh.fin.giboo.volunteer.model.vo.VolunteerStory;

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

        String unescapedContent = StringEscapeUtils.unescapeHtml(story.getVolunteerStoryContent());
        story.setVolunteerStoryContent(unescapedContent);

        model.addAttribute("story", story);
        return "volunteer/story";
    }

    @GetMapping("/storyWrite")
    public String storyWrite(String mode, @RequestParam(value = "no", required = false, defaultValue = "0") int no,
                             Model model) {
        logger.info("봉사이야기 작성 페이지");

        if (mode.equals("update")) {
            VolunteerStory story = service.selectVolunteerStory(no);

            story.setVolunteerStoryContent(story.getVolunteerStoryContent().replaceAll("&quot;", "&#039;"));

            String unescapedContent = StringEscapeUtils.unescapeHtml(story.getVolunteerStoryContent());
            story.setVolunteerStoryContent(unescapedContent);

            model.addAttribute("story", story);
        }

        return "volunteer/storyWrite";
    }

    @PostMapping("/storyWrite")
    public String storyWrite(VolunteerStory story, @ModelAttribute("loginMember") Member loginMember,
                             RedirectAttributes ra, HttpServletRequest req, String mode,
                             @RequestParam(value = "cp", required = false, defaultValue = "1") int cp) {
        logger.info("봉사이야기 등록");

        story.setMemberNo(loginMember.getMemberNo());

        String path = null;
        String message = null;

        if (mode.equals("insert")) {
            int no = service.insertStory(story);
            path = "story/" + no;
            logger.info("게시글 등록 성공");
        } else {
            int result = service.updateStory(story);
            path = "story/" + story.getVolunteerStoryNo() + "?cp=" + cp;
            message = "게시글이 수정되었습니다.";
        }
        return "redirect:" + path;
    }

    @GetMapping("storyDelete/{storyNo}")
    public String storyDelete(@PathVariable("storyNo") int storyNo,
                              @RequestParam(value = "cp", required = false, defaultValue = "1") int cp) {
        service.storyDelete(storyNo);

        return "redirect:../storyList?cp=" + cp;
    }

    @GetMapping("/detail/{volunteerNo}")
    public String detail(@PathVariable("volunteerNo") int volunteerNo,
    					@RequestParam(value= "replyContent", required = false) String replyContent,
                         @RequestParam(value = "cp", required = false, defaultValue = "1") int cp,
                         Model model) {
        logger.info("봉사 상세 페이지");

        VolunteerDetail volunteerDetail = service.getVolunteerDetail(volunteerNo);
        List<Reply> rList = service.selectReplyList(volunteerNo);
        
        LocalDate currentDate = LocalDate.now();
        LocalDate dDay = LocalDate.of(volunteerDetail.getEndRecruitDate().getYear() + 1900, volunteerDetail.getEndRecruitDate().getMonth() + 1, volunteerDetail.getEndRecruitDate().getDate());
        long untilDay = ChronoUnit.DAYS.between(currentDate, dDay);
        volunteerDetail.setDDay(untilDay);

        int percent = (volunteerDetail.getVolunteerCount() * 100) / volunteerDetail.getTargetPeople();
        volunteerDetail.setPercent(percent);

        String unescapedContent = StringEscapeUtils.unescapeHtml(volunteerDetail.getVolunteerContent());
        volunteerDetail.setVolunteerContent(unescapedContent);

        model.addAttribute("volunteerDetail", volunteerDetail);
        model.addAttribute("rList", rList);
        
        return "volunteer/detail";
    }

    @GetMapping("/write")
    public String write(String mode, @RequestParam(value = "no", required = false, defaultValue = "0") int no,
                        Model model) {
        logger.info("봉사 작성페이지");

        List<ParentCategory> parentCategoryList = service.getParentCategoryList();

        if (mode.equals("update")) {
            VolunteerDetail detail = service.getVolunteerDetail(no);

            detail.setVolunteerContent(detail.getVolunteerContent().replaceAll("&quot;", "&#039;"));

            String unescapedContent = StringEscapeUtils.unescapeHtml(detail.getVolunteerContent());
            detail.setVolunteerContent(unescapedContent);

            model.addAttribute("detail", detail);
        }

        model.addAttribute("parentCategoryList", parentCategoryList);

        return "volunteer/write";
    }
  
    @PostMapping("/write")
    public String write(VolunteerDetail detail, @ModelAttribute("loginMember") Member loginMember,
                        RedirectAttributes ra, HttpServletRequest req, String mode,
                        @RequestParam(value = "cp", required = false, defaultValue = "1") int cp) {
        logger.info("봉사 등록");

        detail.setMemberNo(loginMember.getMemberNo());

        String path = null;
        String message = null;

        if (mode.equals("insert")) {
            int no = service.insertVolunteer(detail);
            path = "../volunteer/detail/" + no;
            logger.info("게시글 등록 성공");
        } else {
            int result = service.updateVolunteer(detail);
            path = "../volunteer/detail" + detail.getVolunteerNo() + "?cp=" + cp;
            logger.info("게시글 수정 성공");
        }

        return "redirect:" + path;
    }

    @ResponseBody
    @PostMapping("/uploadSNoticeImageFile")
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
    


    // 댓글 조회
    @GetMapping("/selectReplyList")
    @ResponseBody
    public String selectReplyList(int volunteerNo) {
        List<Reply> replyList = service.selectReplyList(volunteerNo);
        return new Gson().toJson(replyList);
    }

	// 댓글 등록
	@PostMapping("/replyInsert")
    @ResponseBody
	public int insertReply(Reply reply) {
		return service.insertReply(reply);
	}
	
	


}