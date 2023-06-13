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
	
	
//	@GetMapping("/mapList")
//	public String mapList(@RequestParam("mapNo") Optional<Integer> mapNo) {
//	    int mapNoValue = mapNo.orElse(0);
//	    List<Map> mapList = service.mapList(mapNoValue);
//	    logger.info("맵 리스트");
//	    return new Gson().toJson(mapList);
//	}

