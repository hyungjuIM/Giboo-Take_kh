package kh.fin.giboo.mypage.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import kh.fin.giboo.common.model.vo.Pagination;
import kh.fin.giboo.donation.model.vo.Donation;
import kh.fin.giboo.mypage.model.vo.MyActiveDonationList;
import kh.fin.giboo.mypage.model.vo.MyActiveEventList;
import kh.fin.giboo.mypage.model.vo.MyActiveVolunteerList;


@Repository
public class MyActiveDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	// 기부 게시판의 전체 게시글 수 조회 DAO
	public int getListCount1(Model model) {

		return sqlSession.selectOne("myPage-mapper.getListCount1", model);
	}

	// 기부 게시판 목록 조회 DAO
	public List<MyActiveDonationList> selectMyactiveDonationList(Pagination pagination, Model model) {
		// RowBounds 객체(마이바티스)
		// - 전체 조회 결과에서
		// 몇 개의 행을 건너 뛰고 (offset)
		// 그 다음 몇 개의 행만 조회(limit)할 것인지 지정

		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();

		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());

		return sqlSession.selectList("myPage-mapper.selectMyactiveDonationList", model, rowBounds);
	}

	// 봉사 게시판의 전체 게시글 수 조회 DAO
	public int getListCount2(Model model) {

		return sqlSession.selectOne("myPage-mapper.getListCount2", model);
	}

	// 봉사 게시판 목록 조회
	public List<MyActiveVolunteerList> selectMyActiveVolunteerList(Pagination pagination, Model model) {

		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();

		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());

		return sqlSession.selectList("myPage-mapper.selectMyActiveVolunteerList", model, rowBounds);
	}

	// 이벤트 게시판의 전체 게시글 수 조회 DAO
	public int getListCount3(Model model) {

		return sqlSession.selectOne("myPage-mapper.getListCount3", model);
	}

	// 이벤트 게시판 목록 조회

	public List<MyActiveEventList> selectMyActiveEventList(Pagination pagination, Model model) {

		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();

		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());

		return sqlSession.selectList("myPage-mapper.selectMyActiveEventList", model, rowBounds);
	}

}
