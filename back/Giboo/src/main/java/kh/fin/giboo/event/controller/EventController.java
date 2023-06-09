package kh.fin.giboo.event.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/event")
public class EventController {
	private Logger logger = LoggerFactory.getLogger(EventController.class);
	
	@GetMapping(value="/eventList")
	public String eventList() {
		logger.info("이벤트 목록");
		return "event/eventList";
	}
}
