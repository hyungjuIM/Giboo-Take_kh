package kh.fin.giboo.map.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.fin.giboo.map.model.vo.MapList;
import kh.fin.giboo.map.model.vo.Pagination;

@Repository
public class MapDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;


	public int getMapListCount(int cp) {
		return sqlSession.selectOne("map-mapper.getMapListCount", cp);
	}


	public List<MapList> selectMapList(Pagination pagination) {
		
		int offset = ( pagination.getCurrentPage() - 1 ) * pagination.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		return sqlSession.selectList("map-mapper.selectMapList", rowBounds);
	}


	public int searchListCount(Map<String, Object> paramMap) {
		return sqlSession.selectOne("map-mapper.searchListCount", paramMap);
	}




}
