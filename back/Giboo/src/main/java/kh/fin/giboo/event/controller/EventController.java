package kh.fin.giboo.event.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
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

import kh.fin.giboo.alarm.model.vo.Alarm;
import kh.fin.giboo.event.model.service.EventService;
import kh.fin.giboo.event.model.vo.EventDetailBoardPhoto;
import kh.fin.giboo.event.model.vo.EventDetailLeft;
import kh.fin.giboo.event.model.vo.EventDetailMember;
import kh.fin.giboo.event.model.vo.EventDetailTop;
import kh.fin.giboo.event.model.vo.EventList;
import kh.fin.giboo.event.model.vo.EventPopup;
import kh.fin.giboo.event.model.vo.EventStickerBar;
import kh.fin.giboo.event.Util;
import kh.fin.giboo.member.model.vo.Member;
import kh.fin.giboo.mypage.model.vo.MyActiveEventList;
import kh.fin.giboo.mypage.model.vo.Stamp;

@Controller
@RequestMapping("/event")
@SessionAttributes({ "loginMember" })
public class EventController {
	private Logger logger = LoggerFactory.getLogger(EventController.class);
	
	@Autowired
	private EventService service;

	//	이벤트 목록 조회
	@GetMapping(value="/eventList")
	public String eventList(Model model
				,@RequestParam(value="cp", required = false, defaultValue = "1") int cp 
				,@RequestParam Map<String, Object> paramMap
			) {
		
		Map<String, Object> map = null;
		
		map = service.selectEventList(cp, model);

		logger.info("이거의값은???????" + map);
		model.addAttribute("map", map);
		logger.info("이벤트 목록");
		
		return "event/eventList";
	}
	
	
	// 이벤트 상세조회
	@GetMapping(value="/eventDetailMain/{eventNo}")
	public String eventDetailMain(
				@PathVariable("eventNo") int eventNo
				,@RequestParam(value="cp", required = false, defaultValue = "1") int cp
				,Model model
				, HttpSession session
			) {
		
		EventDetailTop eventDetailTop = service.selectEventDetailTop(eventNo);
	        int percent = (eventDetailTop.getEventPersonCount() * 100) / eventDetailTop.getTargetPeople();
	        eventDetailTop.setPercent(percent);
		
		
		
		
		if(eventDetailTop != null) {
			List<EventDetailMember> eventDetailMember = service.selectEventDetailMember(eventNo);
			model.addAttribute("eventDetailMember",eventDetailMember );
			logger.info("멤버의 값???????" + eventDetailMember );
			
			EventDetailLeft eventDetailLeft = service.selectEventDetailLeft(eventNo);
			model.addAttribute("eventDetailLeft",eventDetailLeft);
			logger.info("이벤트디테일소개???" + eventDetailLeft);
			
			List<EventStickerBar> eventStickerBar = service.selectEventStickerBar(eventNo);
			model.addAttribute("eventStickerBar",eventStickerBar);
			logger.info("이벤트스티커바???" + eventStickerBar);
		}
		
		model.addAttribute("eventDetailTop",eventDetailTop);
		logger.info("이벤트디테일탑???????" + eventDetailTop);
	   
		// 이벤트 번호를 세션에 저장
	    session.setAttribute("eventNo", eventNo);
	    session.setAttribute("cp", cp);

		
//	     eventDetailMain 페이지 로드 후 버튼 클릭 시 eventPopup 페이지로 이동할 URL을 모델에 추가
//	    String eventPopupUrl = "event/eventPopup/" + eventNo + "?cp=" + cp;
//	    model.addAttribute("eventPopupUrl", eventPopupUrl);
		
		return "event/eventDetailMain";	
//		return "redirect:/eventPopup/" + eventNo;
	}
	

	//============================================================		
	
	
	// 이벤트 팝업(이벤트 펄슨, 이벤트 인증, 나의 활동, 스템프, 알림 테이블)
	@PostMapping(value="/eventDetailMain/{eventNo}")
	@Transactional
	public String insertPopup(
		    @PathVariable("eventNo") int eventNo,
		    @RequestParam(value="cp", required = false, defaultValue = "1") int cp,
		    @RequestParam("uploadImage") MultipartFile uploadImage, /* 업로일 파일 */
		    @RequestParam Map<String, Object> map,
			@ModelAttribute("loginMember") Member loginMember
			,@RequestParam("memberNo") int memberNo
			,EventPopup eventPopup
			,Stamp stamp
			,Alarm alarm
			,MyActiveEventList myActiveEventList
			, HttpServletRequest req
			,RedirectAttributes ra
			,Model model
		)throws IOException {
		
		int memberNo1 = loginMember.getMemberNo();
		
		boolean isParticipation = service.eventDupCheck(memberNo1, eventNo);
		String message = null;
		
		
		if(isParticipation) {
			//해당 memberNo1, eventNo 가 이미 이벤트 참여 테이블에 존재0
			return "duplicate";
		}
		//해당 memberNo1, eventNo 가 이미 이벤트 참여 테이블에 존재X
	    eventPopup.setEventNo(eventNo);
		
		eventPopup.setMemberNo(loginMember.getMemberNo());
		
		
		String webPath = "/resources/images/eventPopup/";
		String folderPath = req.getSession().getServletContext().getRealPath(webPath);

		
		map.put("webPath", webPath);
		map.put("folderPath", folderPath);
		map.put("uploadImage", uploadImage);
		map.put("memberNo", loginMember.getMemberNo());
		

		int result = service.insertPopup(map, eventPopup);
		
		String path = null;
    
        logger.info("result: " + result); // 결과값 로그로 출력
        logger.info("map: " + map.toString());
        logger.info("eventPopup: " + eventPopup.toString());
        logger.info("uploadImage: " + uploadImage.toString());
		

		if (result > 0) {

			// myActiveEventList 객체의 MEMBER_NO 설정
			myActiveEventList.setMemberNo(loginMember.getMemberNo());
			
			int result2 = service.insertMyActiveEventList(myActiveEventList);
            logger.info("result2: " + result2); // 결과값 로그로 출력
            logger.info("myActiveEventList: " + myActiveEventList); // 결과값 로그로 출력

			
		    if (result2 > 0 ) {
		    	
	            // Stamp 객체의 MEMBER_NO 설정
	            stamp.setMemberNo(loginMember.getMemberNo());
		    	
		        int result3 = service.insertStamp(stamp);
	            logger.info("result3: " + result3); // 결과값 로그로 출력
	            logger.info("stamp: " + stamp); // 결과값 로그로 출력

		        if (result3 > 0) {
		        	   // Alarm 객체의 memberNo 설정
	                alarm.setMemberNo(loginMember.getMemberNo());
		        	
		            int result4 = service.insertAlarm(alarm);
		            logger.info("result4: " + result4); // 결과값 로그로 출력
		            logger.info("alarm: " + alarm); // 결과값 로그로 출력
		            		            

		        } else {
		            // stamp 삽입 실패 처리
		        }
		        
		        message = "사진 업로드 성공";
		        path = "../eventDetailMain/" + eventNo + "?cp=" + cp;
		    } else {
		        // myActiveEventList 삽입 실패 처리
		    }
		    return "participation";
		} else {
		    message = "실패";
		    
		}


		ra.addFlashAttribute("message",message);
		return "redirect:" + path;

	}
	
	//============================================================
	

	
	
	
	
	// 참여보드 이동
	@GetMapping(value="/eventDetailBoardPhoto/{eventNo}")
	public String eventDetailBoardPhoto(
	    @PathVariable("eventNo") int eventNo,
	    @RequestParam(value="cp", required = false, defaultValue = "1") int cp,
	    Model model
	) {
		
		EventDetailTop eventDetailTop = service.selectEventDetailTop(eventNo);
		
		if(eventDetailTop != null) {
			
			List<EventDetailBoardPhoto> eventDetailBoardPhoto = service.selectEventDetailBoardPhoto(eventNo);
			model.addAttribute("eventDetailBoardPhoto",eventDetailBoardPhoto);
		    logger.info("eventDetailBoardPhoto" + eventDetailBoardPhoto);

			List<EventDetailMember> eventDetailMember = service.selectEventDetailMember(eventNo);
			model.addAttribute("eventDetailMember",eventDetailMember );
			
			List<EventStickerBar> eventStickerBar = service.selectEventStickerBar(eventNo);
			model.addAttribute("eventStickerBar",eventStickerBar);
		}
		
		model.addAttribute("eventDetailTop",eventDetailTop);
	    model.addAttribute("eventNo", eventNo);
	    model.addAttribute("cp", cp);

	    logger.info("참여보드");

	    return "event/eventDetailBoardPhoto";
	}
	

	


	
	
	
	// 즐겨찾기
	@ResponseBody
	@PostMapping(value = "/insertEventFav")
	public String insertEventFav(
	        @RequestParam("memberNo") int memberNo,
	        @RequestParam("eventNo") int eventNo,
	        HttpServletResponse response,
	        HttpServletRequest req
	        ,RedirectAttributes ra
) {

	    boolean isFavorite = service.checkFavorite(memberNo, eventNo);
		String message = null;

	    if (isFavorite) {
	        // 해당 eventNo가 이미 즐겨찾기 테이블에 존재하는 경우
	        return "duplicate";
	        
	    }
		ra.addFlashAttribute("message",message);

	    int result = service.insertFav(memberNo, eventNo);

	    if (result > 0) {
	        HttpSession session = req.getSession();
	        session.setAttribute("eventNo", eventNo);
	        session.setAttribute("memberNo", memberNo);
	        
	        // 쿠키 생성 및 추가
	        Cookie favoriteCookie = new Cookie("favorite", "true");
	        favoriteCookie.setMaxAge(365 * 24 * 60 * 60); // 1 year (in seconds)
	        favoriteCookie.setPath(req.getContextPath() + "/event/eventDetailMain/" + eventNo);
	        response.addCookie(favoriteCookie);
	        
	        return "red";
	    } else {
	        return "failed";
	    }

	}

	

	
}
