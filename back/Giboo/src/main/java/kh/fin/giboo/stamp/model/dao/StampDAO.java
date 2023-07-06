package kh.fin.giboo.stamp.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.fin.giboo.mypage.model.vo.Stamp;

@Repository
public class StampDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Stamp> selectStampList(int memberNo) {
		return sqlSession.selectList("stamp-mapper.selectStampList", memberNo);
	}
}
