package kh.fin.giboo.stamp.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.fin.giboo.mypage.model.vo.Stamp;
import kh.fin.giboo.stamp.model.dao.StampDAO;

@Service
public class StampServiceImpl implements StampService{
	
	@Autowired
	private StampDAO dao;

	@Override
	public List<Stamp> selectStampList(int memberNo) {
		return dao.selectStampList(memberNo);
	}
}
