package kh.fin.giboo.event.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kh.fin.giboo.event.model.service.EventService;
import kh.fin.giboo.event.model.vo.EventDetailBoardPhoto;
import kh.fin.giboo.event.model.vo.EventDetailLeft;
import kh.fin.giboo.event.model.vo.EventDetailMember;
import kh.fin.giboo.event.model.vo.EventDetailTop;
import kh.fin.giboo.event.model.vo.EventList;
import kh.fin.giboo.event.model.vo.EventStickerBar;

@Controller
@RequestMapping("/event")
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
		
		
		return "event/eventDetailMain";	
	}
	
	@GetMapping(value="/eventDetailBoardPhoto/{eventNo}")
	public String eventDetailBoardPhoto(
			@PathVariable("eventNo") int eventNo
			,@RequestParam(value="cp", required = false, defaultValue = "1") int cp
			,Model model
			) {
		
		EventDetailBoardPhoto eventDetailBoardPhoto = service.selectEventDetailBoardPhoto(eventNo);
		
		model.addAttribute("eventDetailBoardPhoto",eventDetailBoardPhoto);
		logger.info("이벤트 참여보드" + eventDetailBoardPhoto);
		return "event/eventDetailBoardPhoto";	
	}
}
