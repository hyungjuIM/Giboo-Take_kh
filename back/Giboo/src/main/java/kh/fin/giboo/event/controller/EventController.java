package kh.fin.giboo.event.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.fin.giboo.event.model.service.EventService;
import kh.fin.giboo.event.model.vo.EventList;

@Controller
@RequestMapping("/event")
public class EventController {
	private Logger logger = LoggerFactory.getLogger(EventController.class);
	
	@Autowired
	private EventService service;
	
	// 이벤트 목록 조회
	@GetMapping(value="/eventList")
	public String eventList(Model model) {
		
		List<EventList> eventList = service.selectEventList();
		logger.info("이거의값은???????" +eventList);
		model.addAttribute("eventList", eventList);
		logger.info("이벤트 목록");
		
		return "event/eventList";
	}
}
