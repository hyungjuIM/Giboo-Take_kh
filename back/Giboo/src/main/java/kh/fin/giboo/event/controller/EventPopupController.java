package kh.fin.giboo.event.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import kh.fin.giboo.event.model.service.EventPopupService;
import kh.fin.giboo.event.model.vo.EventPopup;

@RestController
@RequestMapping("/eventPopup")
public class EventPopupController {
	
	private Logger logger = LoggerFactory.getLogger(EventPopupController.class);
	
	
	@Autowired
	private EventPopupService service;
		
	

}
