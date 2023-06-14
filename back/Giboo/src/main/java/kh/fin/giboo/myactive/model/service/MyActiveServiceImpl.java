package kh.fin.giboo.myactive.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.fin.giboo.myactive.model.dao.MyActiveDAO;

@Service
public class MyActiveServiceImpl {

	@Autowired
	private MyActiveDAO dao;
	
	
}
