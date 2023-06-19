package kh.fin.giboo.cs.model.service;

import java.util.Map;

import org.springframework.ui.Model;

public interface FaqService {


	Map<String, Object> selectFaqList(int cp, Model model);

}
