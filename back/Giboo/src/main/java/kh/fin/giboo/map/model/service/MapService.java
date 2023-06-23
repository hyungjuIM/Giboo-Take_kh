package kh.fin.giboo.map.model.service;

import java.util.List;
import java.util.Map;

import kh.fin.giboo.map.model.vo.MapList;

public interface MapService {

	Map<String, Object> selectMapList(int cp);

	Map<String, Object> searchBoardList(Map<String, Object> paramMap);




}
