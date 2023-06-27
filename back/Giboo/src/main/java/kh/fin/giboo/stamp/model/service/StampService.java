package kh.fin.giboo.stamp.model.service;

import java.util.List;

import kh.fin.giboo.stamp.model.vo.Stamp;

public interface StampService {

	List<Stamp> selectStampList(int memberNo);

}
