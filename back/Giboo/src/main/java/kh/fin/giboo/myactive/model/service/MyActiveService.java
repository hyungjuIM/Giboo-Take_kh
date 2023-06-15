package kh.fin.giboo.myactive.model.service;

import java.util.Map;

public interface MyActiveService {

	//나의활동1(기부) 목록 조회
	Map<String, Object> selectMyactiveDonationList(int cp, int boardCode);
	

}
