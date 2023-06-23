package kh.fin.giboo.map.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kh.fin.giboo.map.model.service.MapService;
import kh.fin.giboo.map.model.vo.MapList;

@Controller
@RequestMapping("/map")
public class MapController {
   private Logger logger = LoggerFactory.getLogger(MapController.class);
   
   @Autowired
   private MapService service;
   
   @GetMapping(value="/mapList")
   public String mapList(Model model) {
 
      logger.info("맵");
      return "map/mapList";
   }
   
	@ResponseBody
	@PostMapping("/mapList")
	public String selectMapList(
			@RequestParam Map<String, Object> paramMap
			, MapList mapList
			,@RequestParam(value = "cp", required = false, defaultValue = "1" )  int cp   
			) {
		
		Map<String, Object> map = null;
		
		if(paramMap.get("key") == null) { // 검색이 아닌 경우
			
			map = service.selectMapList(cp);
			
		}else { // 검색인 경우
			
			paramMap.put("cp", cp);
			paramMap.put("mapList", mapList);
			
			map = service.searchBoardList(paramMap);
			
		}
				
		return new Gson().toJson(map);
	}
	// @RequestParam("name속성값") 자료형 변수명
	// - 클라이언트 요청 시 같이 전달된 파라미터를 변수에 저장
	//  --> 어떤 파라미터를 변수에 저장할지는 "name속성값"을 이용해 지정
}

