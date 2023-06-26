package kh.fin.giboo.member.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kh.fin.giboo.member.model.service.KakaoLoginService;

@Controller

public class KakaoController {

	@Autowired
	public KakaoLoginService service;
	
	@RequestMapping("/oauth/kakao")
	public ModelAndView kakaoLogin(@RequestParam(value = "code", required = false) String code){

		
		System.out.println("code:" + code);
		
		// 2번
				String access_Token = service.getAccessToken(code);
				System.out.println("###access_Token#### : " + access_Token);
				// 위의 access_Token 받는 걸 확인한 후에 밑에 진행
		return null;	
		// return에 페이지를 해도 되고, 여기서는 코드가 넘어오는지만 확인할거기 때문에 따로 return 값을 두지는 않았음

	}
}

// 3번
//				HashMap<String, Object> userInfo = service.getUserInfo(access_Token);
//				System.out.println("###nickname#### : " + userInfo.get("nickname"));
//				System.out.println("###email#### : " + userInfo.get("email"));
