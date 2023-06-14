package kh.fin.giboo.myask.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyAskDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
}
