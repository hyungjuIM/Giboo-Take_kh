
  package kh.fin.giboo.mypage.model.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;



public interface FavoriteService {
	
	
	

	int addfavorite(int memberNo, int volunteerNo);

	boolean checkFavorite(int memberNo, int volunteerNo);
	
	
	
	
  
  }
 