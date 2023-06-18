package kh.fin.giboo.mypage.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kh.fin.giboo.common.model.vo.Pagination;
import kh.fin.giboo.donation.model.vo.Donation;
import kh.fin.giboo.mypage.model.dao.MyActiveDAO;
import kh.fin.giboo.mypage.model.vo.MyActiveDonationList;
import kh.fin.giboo.mypage.model.vo.MyActiveEventList;
import kh.fin.giboo.mypage.model.vo.MyActiveVolunteerList;


@Service
public class MyActiveServiceImpl implements MyActiveService {

	@Autowired
	private MyActiveDAO dao;

	
	@Override
	public Map<String, Object> selectMyactiveDonationList(int cp, Model model) {
		
		
		// 2) 페이지네이션 객체 생성(listCount)
		int listCount = dao.getListCount1(model);
		Pagination pagination = new Pagination(cp, listCount);

		
		// 3)나의기부내역 게시글 목록 조회
		List<MyActiveDonationList> myActiveDonationList = dao.selectMyactiveDonationList(pagination, model);

		
		
		// map 만들어서 담기
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("myActiveDonationList", myActiveDonationList);
		
		return map;
	}

	
	@Override
	public Map<String, Object> selectMyActiveVolunteerList(int cp, Model model) {
		
		int listCount = dao.getListCount2(model);
		Pagination pagination = new Pagination(cp, listCount);

		List<MyActiveVolunteerList> myActiveVolunteerList = dao.selectMyActiveVolunteerList(pagination, model);

		// map 만들어서 담기
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("myActiveVolunteerList", myActiveVolunteerList);
		
		return map;
	}


	@Override
	public Map<String, Object> selectMyActiveEventList(int cp, Model model) {
		
		int listCount = dao.getListCount3(model);
		Pagination pagination = new Pagination(cp, listCount);

		List<MyActiveEventList> myActiveEventList = dao.selectMyActiveEventList(pagination, model);

		// map 만들어서 담기
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("myActiveEventList", myActiveEventList);
		
		return map;
	}
	
	

	
}
