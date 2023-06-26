package kh.fin.giboo.member.model.service;

import java.util.HashMap;

public interface KakaoLoginService {
	String getAccessToken(String authorize_code);

//	HashMap<String, Object> getUserInfo(String access_Token);
}
