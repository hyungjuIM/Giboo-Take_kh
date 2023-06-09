package kh.fin.giboo.map.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/map")
public class MapController {
	private Logger logger = LoggerFactory.getLogger(MapController.class);
	
	@GetMapping(value="/mapList")
	public String mapList() {
		logger.info("맵");
		return "map/mapList";
	}
}
