package kh.fin.giboo.mypage.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kh.fin.giboo.cs.model.vo.Pagination;
import kh.fin.giboo.mypage.controller.FavoriteController;
import kh.fin.giboo.mypage.model.dao.FavoriteDAO;
import kh.fin.giboo.mypage.model.vo.Favorite;

@Service
public class FavoriteServiceImpl implements FavoriteService{

	 private Logger logger = LoggerFactory.getLogger(FavoriteServiceImpl.class);
	@Autowired
	private FavoriteDAO dao;
	
			
		
	

	@Override
	public int addFavoriteVolunteer(int memberNo, int volunteerNo, String volunteerTitle) {
		
		
		
		return dao.insertFavoriteVolunteer(memberNo, volunteerNo, volunteerTitle);
	}






	@Override
	public boolean checkFavoriteVolunteer(int memberNo, int volunteerNo) {
		
		return dao.checkFavoriteVolunteer(memberNo, volunteerNo);
	}


	



	@Override
	public int deleteFavoriteVolunteer(int memberNo, int volunteerNo) {
		
		return dao.deleteFavoriteVolunteer(memberNo, volunteerNo);
	}






	@Override
	public int addFavoriteDonation(int memberNo, int donationNo, String donationTitle ) {
		
		return dao.insertFavoriteDonation(memberNo, donationNo, donationTitle);
	}
	
	
	





	@Override
	public boolean checkFavoriteDonation(int memberNo, int donationNo) {
		
		return dao.checkFavoriteDonation(memberNo, donationNo);
	}





	// 기부 즐겨찾기 삭제
	@Override
	public int deleteFavoriteDonation(int memberNo, int donationNo) {
		
		return dao.deleteFavoriteDonation(memberNo, donationNo);
	}





	// 기부, 봉사 즐겨찾기 조회
	@Override
	public Map<String, Object> selectListFavorite(int cp, Model model) {
		
		int listCount = dao.getListCount(model);
		Pagination pagination = new Pagination(cp, listCount);
		
		List<Favorite> favoriteList = dao.selectListFavorite(pagination, model);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("favoriteList", favoriteList);
		logger.info("favoriteList" + favoriteList);
		
		return map;
	}





	
	
	
	
	
	
}
