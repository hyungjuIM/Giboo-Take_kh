package kh.fin.giboo.mypage.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import kh.fin.giboo.mypage.model.vo.MyActiveDonationList;
import kh.fin.giboo.mypage.model.vo.MyActiveEventList;
import kh.fin.giboo.mypage.model.vo.MyActiveVolunteerList;

public interface MyActiveService {
	

	//나의활동 전체 목록 조회
		Map<String, Object> selectMyactiveDonationList(int cp, int memberNo);

		Map<String, Object> selectMyActiveVolunteerList(int cp, int memberNo);

		Map<String, Object> selectMyActiveEventList(int cp, int memberNo);

		//검색 목록 조회
		Map<String, Object> searchMyactiveDonationList(Map<String, Object> paramMap);
		
		Map<String, Object> searchMyActiveVolunteerList(Map<String, Object> paramMap);

		Map<String, Object> searchMyActiveEventList(Map<String, Object> paramMap);

		// 봉사 인원 카운트
		int getCount();

		// 봉사 금액 카운트
		int getVolMoney();


	
	

}
