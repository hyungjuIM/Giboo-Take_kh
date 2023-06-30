package kh.fin.giboo.mypage.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FavoriteDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int insertFavorite(Map<String, Object> paramMap) {
	
		
		return sqlSession.insert("mypage-mapper.insertFavorite", paramMap);
	}

}
