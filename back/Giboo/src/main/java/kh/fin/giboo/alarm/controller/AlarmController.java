package kh.fin.giboo.alarm.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;   

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import kh.fin.giboo.alarm.model.service.AlarmService;
import kh.fin.giboo.alarm.model.vo.Alarm;
import kh.fin.giboo.member.model.vo.Member;
import kh.fin.giboo.mypage.model.vo.MyActiveDonationList;
 

@Controller
@SessionAttributes({ "loginMember" })
public class AlarmController {
	private Logger logger = LoggerFactory.getLogger(AlarmController.class);
	
	@Autowired
	private AlarmService service;
	
//	public class ReadStatusResponse {
//	    private String readStatus;
//
//	    public ReadStatusResponse(String readStatus) {
//	        this.readStatus = readStatus;
//	    }
//
//	    public String getReadStatus() {
//	        return readStatus;
//	    }
//
//	    public void setReadStatus(String readStatus) {
//	        this.readStatus = readStatus;
//	    }
//	}
//
//
//	@GetMapping("/Giboo/getReadStatus")
//	@ResponseBody
//	public ReadStatusResponse getReadStatus() {
//		String readStatus = service.getReadStatus();
//		return new ReadStatusResponse(readStatus);
//	}
	
	@SuppressWarnings("unchecked")
	@ResponseBody
	@GetMapping(value = { "/Giboo/notifications", "/notifications", ""  })
	public List<Alarm> selectAll(	Model model
									,HttpSession session,
									Alarm alarm,
									@ModelAttribute("loginMember") Member loginMember
			){
		int memberNo = loginMember.getMemberNo();
		model.addAttribute("memberNo", memberNo);
		Map<String, Object> map = service.selectAll(model);
		model.addAttribute("map", map);
		return (List<Alarm>) map.get("alarms");

		//return service.selectAll(model);
	}
	

	@ResponseBody
	@PostMapping(value ="/updateReadStatus", consumes = "application/json")
    public int updateReadStatus(

    		@RequestBody Map<String, Object> data,
    		HttpSession session) {
    	  int alarmNo = (int) data.get("alarmNo");
    	  String readStatus = (String) data.get("readStatus");

	      int result =  service.updateReadStatus(alarmNo, readStatus);
	        
	        session.setAttribute("readStatus", "Y");
	        
	    
	    return result;
    }

}






