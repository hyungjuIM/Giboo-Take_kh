package kh.fin.giboo.cs.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kh.fin.giboo.cs.model.vo.Pagination;
import kh.fin.giboo.cs.model.dao.FaqDAO;
import kh.fin.giboo.cs.model.vo.Faq;

@Service
public class FaqServiceImpl implements FaqService{

	 private Logger logger = LoggerFactory.getLogger(FaqServiceImpl.class);


	    @Autowired
	    private FaqDAO dao;

	    
	    
		@Override
		public Map<String, Object> selectFaqList(int cp, Model model) {
			
			int listCount = dao.getListCount(model);
			Pagination pagination = new Pagination(cp, listCount);
			
			List<Faq> faqList = dao.selectFaqList(pagination, model);
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("pagination", pagination);
			map.put("faqList", faqList);
			
			return map;
		}



		@Override
		public Map<String, Object> selectFaqVolunteer(int cp, Model model) {
			int listCount = dao.getListCount(model);
			Pagination pagination = new Pagination(cp, listCount);
			
			List<Faq> faqVolunteer = dao.selectFaqVolunteer(pagination, model);
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("pagination", pagination);
			map.put("faqVolunteer", faqVolunteer);
			
			return map;
		}



		
		
	    
	    
}
