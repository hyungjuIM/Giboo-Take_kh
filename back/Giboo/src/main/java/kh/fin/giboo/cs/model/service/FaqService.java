package kh.fin.giboo.cs.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import kh.fin.giboo.cs.model.vo.Faq;

public interface FaqService {


	Map<String, Object> selectFaqList(int cp, Model model);

	

	Map<String, Object> selectFaqVolunteer(int cp, Model model);

}
