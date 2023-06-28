package kh.fin.giboo.map.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import kh.fin.giboo.map.model.vo.MapDetailHome;
import kh.fin.giboo.map.model.vo.MapDetailReviewReply;
import kh.fin.giboo.map.model.vo.MapDetailReviewStory;
import kh.fin.giboo.map.model.vo.MapDetailTop;
import kh.fin.giboo.map.model.vo.MapList;
import kh.fin.giboo.map.model.vo.Pagination;
import kh.fin.giboo.volunteer.model.vo.Volunteer;

@Repository
public class MapDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	


	public int getMapListCount(Model model) {
		return sqlSession.selectOne("map-mapper.getMapListCount",model);
	}


	public List<MapList> selectMapList(Pagination pagination, Model model) {
		
		int offset = ( pagination.getCurrentPage() - 1 ) * pagination.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		return sqlSession.selectList("map-mapper.selectMapList", model, rowBounds);
	}


	public int searchListCount(Map<String, Object> paramMap) {
		return sqlSession.selectOne("map-mapper.searchListCount", paramMap);
	}


	public List<MapList> searchMapList(Map<String, Object> paramMap, Pagination pagination) {
		int offset = ( pagination.getCurrentPage() - 1 ) * pagination.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		return sqlSession.selectList("map-mapper.searchMapList", paramMap, rowBounds);
	}


	public MapDetailTop selectMapDetailTop(int volunteerNo) {
		return sqlSession.selectOne("map-mapper.selectMapDetailTop", volunteerNo);
	}


	public MapDetailHome selectMapDetailHome(int volunteerNo) {
		return sqlSession.selectOne("map-mapper.selectMapDetailHome", volunteerNo);
	}



	public List<Volunteer> selectMarkerVolunteer() {
		return sqlSession.selectList("map-mapper.selectMarkerVolunteer");
	}

	public List<MapDetailReviewReply> selectMapDetailReviewReply(int volunteerNo) {
		return sqlSession.selectList("map-mapper.selectMapDetailReviewReply", volunteerNo);
	}


	public List<MapDetailReviewStory> selectMapDetailReviewStory(int volunteerNo) {
		return sqlSession.selectList("map-mapper.selectMapDetailReviewStory", volunteerNo);

	}




}
