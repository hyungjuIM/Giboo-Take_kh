package kh.fin.giboo.mypage.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.fin.giboo.mypage.model.dao.MyAskDAO;

@Service
public class MyAskServiceImpl {

	@Autowired
	private MyAskDAO dao;
}
