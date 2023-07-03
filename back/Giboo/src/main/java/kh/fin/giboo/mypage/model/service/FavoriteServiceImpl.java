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
	public int addFavoriteVolunteer(int memberNo, int volunteerNo) {
		
		
		
		return dao.insertFavoriteVolunteer(memberNo, volunteerNo);
	}






	@Override
	public boolean checkFavoriteVolunteer(int memberNo, int volunteerNo) {
		
		return dao.checkFavoriteVolunteer(memberNo, volunteerNo);
	}






	@Override
	public int addFavoriteDonation(int memberNo, int donationNo) {
		
		return dao.insertFavoriteDonation(memberNo, donationNo);
	}
	
	
	





	@Override
	public boolean checkFavoriteDonation(int memberNo, int donationNo) {
		
		return dao.checkFavoriteDonation(memberNo, donationNo);
	}





	// 기부 즐겨찾기 삭제
	@Override
	public int removeFavoriteDonation(int memberNo, int donationNo) {
		
		return dao.deleteFavoriteDonation(memberNo, donationNo);
	}
	
	

}
