package kh.fin.giboo.notice.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import kh.fin.giboo.common.model.vo.Pagination;
import kh.fin.giboo.notice.model.vo.Notice;
import kh.fin.giboo.notice.model.vo.NoticeDetail;

@Repository
public class NoticeDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int getListCount(Model model) {
		return sqlSession.selectOne("notice-Mapper.getListCount", model);
	}



	public List<Notice> selectNoticeList(Pagination pagination, Model model) {
	
		int offset = ( pagination.getCurrentPage() - 1 ) * pagination.getLimit(); 
		
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		return sqlSession.selectList("notice-Mapper.selectNoticeList", model, rowBounds);

	}



	/** 상세조회
	 * @param noticeNo
	 * @return
	 */
	public NoticeDetail selectNoticeDetail(int noticeNo) {
		return sqlSession.selectOne("notice-Mapper.selectNoticeDetail", noticeNo);
	}



	/**	조회수
	 * @param noticeNo
	 * @return
	 */
	public int updateVieweadCount(int noticeNo) {
		return sqlSession.update("notice-Mapper.updateViewCount", noticeNo);
	}

}
