package kh.fin.giboo.event.model.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import kh.fin.giboo.alarm.model.vo.Alarm;
import kh.fin.giboo.event.Util;
import kh.fin.giboo.event.controller.EventController;
import kh.fin.giboo.event.model.dao.EventDAO;
import kh.fin.giboo.event.model.vo.EventDetailBoardPhoto;
import kh.fin.giboo.event.model.vo.EventDetailLeft;
import kh.fin.giboo.event.model.vo.EventDetailMember;
import kh.fin.giboo.event.model.vo.EventDetailTop;
import kh.fin.giboo.event.model.vo.EventList;
import kh.fin.giboo.event.model.vo.EventPopup;
import kh.fin.giboo.event.model.vo.EventStickerBar;
import kh.fin.giboo.event.model.vo.Pagination;
import kh.fin.giboo.mypage.model.vo.MyActiveEventList;
import kh.fin.giboo.mypage.model.vo.Stamp;

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

	//
	@Override
	public int insertPopup(Map<String, Object> map, EventPopup eventPopup) throws IOException {

		int eventNo = dao.insertPopup(eventPopup);
		
		if(eventNo > 0) {
			MultipartFile uploadImage = (MultipartFile)map.get("uploadImage");
			String renameImage = null; // 변경된 파일명 저장 변수
			renameImage = Util.fileRename( uploadImage.getOriginalFilename() );
			map.put("profileImage", map.get("webPath") + renameImage);
			
			int result = dao.insertImage(map);
			
			// DB 수정 성공 시 메모리에 임시 저장되어있는 파일을 서버에 저장
			if( result > 0 && map.get("profileImage") != null) {
				uploadImage.transferTo( new File( map.get("folderPath") + renameImage) );
			}
		}	
		
		return eventNo;
	}

	@Override
	public int insertStamp(Stamp stamp) {
		return dao.insertStamp(stamp);
	}

	@Override
	public MyActiveEventList insertMyActiveEventList(int eventNo) {
		return dao.insertMyActiveEventList(eventNo);
	}

	@Override
	public Alarm insertAlarm(int eventNo) {
		return dao.insertAlarm(eventNo);
	}




}
