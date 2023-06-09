package kh.fin.giboo.alarm.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import kh.fin.giboo.alarm.model.vo.Alarm;
import kh.fin.giboo.mypage.model.vo.MyActiveDonationList;
import kh.fin.giboo.mypage.model.vo.MyActiveEventList;
import kh.fin.giboo.mypage.model.vo.MyActiveVolunteerList;

public interface AlarmService {


	Map<String, Object> selectAll(Model model);
	

	int updateReadStatus(int alarmNo, String readStatus);


       


}
