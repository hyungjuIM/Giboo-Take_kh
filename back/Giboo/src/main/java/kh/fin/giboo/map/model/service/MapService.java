package kh.fin.giboo.map.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import kh.fin.giboo.map.model.vo.MapDetailHome;
import kh.fin.giboo.map.model.vo.MapDetailTop;
import kh.fin.giboo.map.model.vo.MapList;

public interface MapService {

	Map<String, Object> selectMapList(int cp, Model model);

//	Map<String, Object> searchMapList(Map<String, Object> paramMap);

//	Map<String, Object> searchMapList(int cp, Model model);

	Map<String, Object> searchMapList(Map<String, Object> paramMap);

	MapDetailTop selectMapDetailTop(int volunteerNo);

	MapDetailHome selectMapDetailHome(int volunteerNo);




}
