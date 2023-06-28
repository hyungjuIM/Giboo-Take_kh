package kh.fin.giboo.member.model.service;

import java.io.IOException;
import java.util.Map;

public interface MyPageService {

	//회원정보변경
	int memberChange(Map<String, Object> paramMap); 
	
	//비번 변경
	int changePw(Map<String, Object> paramMap);
	
	//이미지변경
	int changeProfile(Map<String, Object> map) throws IOException;
	
}
