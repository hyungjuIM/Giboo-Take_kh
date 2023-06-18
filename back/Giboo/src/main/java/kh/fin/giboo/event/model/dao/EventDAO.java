package kh.fin.giboo.event.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import kh.fin.giboo.event.model.vo.EventDetailBoardPhoto;
import kh.fin.giboo.event.model.vo.EventDetailLeft;
import kh.fin.giboo.event.model.vo.EventDetailMember;
import kh.fin.giboo.event.model.vo.EventDetailTop;
import kh.fin.giboo.event.model.vo.EventList;
import kh.fin.giboo.event.model.vo.EventStickerBar;
import kh.fin.giboo.event.model.vo.Pagination;

@Repository
public class EventDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	// 페이지네이션 이벤트 목록 조회
	public int getListCount(Model model) {
		return sqlSession.selectOne("event-mapper.getListCount", model);
	}

    // 이벤트 목록 조회
	public List<EventList> selectEventList(Pagination pagination, Model model) {
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		return sqlSession.selectList("event-mapper.selectEventList", model, rowBounds);
	}

	public EventDetailTop selectEventDetailTop(int eventNo) {
		return sqlSession.selectOne("event-mapper.selectEventDetailTop", eventNo);
	}

	public List<EventDetailMember> selectEventDetailMember(int eventNo) {
		return sqlSession.selectList("event-mapper.selectEventDetailMember", eventNo);
	}

	public EventDetailLeft selectEventDetailLeft(int eventNo) {
		return sqlSession.selectOne("event-mapper.selectEventDetailLeft", eventNo);
	}

	public List<EventStickerBar> selectEventStickerBar(int eventNo) {
		return sqlSession.selectList("event-mapper.selectEventStickerBar", eventNo);
	}

	public EventDetailBoardPhoto selectEventDetailBoardPhoto(int eventNo) {
		return sqlSession.selectOne("event-mapper.selectEventDetailBoardPhoto", eventNo);
	}
	
	

}
