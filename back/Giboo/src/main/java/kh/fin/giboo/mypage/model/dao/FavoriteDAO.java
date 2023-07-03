package kh.fin.giboo.mypage.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import kh.fin.giboo.cs.model.vo.Faq;
import kh.fin.giboo.cs.model.vo.Pagination;

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


	public int insertFavoriteDonation(int memberNo, int donationNo ) {
		 
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
	
        return sqlSession.delete("myPage-mapper.deleteFavoriteDonation", map);
	}


	public Map<String, Object> selectListFavorite(Model model) {
		
		return null;
	}

	// 페이지 네이션
	public int getListCount(Model model) {
		
		return sqlSession.selectOne("myPage-mapper.getListCount", model);
	}


	public List<Faq> selectListFavorite(Pagination pagination, Model model) {
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		return sqlSession.selectList("myPage-mapper.selectListFavorite", model, rowBounds);
	}

}
