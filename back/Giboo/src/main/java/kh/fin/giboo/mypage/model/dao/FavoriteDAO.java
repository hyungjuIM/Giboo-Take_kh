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
	

	
	public int insertFavorite(int memberNo, int volunteerNo) {
		
		  Map<String, Object> map = new HashMap<>();
	        map.put("memberNo", memberNo);
	        map.put("volunteerNo", volunteerNo);
		
		return sqlSession.insert("myPage-mapper.insertFavorite", map);
	}


	public boolean checkFavorite(int memberNo, int volunteerNo) {
		Map<String, Object> map = new HashMap<>();
		map.put("memberNo", memberNo);
		map.put("volunteerNo", volunteerNo);
		Boolean result = sqlSession.selectOne("myPage-mapper.checkFavorite", map);
		
		 if (result == null) {
		        return false;
		    }
		
		return result;
	}

}
