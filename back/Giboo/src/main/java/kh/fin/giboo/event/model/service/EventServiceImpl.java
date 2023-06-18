package kh.fin.giboo.event.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kh.fin.giboo.event.controller.EventController;
import kh.fin.giboo.event.model.dao.EventDAO;
import kh.fin.giboo.event.model.vo.EventDetailBoardPhoto;
import kh.fin.giboo.event.model.vo.EventDetailLeft;
import kh.fin.giboo.event.model.vo.EventDetailMember;
import kh.fin.giboo.event.model.vo.EventDetailTop;
import kh.fin.giboo.event.model.vo.EventList;
import kh.fin.giboo.event.model.vo.EventStickerBar;
import kh.fin.giboo.event.model.vo.Pagination;

@Service
public class EventServiceImpl implements EventService{
	private Logger logger = LoggerFactory.getLogger(EventServiceImpl.class);
	
	@Autowired
	private EventDAO dao;

	// 이벤트 목록 조회	
	@Override
	public Map<String, Object> selectEventList(int cp, Model model) {

		int listCount = dao.getListCount(model);
		Pagination pagination = new Pagination(cp, listCount);
		
		List<EventList> eventList = dao.selectEventList(pagination, model);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("eventList", eventList);
		
		return map;
	}

	// 이벤트 디테일 top
	@Override
	public EventDetailTop selectEventDetailTop(int eventNo) {
		return dao.selectEventDetailTop(eventNo);
	}

	@Override
	public List<EventDetailMember> selectEventDetailMember(int eventNo) {
		return dao.selectEventDetailMember(eventNo);
	}

	@Override
	public EventDetailLeft selectEventDetailLeft(int eventNo) {
		return dao.selectEventDetailLeft(eventNo);
	}

	@Override
	public List<EventStickerBar> selectEventStickerBar(int eventNo) {
		return dao.selectEventStickerBar(eventNo);
	}

	@Override
	public EventDetailBoardPhoto selectEventDetailBoardPhoto(int eventNo) {
		return dao.selectEventDetailBoardPhoto(eventNo);
	}




}
