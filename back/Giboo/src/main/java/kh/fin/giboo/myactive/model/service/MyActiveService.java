package kh.fin.giboo.myactive.model.service;

import java.util.List;
import java.util.Map;

import kh.fin.giboo.myactive.model.vo.MyActiveDonationList;

public interface MyActiveService {

	//나의활동1(기부) 목록 조회
	//Map<String, Object> selectMyactiveDonationList(int cp);

	List<MyActiveDonationList> selectMyactiveDonationList();
	
	

}
