package kh.fin.giboo.myactive.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.fin.giboo.donation.model.vo.Donation;
import kh.fin.giboo.event.model.vo.Pagination;

@Repository
public class MyActiveDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	//특정 게시판의 전체 게시글 수 조회 DAO
	public int getListCount(int boardCode) {
		
		return sqlSession.selectOne("myactiveMapper.getListCount", boardCode);
	}

	//게시판 목록 조회 DAO
	public List<Donation> selectMyactiveDonationList(Pagination pagination, int boardCode) {
		// RowBounds 객체(마이바티스)
				// - 전체 조회 결과에서
				// 몇 개의 행을 건너 뛰고 (offset)
				// 그 다음 몇 개의 행만 조회(limit)할 것인지 지정
				
				int offset = ( pagination.getCurrentPage() - 1 ) * pagination.getLimit(); 
				
				RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
				
				return sqlSession.selectList("myactiveMapper.selectMyactiveDonationList", boardCode, rowBounds);
	}
}
