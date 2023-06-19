package kh.fin.giboo.cs.model.dao;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import kh.fin.giboo.common.model.vo.Pagination;
import kh.fin.giboo.cs.model.vo.Faq;


@Repository
public class FaqDAO {
	private Logger logger = LoggerFactory.getLogger(FaqDAO.class);

	
	public int getListCount(Model model) {
		// TODO Auto-generated method stub
		return 0;
	}


	public List<Faq> selectFaqList(Pagination pagination, Model model) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
}
