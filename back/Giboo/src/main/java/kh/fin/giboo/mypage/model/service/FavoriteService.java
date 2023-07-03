
  package kh.fin.giboo.mypage.model.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;



public interface FavoriteService {
	
	
	

	int addFavoriteVolunteer(int memberNo, int volunteerNo);

	boolean checkFavoriteVolunteer(int memberNo, int volunteerNo);

	

	int addFavoriteDonation(int memberNo, int donationNo);
	
	boolean checkFavoriteDonation(int memberNo, int donationNo);

	int removeFavoriteDonation(int memberNo, int donationNo);
	
	
	
  
  }
 