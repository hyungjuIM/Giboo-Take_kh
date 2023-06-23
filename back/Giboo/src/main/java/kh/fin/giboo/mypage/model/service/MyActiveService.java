package kh.fin.giboo.mypage.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import kh.fin.giboo.mypage.model.vo.MyActiveDonationList;
import kh.fin.giboo.mypage.model.vo.MyActiveEventList;
import kh.fin.giboo.mypage.model.vo.MyActiveVolunteerList;

public interface MyActiveService {
	

	//나의활동1(기부) 목록 조회
		Map<String, Object> selectMyactiveDonationList(int cp, Model model);

		Map<String, Object> selectMyActiveVolunteerList(int cp, Model model);

		Map<String, Object> selectMyActiveEventList(int cp, Model model);
	
	

}
