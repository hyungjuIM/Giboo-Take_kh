package kh.fin.giboo.map.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.fin.giboo.map.model.vo.MapList;

@Repository
public class MapDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<MapList> selectMapList() {
		return sqlSession.selectList("map-mapper.selectMapList");
	}

}
