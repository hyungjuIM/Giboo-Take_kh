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
	public int addfavorite(Map<String, Object> paramMap) {
		
		
		
		return dao.insertFavorite(paramMap);
		
	}

}