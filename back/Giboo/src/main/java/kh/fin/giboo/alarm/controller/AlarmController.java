//package kh.fin.giboo.alarm.controller;
//
//import java.util.List;
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
//import org.springframework.web.bind.annotation.ResponseBody;
//import org.springframework.web.bind.annotation.SessionAttributes;
//
//import kh.fin.giboo.alarm.model.service.AlarmService;
//import kh.fin.giboo.alarm.model.vo.Alarm;
//
//
//
//@Controller
//@RequestMapping("/alarm")
//@SessionAttributes({ "loginMember" })
//public class AlarmController {
//	private Logger logger = LoggerFactory.getLogger(AlarmController.class);
//	
//	@Autowired
//	private AlarmService service;
//	
//	//알림 목록조회
////	@ResponseBody
////	@GetMapping("/selectAll")
////	public List<Alarm> selectAll(){
////		
////		return service.selectAll();
////	}
////	
//
//}
