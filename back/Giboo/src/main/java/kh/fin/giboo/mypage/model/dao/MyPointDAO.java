package kh.fin.giboo.mypage.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.fin.giboo.common.model.vo.Pagination;
import kh.fin.giboo.mypage.model.vo.Point;

@Repository
public class MyPointDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int getListCountPoint(int memberNo) {
		return sqlSession.selectOne("myPage-mapper.getListCountPoint", memberNo);
	}

	public List<Point> selectMyPoint(Pagination pagination, int memberNo) {
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();

		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		


		return sqlSession.selectList("myPage-mapper.selectMyPoint", memberNo, rowBounds);
	}
}
