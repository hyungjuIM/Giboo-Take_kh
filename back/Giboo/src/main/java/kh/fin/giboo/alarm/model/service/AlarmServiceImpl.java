package kh.fin.giboo.alarm.model.service;


import java.util.HashMap;
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
	public Map<String, Object> selectAll(Model model) {
		List<Alarm> alarms = dao.selectAll(model);
		Map<String, Object> map = new HashMap<>();
		map.put("alarms", alarms);
		return map;
	}

	@Override
	public int updateReadStatus(int alarmNo, String readStatus) {
		return dao.updateReadStatus(alarmNo, readStatus);
		 
	}

	



	
	


	






	
	
	
}
