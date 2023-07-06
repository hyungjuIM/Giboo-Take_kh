package kh.fin.giboo.alarm.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

//	public List<Alarm> selectAll(Model model) {
//		return sqlSession.selectList("alarm-mapper.selectAll" );
//	}

	public List<Alarm> selectAll(Model model) {
		return sqlSession.selectList("alarm-mapper.selectAll", model);
	}
	
	
	
//	public int updateAlarmStatus(int alarmNo) {
//		return sqlSession.update("alarm-mapper.updateAlarmStatus", alarmNo );
//	}



//	public int updateReadStatusBulk(List<Alarm> updateList) {
//		int result =0;
//		  for (Alarm alarm : updateList) {
//	            result = sqlSession.update("alarm-mapper.updateReadStatus", alarm);
//	        }
//		  return result;
//	}
//


	public int updateReadStatus(double alarmNo, String readStatus) {
	    Map<String, Object> parameterMap = new HashMap<>();
        parameterMap.put("alarmNo", alarmNo);
        parameterMap.put("readStatus", readStatus);
        
       return sqlSession.update("alarm-mapper.updateReadStatus", parameterMap);
   
	}



	





	
	
}
