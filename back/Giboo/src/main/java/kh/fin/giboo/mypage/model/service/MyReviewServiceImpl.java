package kh.fin.giboo.mypage.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kh.fin.giboo.common.model.vo.Pagination;
import kh.fin.giboo.mypage.model.dao.MyReviewDAO;
import kh.fin.giboo.mypage.model.vo.Favorite;
import kh.fin.giboo.mypage.model.vo.FavoriteList;
import kh.fin.giboo.mypage.model.vo.MyActiveVolunteerList;
import kh.fin.giboo.mypage.model.vo.MyReview;
import kh.fin.giboo.volunteer.model.vo.Reply;

@Service
public class MyReviewServiceImpl implements MyReviewService{

	@Autowired
	private MyReviewDAO dao;
	
	@Override
	public Map<String, Object> selectMyReview(int cp, Model model) {
		int listCount = dao.getListCount4(model);
		Pagination pagination = new Pagination(cp, listCount);

		List<MyReview> myReview = dao.selectMyReview(pagination, model);

		// map 만들어서 담기
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("myReview", myReview);
		
		return map;
	}

	@Override
	public Map<String, Object> selectMyreview(int cp, int memberNo) {
		int listCount = dao.getListCountReply(memberNo);
		Pagination pagination = new Pagination(cp, listCount);

		
		// 3)나의기부내역 게시글 목록 조회
		List<Reply> reply = dao.selectMyreview(pagination, memberNo);

		
		
		// map 만들어서 담기
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("reply", reply);
		
		return map;
	}

}
