package kh.fin.giboo.mypage.model.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.fin.giboo.mypage.model.dao.FavoriteDAO;

@Service
public class FavoriteServiceImpl implements FavoriteService{

	@Autowired
	private FavoriteDAO dao;
	
		
		
		
	

	@Override
	public int addfavorite(int memberNo, int volunteerNo) {
		
		
		
		return dao.insertFavorite(memberNo, volunteerNo);
	}






	@Override
	public boolean checkFavorite(int memberNo, int volunteerNo) {
		
		return dao.checkFavorite(memberNo, volunteerNo);
	}
	
	

}
