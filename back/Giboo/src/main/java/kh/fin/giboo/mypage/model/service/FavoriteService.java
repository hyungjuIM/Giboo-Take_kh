
  package kh.fin.giboo.mypage.model.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;



public interface FavoriteService {
	
	
	

	int addFavoriteVolunteer(int memberNo, int volunteerNo,String volunteerTitle);

	boolean checkFavoriteVolunteer(int memberNo, int volunteerNo);

	int deleteFavoriteVolunteer(int memberNo, int volunteerNo);

	int addFavoriteDonation(int memberNo, int donationNo, String donationTitle );
	
	boolean checkFavoriteDonation(int memberNo, int donationNo);

	int deleteFavoriteDonation(int memberNo, int donationNo);

	Map<String, Object> selectListFavorite(int cp, Model model);

	

	
	
	
	
  
  }
 