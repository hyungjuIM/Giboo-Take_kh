package kh.fin.giboo.event.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
			) {
		
		EventDetailTop eventDetailTop = service.selectEventDetailTop(eventNo);
		
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
		
//	     eventDetailMain 페이지 로드 후 버튼 클릭 시 eventPopup 페이지로 이동할 URL을 모델에 추가
	    String eventPopupUrl = "event/eventPopup/" + eventNo + "?cp=" + cp;
	    model.addAttribute("eventPopupUrl", eventPopupUrl);
		
		return "event/eventDetailMain";	
//		return "redirect:/eventPopup/" + eventNo;
	}
	

	
	// 팝업 새창 이동 ㅠㅠ모달로 띄워야 하는데ㅠㅠ
	@GetMapping(value="/eventPopup/{eventNo}")
	public String eventPopup(
	    @PathVariable("eventNo") int eventNo,
	    @RequestParam(value="cp", required = false, defaultValue = "1") int cp,
	    Model model
	) {

	    model.addAttribute("eventNo", eventNo);
	    model.addAttribute("cp", cp);
	    return "event/eventPopup";
	}
	
	
	@PostMapping(value="/eventPopup/{eventNo}")
	@Transactional
	public String insertPopup(
		    @PathVariable("eventNo") int eventNo,
		    @RequestParam(value="cp", required = false, defaultValue = "1") int cp,
		    @RequestParam("uploadImage") MultipartFile uploadImage, /* 업로일 파일 */
		    @RequestParam Map<String, Object> map,
			@ModelAttribute("loginMember") Member loginMember,
			EventPopup eventPopup
			, HttpServletRequest req
			,RedirectAttributes ra
		)throws IOException {
		
		eventPopup.setMemberNo(loginMember.getMemberNo());
		
		String webPath = "/resources/images/board/";
		String folderPath = req.getSession().getServletContext().getRealPath(webPath);
		
		map.put("webPath", webPath);
		map.put("folderPath", folderPath);
		map.put("uploadImage", uploadImage);
		map.put("memberNo", loginMember.getMemberNo());
		
		int result = service.insertPopup(map, eventPopup);
		
		String message = null;
		
//		if(result > 0) {
//			MyActiveEventList myActiveEventList = service.insertMyActiveEventList(eventNo);
//			int stamp = service.insertStamp(stamp);
//			Alarm alarm = service.insertAlarm(eventNo);
//		}else {
//			message = "실패";
//		}
//		
		ra.addFlashAttribute("message",message);
		
		
		
		return "redirect:event/eventPopup";
	}

	
}
