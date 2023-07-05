package kh.fin.giboo.mypage.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.fin.giboo.common.model.vo.Pagination;
import kh.fin.giboo.mypage.model.dao.MyPointDAO;
import kh.fin.giboo.mypage.model.vo.MyActiveDonationList;
import kh.fin.giboo.mypage.model.vo.Point;

@Service
public class MyPointServiceImpl implements MyPointService{

	@Autowired
	private MyPointDAO dao;

	@Override
	public Map<String, Object> selectMyPoint(int cp, int memberNo) {
		int listCount = dao.getListCountPoint(memberNo);
		Pagination pagination = new Pagination(cp, listCount);

		
		// 3)나의기부내역 게시글 목록 조회
		List<Point> point = dao.selectMyPoint(pagination, memberNo);

		
		
		// map 만들어서 담기
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("point", point);
		
		return map;
	}
	
	
}
