package kh.fin.giboo.mypage.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import kh.fin.giboo.common.model.vo.Pagination;
import kh.fin.giboo.mypage.model.vo.MyReview;

@Repository
public class MyReviewDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	//리뷰 게시판의 전체 게시글수 조회 DAO
	public int getListCount4(Model model) {
		
		return sqlSession.selectOne("myPage-mapper.getListCount4", model);
	}
	
	// 리뷰 게시판 목록 조회 DAO
	public List<MyReview> selectMyReview(Pagination pagination, Model model) {
		
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();

		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());

		return sqlSession.selectList("myPage-mapper.selectMyReview", model, rowBounds);
	}

}
