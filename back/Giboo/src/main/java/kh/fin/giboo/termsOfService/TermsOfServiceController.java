package kh.fin.giboo.termsOfService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
@RequestMapping("/termsOfService")
public class TermsOfServiceController {
	private Logger logger = LoggerFactory.getLogger(TermsOfServiceController.class);
	
	
	@GetMapping("/termsOfService")
	public String termsOfService() {
		logger.info("이용약관페이지");
		return "termsOfService/termsOfService";
	}
}
