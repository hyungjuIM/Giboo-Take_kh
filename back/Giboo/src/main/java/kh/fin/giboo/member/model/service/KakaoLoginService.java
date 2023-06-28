package kh.fin.giboo.member.model.service;

import java.util.HashMap;

import kh.fin.giboo.member.model.vo.Member;

public interface KakaoLoginService {

	String getAccessToken(String authorize_code);

	Member getUserInfo(String access_Token);
	public void kakaoLogout(String access_Token);
}
