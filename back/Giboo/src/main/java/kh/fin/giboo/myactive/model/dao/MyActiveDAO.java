package kh.fin.giboo.myactive.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyActiveDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
}
