package kh.fin.giboo.cs.model.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.fin.giboo.cs.model.dao.CsDAO;

@Service
public class CsServiceImpl implements CsService{

	 private Logger logger = LoggerFactory.getLogger(CsServiceImpl.class);


	    @Autowired
	    private CsDAO dao;
	
}
