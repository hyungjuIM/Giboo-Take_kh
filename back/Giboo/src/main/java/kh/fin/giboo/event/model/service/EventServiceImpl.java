package kh.fin.giboo.event.model.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.fin.giboo.event.controller.EventController;
import kh.fin.giboo.event.model.dao.EventDAO;
import kh.fin.giboo.event.model.vo.EventList;

@Service
public class EventServiceImpl implements EventService{
	private Logger logger = LoggerFactory.getLogger(EventServiceImpl.class);
	
	@Autowired
	private EventDAO dao;
	
	@Override
	public List<EventList> selectEventList() {
		
		return dao.selectEventList();
	}

}
