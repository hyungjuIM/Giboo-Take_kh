package kh.fin.giboo.mypage.model.dao;

import java.util.List;
import java.util.Map;

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
	public int getListCount1(int memberNo) {
		
		

		return sqlSession.selectOne("myPage-mapper.getListCount1", memberNo);
	}

	// 기부 게시판 목록 조회 DAO
	public List<MyActiveDonationList> selectMyactiveDonationList(Pagination pagination, int memberNo) {
		// RowBounds 객체(마이바티스)
		// - 전체 조회 결과에서
		// 몇 개의 행을 건너 뛰고 (offset)
		// 그 다음 몇 개의 행만 조회(limit)할 것인지 지정

		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();

		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		


		return sqlSession.selectList("myPage-mapper.selectMyactiveDonationList", memberNo, rowBounds);
	}

	// 봉사 게시판의 전체 게시글 수 조회 DAO
	public int getListCount2(int memberNo) {

		return sqlSession.selectOne("myPage-mapper.getListCount2", memberNo);
	}

	// 봉사 게시판 목록 조회
	public List<MyActiveVolunteerList> selectMyActiveVolunteerList(Pagination pagination, int memberNo) {

		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();

		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());

		return sqlSession.selectList("myPage-mapper.selectMyActiveVolunteerList", memberNo, rowBounds);
	}

	// 이벤트 게시판의 전체 게시글 수 조회 DAO
	public int getListCount3(int memberNo) {

		return sqlSession.selectOne("myPage-mapper.getListCount3", memberNo);
	}

	// 이벤트 게시판 목록 조회

	public List<MyActiveEventList> selectMyActiveEventList(Pagination pagination, int memberNo) {

		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();

		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());

		return sqlSession.selectList("myPage-mapper.selectMyActiveEventList", memberNo, rowBounds);
	}
	
	//봉사 검색 게시물=======================================================
	public int searchListCount2(Map<String, Object> paramMap) {
		return sqlSession.selectOne("myPage-mapper.searchListCount2", paramMap);
	}


	public List<MyActiveVolunteerList> searchMyActiveVolunteerList(
			Map<String, Object> paramMap, Pagination pagination) {
int offset = ( pagination.getCurrentPage() - 1 ) * pagination.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());

		return sqlSession.selectList("myPage-mapper.searchMyActiveVolunteerList", paramMap, rowBounds);
		
	}

	//기부금 검색 게시물=======================================================
	public int searchListCount1(Map<String, Object> paramMap) {
		return sqlSession.selectOne("myPage-mapper.searchListCount1", paramMap);
	}

	public List<MyActiveDonationList> searchMyactiveDonationList(Map<String, Object> paramMap, Pagination pagination) {
int offset = ( pagination.getCurrentPage() - 1 ) * pagination.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());

		return sqlSession.selectList("myPage-mapper.searchMyactiveDonationList", paramMap, rowBounds);
	}

	
	//이벤트 검색 게시물=======================================================
	public int searchListCount3(Map<String, Object> paramMap) {
		return sqlSession.selectOne("myPage-mapper.searchListCount3", paramMap);
	}

	public List<MyActiveEventList> searchMyActiveEventList(Map<String, Object> paramMap, Pagination pagination) {
int offset = ( pagination.getCurrentPage() - 1 ) * pagination.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());

		return sqlSession.selectList("myPage-mapper.searchMyActiveEventList", paramMap, rowBounds);
	}

	public int getCount() {
		return sqlSession.selectOne("myPage-mapper.getVolCount");
	}

	public int getVolMoney() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("myPage-mapper.getVolMoney");
	}
	
	

	
	}