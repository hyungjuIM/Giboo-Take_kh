package kh.fin.giboo.map.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.fin.giboo.map.model.dao.MapDAO;
import kh.fin.giboo.map.model.vo.MapList;

@Service
public class MapServiceImpl implements MapService{

	@Autowired
	private MapDAO dao;

	@Override
	public List<MapList> selectMapList() {
		return dao.selectMapList();
	}

	
}
