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

	//기부조회
	@Override
	public Map<String, Object> selectMyactiveDonationList(int cp, int memberNo) {
				
		// 2) 페이지네이션 객체 생성(listCount)
		int listCount = dao.getListCount1(memberNo);
		Pagination pagination = new Pagination(cp, listCount);

		
		// 3)나의기부내역 게시글 목록 조회
		List<MyActiveDonationList> myActiveDonationList = dao.selectMyactiveDonationList(pagination, memberNo);

		
		
		// map 만들어서 담기
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("myActiveDonationList", myActiveDonationList);
		
		return map;
	}

	//봉사조회
	@Override
	public Map<String, Object> selectMyActiveVolunteerList(int cp, int memberNo) {
		
		int listCount = dao.getListCount2( memberNo);
		Pagination pagination = new Pagination(cp, listCount);

		List<MyActiveVolunteerList> myActiveVolunteerList = dao.selectMyActiveVolunteerList(pagination, memberNo);

		// map 만들어서 담기
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("myActiveVolunteerList", myActiveVolunteerList);
		
		return map;
	}

	//이벤트조회
	@Override
	public Map<String, Object> selectMyActiveEventList(int cp, int memberNo) {
		
		int listCount = dao.getListCount3(memberNo);
		Pagination pagination = new Pagination(cp, listCount);

		List<MyActiveEventList> myActiveEventList = dao.selectMyActiveEventList(pagination, memberNo);

		// map 만들어서 담기
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("myActiveEventList", myActiveEventList);
		
		return map;
	}

	//봉사 검색리스트 조회
	@Override
	public Map<String, Object> searchMyActiveVolunteerList(Map<String, Object> paramMap) {
		int listCount = dao.searchListCount2( paramMap  );
		
		// 페이지네이션 객체 생성
		Pagination pagination = new Pagination( (int)paramMap.get("cp") , listCount);
		
		// 검색 조건에 맞는 게시글 목록 조회(페이징 처리 적용)
		List<MyActiveVolunteerList> myActiveVolunteerList = dao.searchMyActiveVolunteerList(paramMap, pagination);
		
		// map만들어 담기
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("myActiveVolunteerList", myActiveVolunteerList);
		
		return map;
	}
	
	//기부금 검색 리스트조회
	@Override
	public Map<String, Object> searchMyactiveDonationList(Map<String, Object> paramMap) {
		int listCount = dao.searchListCount1( paramMap  );
		
		// 페이지네이션 객체 생성
		Pagination pagination = new Pagination( (int)paramMap.get("cp") , listCount);
		
		// 검색 조건에 맞는 게시글 목록 조회(페이징 처리 적용)
		List<MyActiveDonationList> myActiveDonationList = dao.searchMyactiveDonationList(paramMap, pagination);
		
		// map만들어 담기
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("myActiveDonationList", myActiveDonationList);
		
		return map;
	}
	
	//이벤트 검색 리스트 조회
	@Override
	public Map<String, Object> searchMyActiveEventList(Map<String, Object> paramMap) {

		int listCount = dao.searchListCount3( paramMap  );
		
		// 페이지네이션 객체 생성
		Pagination pagination = new Pagination( (int)paramMap.get("cp") , listCount);
		
		// 검색 조건에 맞는 게시글 목록 조회(페이징 처리 적용)
		List<MyActiveEventList> myActiveEventList = dao.searchMyActiveEventList(paramMap, pagination);
		
		// map만들어 담기
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("myActiveEventList", myActiveEventList);
		
		return map;



	}
	
	

	
}
