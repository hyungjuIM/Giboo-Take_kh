package kh.fin.giboo.alarm.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import kh.fin.giboo.alarm.model.vo.Alarm;
import kh.fin.giboo.event.model.vo.EventList;
import kh.fin.giboo.event.model.vo.Pagination;

@Repository
public class AlarmDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Alarm> selectAll() {
		return sqlSession.selectList("alarm-mapper.selectAll" );
	}
	
	
	public int updateAlarmStatus(int alarmNo) {
		return sqlSession.update("alarm-mapper.updateAlarmStatus", alarmNo );
	}





	
	
}
