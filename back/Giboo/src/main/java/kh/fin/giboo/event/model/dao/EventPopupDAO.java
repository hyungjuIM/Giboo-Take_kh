package kh.fin.giboo.event.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EventPopupDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;


}
