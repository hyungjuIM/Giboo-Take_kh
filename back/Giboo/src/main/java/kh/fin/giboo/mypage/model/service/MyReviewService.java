package kh.fin.giboo.mypage.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import kh.fin.giboo.mypage.model.vo.MyActiveDonationList;
import kh.fin.giboo.mypage.model.vo.MyActiveEventList;
import kh.fin.giboo.mypage.model.vo.MyActiveVolunteerList;

public interface MyReviewService {
	

	//나의 리뷰 목록 조회

	Map<String, Object> selectMyReview(int cp, Model model);

	Map<String, Object> selectMyreview(int cp, int memberNo);
	
	

}
