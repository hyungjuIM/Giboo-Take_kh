package kh.fin.giboo.volunteer.model.service;

import kh.fin.giboo.volunteer.model.vo.VolunteerDetail;
import org.springframework.ui.Model;

import java.util.Map;

public interface VolunteerService {

    Map<String, Object> selectVolunteerList(int category, int cp, Model model);

    VolunteerDetail getVolunteerDetail(int volunteerNo);
}
