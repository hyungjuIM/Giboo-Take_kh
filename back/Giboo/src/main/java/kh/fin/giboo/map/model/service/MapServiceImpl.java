package kh.fin.giboo.map.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.fin.giboo.map.model.dao.MapDAO;
import kh.fin.giboo.map.model.vo.MapList;
import kh.fin.giboo.map.model.vo.Pagination;

@Service
public class MapServiceImpl implements MapService{

	@Autowired
	private MapDAO dao;

	@Override
	public Map<String, Object> selectMapList(int cp) {
		
		int listCount = dao.getMapListCount(cp);
		
		Pagination pagination = new Pagination(cp, listCount);

		List<MapList> mapList = dao.selectMapList(pagination);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("mapList", mapList);
		
		return map;
	}

	@Override
	public Map<String, Object> searchBoardList(Map<String, Object> paramMap) {

		int listCount = dao.searchListCount(paramMap);
		
		Pagination pagination = new Pagination( (int)paramMap.get("cp") , listCount);

		List<MapList> mapList = dao.searchMapList(paramMap, pagination);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("boardList", mapList);
		
		return map;
	}




	
}
