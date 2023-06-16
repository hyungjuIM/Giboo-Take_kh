package kh.fin.giboo.event.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.fin.giboo.event.model.vo.EventList;

@Repository
public class EventDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	public List<EventList> selectEventList() {
		return sqlSession.selectList("event-mapper.selectEventList");
	}

}
