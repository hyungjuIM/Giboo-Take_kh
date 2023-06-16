package kh.fin.giboo.myactive.model.service;

import java.util.List;
import java.util.Map;

import kh.fin.giboo.myactive.model.vo.MyActiveDonationList;
import kh.fin.giboo.myactive.model.vo.MyActiveVolunteerList;

public interface MyActiveService {
	

	List<MyActiveDonationList> selectMyactiveDonationList();

	List<MyActiveVolunteerList> selectMyActiveVolunteerList();
	
	//나의활동1(기부) 목록 조회
	//	Map<String, Object> selectMyactiveDonationList(int cp);
	
	

}
