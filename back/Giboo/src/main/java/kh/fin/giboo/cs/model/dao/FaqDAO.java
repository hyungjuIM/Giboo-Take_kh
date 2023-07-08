package kh.fin.giboo.cs.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import kh.fin.giboo.cs.model.vo.Faq;
import kh.fin.giboo.cs.model.vo.Pagination;


@Repository
public class FaqDAO {
	private Logger logger = LoggerFactory.getLogger(FaqDAO.class);

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int getListCount(Model model) {
		return sqlSession.selectOne("faq-mapper.getListCount", model);
	}

	public List<Faq> selectFaqList(Pagination pagination, Model model) {
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		return sqlSession.selectList("faq-mapper.selectFaqList", model, rowBounds);
	}

	public List<Faq> selectFaqVolunteer(Pagination pagination, Model model) {
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
	
		return sqlSession.selectList("faq-mapper.selectFaqVolunteer", model, rowBounds);
	}

	public List<Faq> selectFaqDanation(Pagination pagination, Model model) {
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
	
		return sqlSession.selectList("faq-mapper.selectFaqDonation", model, rowBounds);
	}

	public List<Faq> selectFaqEvent(Pagination pagination, Model model) {
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		return sqlSession.selectList("faq-mapper.selectFaqEvent", model, rowBounds);
	}

	public List<Faq> selectFaqCommon(Pagination pagination, Model model) {
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		return sqlSession.selectList("faq-mapper.selectFaqCommon", model, rowBounds);
	}
	
}
