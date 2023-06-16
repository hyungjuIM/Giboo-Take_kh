//package kh.fin.giboo.map.controller;
//
//import java.util.Map;
//
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//
//import kh.fin.giboo.map.model.service.MapService;
//
//@Controller
//@RequestMapping("/map")
//public class MapController {
//   private Logger logger = LoggerFactory.getLogger(MapController.class);
//   
//   @Autowired
//   private MapService service;
//   
//   @GetMapping(value="/mapList")
//   public String mapList(@RequestParam(value="cp", required = false, defaultValue = "1") int cp
//		   				,Model model
//		   				, @RequestParam Map<String, Object> paramMap
//		   	) {
//
//	   Map<String, Object> map = null;
//	   
//	   if(paramMap.get("key") == null) { // 검색 아닌 경우
//		   map = service.selectMapList(cp);
//	   }else {
//		   paramMap.put("cp", cp);
//		   
//		   map = service.searchMapList(paramMap);
//	   }
//	   
//	   model.addAttribute("map", map);
//	   
//      logger.info("맵");
//      return "map/mapList";
//   }
//}
	
	


