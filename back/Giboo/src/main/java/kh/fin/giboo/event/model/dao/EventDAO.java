package kh.fin.giboo.event.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import kh.fin.giboo.alarm.model.vo.Alarm;
import kh.fin.giboo.event.model.vo.EventCertification;
import kh.fin.giboo.event.model.vo.EventDetailBoardPhoto;
import kh.fin.giboo.event.model.vo.EventDetailLeft;
import kh.fin.giboo.event.model.vo.EventDetailMember;
import kh.fin.giboo.event.model.vo.EventDetailTop;
import kh.fin.giboo.event.model.vo.EventList;
import kh.fin.giboo.event.model.vo.EventMore;
import kh.fin.giboo.event.model.vo.EventPopup;
import kh.fin.giboo.event.model.vo.EventStickerBar;
import kh.fin.giboo.event.model.vo.Pagination;
import kh.fin.giboo.mypage.model.vo.MyActiveEventList;
import kh.fin.giboo.mypage.model.vo.Stamp;

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
	
	// 종료 이벤트 조회 페이지네이션
	public int getListCountDone(Model model) {
		return sqlSession.selectOne("event-mapper.getListCountDone", model);
	}

	// 종료 이벤트 조회
	public List<EventList> selectEventListDone(Pagination pagination, Model model) {
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		return sqlSession.selectList("event-mapper.selectEventListDone", model, rowBounds);
	}

	// 진행중 이벤트 조회 페이지네이션
	public int getListCountGoing(Model model) {
		return sqlSession.selectOne("event-mapper.getListCountGoing", model);
	}
	
	// 진행중 이벤트 조회
	public List<EventList> selectEventListGoing(Pagination pagination, Model model) {
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		return sqlSession.selectList("event-mapper.selectEventListGoing", model, rowBounds);
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
	public EventDetailLeft selectEventDetailLeft(EventDetailLeft eventDetailLeft, int eventNo) {

		return sqlSession.selectOne("event-mapper.selectEventDetailLeft", eventNo);
	}
	public List<EventStickerBar> selectEventStickerBar(int eventNo) {
		return sqlSession.selectList("event-mapper.selectEventStickerBar", eventNo);
	}


	
	
//
	public int insertPopup(EventPopup eventPopup) {
		int result = sqlSession.insert("event-mapper.insertPopup", eventPopup); // 0 또는 1
		if(result > 0)	result = eventPopup.getEventNo();
		// 게시글 삽입 성공 시
		// <selectKey> 태그를 이용해 세팅된 boardNo 값을 반환함 --> 게시글 번호 사용 가능
		return result;
	}

	public int insertImage(Map<String, Object> map) {
		return sqlSession.insert("event-mapper.insertImage", map);
	}


	public int insertMyActiveEventList(MyActiveEventList myActiveEventList) {
		return sqlSession.insert("event-mapper.insertMyActiveEventList", myActiveEventList);
	}
	
	public int insertStamp(Stamp stamp) {
		return sqlSession.insert("event-mapper.insertStamp", stamp);
	}

	public int insertAlarm(Alarm alarm) {
		return sqlSession.insert("event-mapper.insertAlarm", alarm);
	}
	
	
	public List<EventDetailBoardPhoto> selectEventDetailBoardPhoto(int eventNo) {
		return sqlSession.selectList("event-mapper.selectEventDetailBoardPhoto", eventNo);
	}




	public boolean checkFavorite(int memberNo, int eventNo) {
	    Map<String, Object> parameterMap = new HashMap<>();
        parameterMap.put("memberNo", memberNo);
        parameterMap.put("eventNo", eventNo);
        Boolean result = sqlSession.selectOne("event-mapper.checkFavorite", parameterMap);
	    if (result == null) {
	        return false;
	    }
	    return result;
	}
	
	

	public int insertFav(int memberNo, int eventNo) {
	    Map<String, Object> parameterMap = new HashMap<>();
        parameterMap.put("memberNo", memberNo);
        parameterMap.put("eventNo", eventNo);
		return sqlSession.insert("event-mapper.insertFav", parameterMap);
	}

	public boolean checkAlreadyJoined(int memberNo, int eventNo) {
	    Map<String, Object> parameterMap = new HashMap<>();
        parameterMap.put("memberNo", memberNo);
        parameterMap.put("eventNo", eventNo);
        Boolean result = sqlSession.selectOne("event-mapper.checkAlreadyJoined", parameterMap);
	    if (result == null) {
	        return false;
	    }
	    return result;
	}
	
	
	public boolean checkEventEnded(int eventNo) {
        Boolean result = sqlSession.selectOne("event-mapper.checkEventEnded", eventNo);
	    if (result != true) {
	        return false;
	    }
	    return result;
	}

	

	public List<EventMore> selectEventMore(int eventNo) {
		return sqlSession.selectList("event-mapper.selectEventMore", eventNo);
	}

	public EventCertification selectEventCertification(int eventNo) {
		return sqlSession.selectOne("event-mapper.selectEventCertification", eventNo);
	}

	public List<Stamp> getStamps(Model model) {
		return sqlSession.selectList("event-mapper.getStamps", model);
	}

	public int addReward(int memberNo) {
		return sqlSession.insert("event-mapper.addReward", memberNo);
	}

	public int deleteStamps(int memberNo) {
		return sqlSession.delete("event-mapper.deleteStamps", memberNo);
	}

//	public boolean getEventStatus(int eventNo) {
//		Boolean result = sqlSession.selectOne("event-mapper.getEventStatus", eventNo);
//	    if (result == null) {
//	        return false;
//	    }
//	    return result;
//	}



	



	

}
