package kh.fin.giboo.alarm.model.service;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kh.fin.giboo.alarm.model.dao.AlarmDAO;
import kh.fin.giboo.alarm.model.vo.Alarm;
import kh.fin.giboo.event.model.vo.EventList;
import kh.fin.giboo.event.model.vo.Pagination;

@Service
public class AlarmServiceImpl implements AlarmService {

	@Autowired
	private AlarmDAO dao;

	@Override
	public List<Alarm> selectAll() {
		return dao.selectAll();
	}

	//알람창 읽음으로 인한 처리
	@Override
	public int updateAlarmStatus(int alarmNo) {
		return dao.updateAlarmStatus(alarmNo);
	}

	
	


	






	
	
	
}
