package kh.fin.giboo.map.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kh.fin.giboo.map.model.dao.MapDAO;
import kh.fin.giboo.map.model.vo.MapDetailHome;
import kh.fin.giboo.map.model.vo.MapDetailReviewReply;
import kh.fin.giboo.map.model.vo.MapDetailReviewStory;
import kh.fin.giboo.map.model.vo.MapDetailTop;
import kh.fin.giboo.map.model.vo.MapList;
import kh.fin.giboo.map.model.vo.Pagination;
import kh.fin.giboo.volunteer.model.vo.Volunteer;

@Service
public class MapServiceImpl implements MapService{

	@Autowired
	private MapDAO dao;

	@Override
	public Map<String, Object> selectMapList(int cp,Model model) {
		
		int listCount = dao.getMapListCount(model);
		
		Pagination pagination = new Pagination(cp, listCount);

		List<MapList> mapList = dao.selectMapList(pagination,model);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("mapList", mapList);
		
		return map;
	}

	@Override
	public Map<String, Object> searchMapList(Map<String, Object> paramMap) {

		int listCount = dao.searchListCount(paramMap);
		
		Pagination pagination = new Pagination( (int)paramMap.get("cp") , listCount);

		List<MapList> mapList = dao.searchMapList(paramMap, pagination);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("mapList", mapList);
		
		return map;
	}

	@Override
	public MapDetailTop selectMapDetailTop(int volunteerNo) {
		return dao.selectMapDetailTop(volunteerNo);
	}

	@Override
	public MapDetailHome selectMapDetailHome(int volunteerNo) {
		return dao.selectMapDetailHome(volunteerNo);
	}


	
	 @Override 
	 public List<Volunteer> selectMarkerVolunteer() {
	  
	  return dao.selectMarkerVolunteer(); 
	  }
	 

	

	@Override
	public List<MapDetailReviewReply> selectMapDetailReviewReply(int volunteerNo) {
		return dao.selectMapDetailReviewReply(volunteerNo);
	}

	@Override
	public List<MapDetailReviewStory> selectMapDetailReviewStory(int volunteerNo) {
		return dao.selectMapDetailReviewStory(volunteerNo);
	}




//	@Override
//	public Map<String, Object> searchMapList(int cp, Model model) {
//		int listCount = dao.searchListCount(model);
//		
//		Pagination pagination = new Pagination(cp, listCount);
//
//		List<MapList> mapList = dao.searchMapList(pagination,model);
//
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("pagination", pagination);
//		map.put("mapList", mapList);
//		
//		return map;
//	}





	
}
