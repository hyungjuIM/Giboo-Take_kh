package kh.fin.giboo.myactive.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.fin.giboo.donation.model.vo.Donation;
import kh.fin.giboo.event.model.vo.Pagination;
import kh.fin.giboo.myactive.model.dao.MyActiveDAO;
import kh.fin.giboo.myactive.model.vo.MyActiveDonationList;
import kh.fin.giboo.myactive.model.vo.MyActiveEventList;
import kh.fin.giboo.myactive.model.vo.MyActiveVolunteerList;

@Service
public class MyActiveServiceImpl implements MyActiveService {

	@Autowired
	private MyActiveDAO dao;

	
//	@Override
//	public Map<String, Object> selectMyactiveDonationList(int cp) {
//		
//		
//		// 2) 페이지네이션 객체 생성(listCount)
//		int listCount = dao.getListCount();
//		Pagination pagination = new Pagination(cp, listCount);
//
//		
//		// 3)나의기부내역 게시글 목록 조회
//		List<MyActiveDonationList> myActiveDonationList = dao.selectMyactiveDonationList(pagination);
//
//		
//		
//		// map 만들어서 담기
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("pagination", pagination);
//		map.put("myActiveDonationList", myActiveDonationList);
//		
//		return map;
//	}

	@Override
	public List<MyActiveDonationList> selectMyactiveDonationList() {
		
		return dao.selectMyactiveDonationList();
	}


	@Override
	public List<MyActiveVolunteerList> selectMyActiveVolunteerList() {
		return dao.selectMyActiveVolunteerList();
	}


	@Override
	public List<MyActiveEventList> selectMyActiveEventList() {
		return dao.selectMyActiveEventList();
	}
	
	
	
	
	
		
	
	
	
}
