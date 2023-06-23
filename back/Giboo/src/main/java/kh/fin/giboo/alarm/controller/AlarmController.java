package kh.fin.giboo.alarm.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import kh.fin.giboo.alarm.model.service.AlarmService;
import kh.fin.giboo.alarm.model.vo.Alarm;


@Controller
//@SessionAttributes({ "loginMember" })
public class AlarmController {
	private Logger logger = LoggerFactory.getLogger(AlarmController.class);
	
	@Autowired
	private AlarmService service;

	@ResponseBody
	@GetMapping(value = { "/Giboo/notifications", "/notifications", ""  })
	public List<Alarm> selectAll(){
		return service.selectAll();
	}
	
	
	@PostMapping("/Giboo/updateAlarmStatus")
	@ResponseBody
	public ResponseEntity<String> updateAlarmStatus(@RequestParam("alarmNo") int alarmNo) {
	    int affectedRows = service.updateAlarmStatus(alarmNo);

	    if (affectedRows > 0) {
	    	logger.info("affectedRows: " + affectedRows);
	        return ResponseEntity.ok("알림 읽음 상태가 업데이트되었습니다.");
	        
	    } else {
	    	logger.info("업데이트실패");
	    	return ResponseEntity.badRequest().body("알림 읽음 상태 업데이트에 실패했습니다.");
	    }
	    
	}
}
