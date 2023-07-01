package kh.fin.giboo.event.model.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import kh.fin.giboo.alarm.model.vo.Alarm;
import kh.fin.giboo.event.model.vo.EventDetailBoardPhoto;
import kh.fin.giboo.event.model.vo.EventDetailLeft;
import kh.fin.giboo.event.model.vo.EventDetailMember;
import kh.fin.giboo.event.model.vo.EventDetailTop;
import kh.fin.giboo.event.model.vo.EventList;
import kh.fin.giboo.event.model.vo.EventPopup;
import kh.fin.giboo.event.model.vo.EventStickerBar;
import kh.fin.giboo.mypage.model.vo.MyActiveEventList;
import kh.fin.giboo.mypage.model.vo.Stamp;

public interface EventService {

	//	이벤트 목록 조회
	Map<String, Object> selectEventList(int cp, Model model);

	EventDetailTop selectEventDetailTop(int eventNo);

	List<EventDetailMember> selectEventDetailMember(int eventNo);

	EventDetailLeft selectEventDetailLeft(int eventNo);

	List<EventStickerBar> selectEventStickerBar(int eventNo);


	//
	int insertPopup(Map<String, Object> map, EventPopup eventPopup) throws IOException;

	int insertMyActiveEventList(MyActiveEventList myActiveEventList);
	
	int insertStamp(Stamp stamp);


	int insertAlarm(Alarm alarm);

	List<EventDetailBoardPhoto> selectEventDetailBoardPhoto(int eventNo);

	//참여자 중복
	boolean eventDupCheck(int memberNo1, int eventNo);

	



}
