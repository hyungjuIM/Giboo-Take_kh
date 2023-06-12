package kh.fin.giboo.map.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.fin.giboo.map.model.vo.Map;

@Repository
public class MapDAOImpl implements MapDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;
//
//	@Override
//	public List<Map> mapList(int mapNo) {
//		return sqlSession.selectList("mapMapper.selectMapList", mapNo);
//	}

}
