package kh.fin.giboo.mypage.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyStampDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
}
