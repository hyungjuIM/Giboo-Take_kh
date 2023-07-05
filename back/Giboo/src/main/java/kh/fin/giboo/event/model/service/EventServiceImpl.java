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
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import kh.fin.giboo.alarm.model.vo.Alarm;
import kh.fin.giboo.event.Util;
import kh.fin.giboo.event.controller.EventController;
import kh.fin.giboo.event.model.dao.EventDAO;
import kh.fin.giboo.event.model.exception.InsertFailException;
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
	
	// 종료 이벤트 조회
	@Override
	public Map<String, Object> selectEventListDone(int cp, Model model) {
		int listCount = dao.getListCountDone(model);
		Pagination pagination = new Pagination(cp, listCount);
		
		List<EventList> eventList = dao.selectEventListDone(pagination, model);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("eventList", eventList);
		
		return map;
	}
	
	
	// 진행중 이벤트 조회
	@Override
	public Map<String, Object> selectEventListGoing(int cp, Model model) {
		int listCount = dao.getListCountGoing(model);
		Pagination pagination = new Pagination(cp, listCount);
		
		List<EventList> eventList = dao.selectEventListGoing(pagination, model);
		
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



	//
	@Transactional(rollbackFor = { Exception.class })
	@Override
	public int insertPopup(Map<String, Object> map, EventPopup eventPopup) throws IOException {

		MultipartFile uploadImage = (MultipartFile)map.get("uploadImage");

		int eventNo = dao.insertPopup(eventPopup);
		
		if(eventNo > 0) {
//			MultipartFile uploadImage = (MultipartFile)map.get("uploadImage");
//			String renameImage = null; // 변경된 파일명 저장 변수
//			renameImage = Util.fileRename( uploadImage.getOriginalFilename() );
//			map.put("profileImage", map.get("webPath") + renameImage);
//			
//			int result = dao.insertImage(map);
			String renameImage = null; // 변경된 파일명 저장 변수
			
			 renameImage = Util.fileRename(uploadImage.getOriginalFilename());
//			 String eventCertificationAttachment = map.get("webPath") + renameImage; //(추가)
//			 eventPopup.setEventCertificationAttachment(eventCertificationAttachment);
		        map.put("eventCertificationAttachment", map.get("webPath") + renameImage);
		        map.put("eventNo", eventNo); // 추가된 코드: eventNo 값을 map에 추가
//		        map.put("eventCertificationAttachment", eventPopup);

		        
		        int result = dao.insertImage(map);
			
			// DB 수정 성공 시 메모리에 임시 저장되어있는 파일을 서버에 저장
			if( result > 0 && map.get("eventCertificationAttachment") != null) {
				uploadImage.transferTo( new File( map.get("folderPath") + renameImage) );
//				String folderPath = (String) map.get("folderPath");
//		        uploadImage.transferTo(new File(folderPath + renameImage));
			}else { // 이미지 삽입 실패 시
				 
				// 강제로 예외를 발생 시켜 rollback을 수행하게 함
				// -> 사용자 정의 예외 
				throw new InsertFailException();
			}

		}
		return eventNo;	
		
	}

	@Override
	public int insertMyActiveEventList(MyActiveEventList myActiveEventList) {
		return dao.insertMyActiveEventList(myActiveEventList);
	}


	@Override
	public int insertStamp(Stamp stamp) {
		return dao.insertStamp(stamp);
	}

	@Override
	public int insertAlarm(Alarm alarm) {
		return dao.insertAlarm(alarm);
	}

	@Override
	public List<EventDetailBoardPhoto> selectEventDetailBoardPhoto(int eventNo) {
		return dao.selectEventDetailBoardPhoto(eventNo);
	}

	@Override
	public boolean checkFavorite(int memberNo, int eventNo) {
		return dao.checkFavorite(memberNo, eventNo);
	}

	@Override
	public int insertFav(int memberNo, int eventNo) {
		return dao.insertFav(memberNo, eventNo);
	}

	@Override
	public boolean checkAlreadyJoined(int memberNo, int eventNo) {
		return dao.checkAlreadyJoined(memberNo, eventNo);
	}

	@Override
	public List<EventMore> selectEventMore(int eventNo) {
		return dao.selectEventMore(eventNo);
	}

	@Override
	public EventCertification selectEventCertification(int eventNo) {
		return dao.selectEventCertification(eventNo);
	}

	@Override
	public boolean checkEventEnded(int eventNo) {
		return dao.checkEventEnded(eventNo);
	}

	@Override
	public Map<String, Object> getStamps(Model model) {
		List<Stamp> stamp = dao.getStamps(model);
		Map<String, Object> map = new HashMap<>();
		map.put("stamp", stamp);
		return map;
	}

	@Override
	public int addReward(int memberNo) {
		return dao.addReward(memberNo);
	}

	@Override
	public int deleteStamps(int memberNo) {
		return dao.deleteStamps(memberNo);
	}

//	@Override
//	public EventList getEventData(int eventNo) {
//		return dao.getEventData(eventNo);
//	}










}
