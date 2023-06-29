package kh.fin.giboo.notice.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import kh.fin.giboo.common.Util;
import kh.fin.giboo.member.model.vo.Member;
import kh.fin.giboo.notice.model.service.NoticeService;
import kh.fin.giboo.notice.model.vo.NoticeDetail;

@Controller
@SessionAttributes({"loginManager"})
@RequestMapping("/notice")
public class NoticeController {
	private Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@Autowired
	private NoticeService service;
	
	// 공지사항 리스트
	@GetMapping(value="/noticeList")
		public String noticeList(
				@RequestParam(value = "cp", required = false, defaultValue = "1") int cp,
			Model model
			) {
		
		Map<String, Object> map = null;

		map = service.selectNoticeList(cp, model);

		model.addAttribute("map",map);
		logger.info("공지사항");

		return "notice/noticeList";
	}
	
	
	// 게시글 상세 조회
	@GetMapping(value="/noticeDetail/{noticeNo}")
	public String noticeDetail(
			@PathVariable("noticeNo") int noticeNo,
			@RequestParam(value = "cp", required = false, defaultValue = "1") int cp,
			Model model,
			HttpSession session,
			HttpServletRequest req,HttpServletResponse resp ) {

		logger.info("공지사항 상세조회");
		// 게시글 상세 조회 서비스 호출
		NoticeDetail noticeDetail = service.selectNoticeDetail(noticeNo);



		if( noticeDetail != null ) { // 상세 조회 성공 시
			
		
			

			Member loginMember = (Member)session.getAttribute("loginMember");

			int memberNo = 0;

			if(loginMember != null) {
				memberNo = loginMember.getMemberNo();
			}

			// 글쓴이와 현재 클라이언트(로그인 한 사람)가 같지 않은 경우 -> 조회 수 증가
			if( noticeDetail.getMemberNo() != memberNo ) {

				Cookie cookie = null; // 기존에 존재하던 쿠키를 저장하는 변수

				Cookie[] cArr = req.getCookies(); // 쿠키 얻어오기 

				if(cArr != null && cArr.length > 0) { // 얻어온 쿠키가 있을 경우

					for(Cookie c : cArr) {

						if(c.getName().equals("readNoticeNo")) {
							cookie = c;
						}

					}
				}



				int result = 0;



				if ( cookie == null ) { // 기존에 "readnoticeNo" 이름의 쿠키가 없던 경우
					cookie = new Cookie("readNoticeNo", noticeNo+"");
					result = service.updateViewCount(noticeNo);

				} else {
					String[] temp = cookie.getValue().split("/");


					List<String> list = Arrays.asList(temp); // 배열 -> List 변환


					if( list.indexOf(noticeNo+"") == -1 ) { // 기존 값에 같은 글번호가 없다면 추가

						cookie.setValue( cookie.getValue() + "/" + noticeNo );
						result = service.updateViewCount(noticeNo); // 조회수 증가 서비스 호출

					}
				}


				// 결과값 이용한 DB 동기화
				if (result > 0) {
					noticeDetail.setViewCount(noticeDetail.getViewCount() + 1); // 이미 조회된 데이터 DB 동기화

					cookie.setPath(req.getContextPath());
					cookie.setMaxAge(60 * 60 * 1);
					resp.addCookie(cookie);

				}
			}
		}

		model.addAttribute("noticeDetail", noticeDetail);
		return "notice/noticeDetail";

	}
	
	
	
	// 공지사항 작성화면 전환
	@GetMapping("/noticeWrite")
	public String noticeWrite(String mode,
			@RequestParam(value="no",required = false, defaultValue = "0")int boardNo,
			Model model) {
		logger.info("공지사항 작성");
		return "notice/noticeWrite";
	}
	
	// 썸머노트 이미지 저장
	@PostMapping("/uploadSNoticeImageFile")
	@ResponseBody
	public String uploadSNoticeImageFile(@RequestParam("file") MultipartFile[] multipartFiles, HttpServletRequest request) {
        JsonArray jsonArray = new JsonArray(); 

        String webPath = "/resources/images/notice/";
        String fileRoot = request.getServletContext().getRealPath(webPath);

        for (MultipartFile multipartFile : multipartFiles) {
            JsonObject jsonObject = new JsonObject();

            String originalFileName = multipartFile.getOriginalFilename();
            String savedFileName = Util.fileRename(originalFileName);

            File targetFile = new File(fileRoot + savedFileName);
            try {
                InputStream fileStream = multipartFile.getInputStream();
                FileUtils.copyInputStreamToFile(fileStream, targetFile);
                jsonObject.addProperty("", request.getContextPath() + webPath + savedFileName);

            } catch (IOException e) {
                FileUtils.deleteQuietly(targetFile);
                jsonObject.addProperty("responseCode", "error");
                e.printStackTrace();
            }

            jsonArray.add(jsonObject);
        }

        String jsonResult = jsonArray.toString();
        System.out.println("이미지: " + jsonResult);
        return jsonResult;
    }

	
}
