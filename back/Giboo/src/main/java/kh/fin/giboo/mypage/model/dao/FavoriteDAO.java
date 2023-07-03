package kh.fin.giboo.mypage.model.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FavoriteDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	
		public int insertFavoriteVolunteer(int memberNo, int volunteerNo) {
		
		  Map<String, Object> map = new HashMap<>();
	        map.put("memberNo", memberNo);
	        map.put("volunteerNo", volunteerNo);
		
		return sqlSession.insert("myPage-mapper.insertFavoriteVolunteer", map);
	}


	public boolean checkFavoriteVolunteer(int memberNo, int volunteerNo) {
		Map<String, Object> map = new HashMap<>();
		map.put("memberNo", memberNo);
		map.put("volunteerNo", volunteerNo);
		Boolean result = sqlSession.selectOne("myPage-mapper.checkFavoriteVolunteer", map);
		
		 if (result == null) {
		        return false;
		    }
		
		return result;
	}


	public int insertFavoriteDonation(int memberNo, int donationNo) {
		 
		Map<String, Object> map = new HashMap<>();
	        map.put("memberNo", memberNo);
	        map.put("donationNo", donationNo);
		
		return sqlSession.insert("myPage-mapper.insertFavoriteDonation", map);
	}


	public boolean checkFavoriteDonation(int memberNo, int donationNo) {
		Map<String, Object> map = new HashMap<>();
		map.put("memberNo", memberNo);
		map.put("donationNo", donationNo);
		Boolean result = sqlSession.selectOne("myPage-mapper.checkFavoriteDonation", map);
		
		 if (result == null) {
		        return false;
		    }
		
		return result;
	}


	public int deleteFavoriteDonation(int memberNo, int donationNo) {
		Map<String, Object> map = new HashMap<>();
        map.put("memberNo", memberNo);
        map.put("donationNo", donationNo);
	
        return sqlSession.delete("myPage-mapper.insertFavoriteDonation", map);
	}

}
