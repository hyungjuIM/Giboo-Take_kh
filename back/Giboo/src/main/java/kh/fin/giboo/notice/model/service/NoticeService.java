package kh.fin.giboo.notice.model.service;

import java.util.Map;

import org.springframework.ui.Model;

import kh.fin.giboo.notice.model.vo.NoticeDetail;

public interface NoticeService {

	Map<String, Object> selectNoticeList(int cp, Model model);

	NoticeDetail selectNoticeDetail(int noticeNo);

	int updateViewCount(int noticeNo);

	int insertNotice(NoticeDetail noticeDetail);

	int updateNotice(NoticeDetail noticeDetail);

	int deleteNotice(int noticeNo);

	void insertAlarm(int noticeNo);

	void updateAlarm(int noticeNo);


}
