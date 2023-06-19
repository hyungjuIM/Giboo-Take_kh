package kh.fin.giboo.notice.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kh.fin.giboo.common.model.vo.Pagination;
import kh.fin.giboo.notice.model.dao.NoticeDAO;
import kh.fin.giboo.notice.model.vo.Notice;
import kh.fin.giboo.notice.model.vo.NoticeDetail;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDAO dao;

	@Override
	public Map<String, Object> selectNoticeList(int cp, Model model) {
		
		int listCount = dao.getListCount(model);
		Pagination pagination = new Pagination(cp, listCount);
		
		List<Notice> noticeList = dao.selectNoticeList(pagination, model);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("noticeList", noticeList);
		
		return map;
	}

	@Override
	public NoticeDetail selectNoticeDetail(int noticeNo) {
		return dao.selectNoticeDetail(noticeNo);
	}

	@Override
	public int updateViewCount(int noticeNo) {
		return dao.updateVieweadCount(noticeNo);
	}

	

}
