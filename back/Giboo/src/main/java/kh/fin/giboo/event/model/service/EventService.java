package kh.fin.giboo.event.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import kh.fin.giboo.event.model.vo.EventDetailBoardPhoto;
import kh.fin.giboo.event.model.vo.EventDetailLeft;
import kh.fin.giboo.event.model.vo.EventDetailMember;
import kh.fin.giboo.event.model.vo.EventDetailTop;
import kh.fin.giboo.event.model.vo.EventList;
import kh.fin.giboo.event.model.vo.EventStickerBar;

public interface EventService {

	//	이벤트 목록 조회
	Map<String, Object> selectEventList(int cp, Model model);

	EventDetailTop selectEventDetailTop(int eventNo);

	List<EventDetailMember> selectEventDetailMember(int eventNo);

	EventDetailLeft selectEventDetailLeft(int eventNo);

	List<EventStickerBar> selectEventStickerBar(int eventNo);

	EventDetailBoardPhoto selectEventDetailBoardPhoto(int eventNo);

}
