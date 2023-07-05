package kh.fin.giboo.mypage.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import kh.fin.giboo.cs.model.vo.Pagination;
import kh.fin.giboo.mypage.model.vo.Favorite;

@Repository
public class FavoriteDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	// 봉사 즐겨찾기 추가
	public int insertFavoriteVolunteer(int memberNo, int volunteerNo, String volunteerTitle) {
		
		  Map<String, Object> map = new HashMap<>();
	        map.put("memberNo", memberNo);
	        map.put("volunteerNo", volunteerNo);
	        map.put("volunteerTitle", volunteerTitle);
		
		return sqlSession.insert("myPage-mapper.insertFavoriteVolunteer", map);
	}

	// 봉사 즐겨찾기 중복 체크
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
	
	// 봉사 즐겨찾기 삭제
	public int deleteFavoriteVolunteer(int memberNo, int volunteerNo) {
		Map<String, Object> map = new HashMap<>();
        map.put("memberNo", memberNo);
        map.put("volunteerNo", volunteerNo);
	
        return sqlSession.delete("myPage-mapper.deleteFavoriteVolunteer", map);
	}
	
	
	// 기부 즐겨찾기 추가
	public int insertFavoriteDonation(int memberNo, int donationNo, String donationTitle ) {	 
		Map<String, Object> map = new HashMap<>();
	        map.put("memberNo", memberNo);
	        map.put("donationNo", donationNo);
	        map.put("donationTitle", donationTitle);
	        
		
		return sqlSession.insert("myPage-mapper.insertFavoriteDonation", map);
	}

	// 기부 즐겨찾기 중복 체크
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

	
	// 기부 즐겨찾기 삭제
	public int deleteFavoriteDonation(int memberNo, int donationNo) {
		Map<String, Object> map = new HashMap<>();
        map.put("memberNo", memberNo);
        map.put("donationNo", donationNo);
	
        return sqlSession.delete("myPage-mapper.deleteFavoriteDonation", map);
	}


	public Map<String, Object> selectListFavorite(Model model) {
		
		return null;
	}

	// 페이지 네이션
	public int getListCount(Model model) {
		
		return sqlSession.selectOne("myPage-mapper.getListCount", model);
	}

	// 기부 봉사 이벤트 목록 조회
	public List<Favorite> selectListFavorite(Pagination pagination, Model model) {
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		return sqlSession.selectList("myPage-mapper.selectListFavorite", model, rowBounds);
	}


	

}
