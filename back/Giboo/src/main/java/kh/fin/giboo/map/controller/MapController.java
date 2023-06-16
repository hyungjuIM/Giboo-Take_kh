package kh.fin.giboo.map.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kh.fin.giboo.map.model.service.MapService;
import kh.fin.giboo.map.model.vo.MapList;

@Controller
@RequestMapping("/map")
public class MapController {
   private Logger logger = LoggerFactory.getLogger(MapController.class);
   
   @Autowired
   private MapService service;
   
   @GetMapping(value="/mapList")
   public String mapList() {

//	  List<MapList> mapList = service.selectMapList();
//	  logger.info("맵 리스트??" + mapList);
//	  model.addAttribute("mapList",mapList);
      logger.info("맵");
      return "map/mapList";
   }
}
	
	


