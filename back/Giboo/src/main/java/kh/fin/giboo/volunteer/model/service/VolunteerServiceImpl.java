package kh.fin.giboo.volunteer.model.service;

import kh.fin.giboo.admin.model.vo.ParentCategory;
import kh.fin.giboo.common.model.vo.Pagination;
import kh.fin.giboo.volunteer.model.dao.VolunteerDAO;
import kh.fin.giboo.volunteer.model.vo.Volunteer;
import kh.fin.giboo.volunteer.model.vo.VolunteerDetail;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class VolunteerServiceImpl implements VolunteerService {

    private Logger logger = LoggerFactory.getLogger(VolunteerServiceImpl.class);

    @Autowired
    private VolunteerDAO dao;

    @Override
    public Map<String, Object> selectVolunteerList(int category, int cp, Model model) {
        List<ParentCategory> parentCategoryList = dao.getParentCategoryList();
        boolean categoryValidate = false;
        int listCount = 0;

        for (ParentCategory pc : parentCategoryList) {
            if (pc.getParentCategoryNo() == category) {
                categoryValidate = true;
            }
        }

        if (categoryValidate) {
            listCount = dao.getListCount(category);
        } else {
            listCount = dao.getListCount();
        }

        Pagination pagination = new Pagination(cp, listCount);
        pagination.setLimit(6);

        List<Volunteer> volunteerList =  null;
        if (categoryValidate) {
            volunteerList = dao.getVolunteerList(pagination, category, model);
        } else {
            volunteerList = dao.getVolunteerList(pagination, model);
        }

        for(Volunteer v : volunteerList) {
            LocalDate currentDate = LocalDate.now();
            LocalDate dDay = LocalDate.of(v.getEndRecruitDate().getYear() + 1900, v.getEndRecruitDate().getMonth() + 1, v.getEndRecruitDate().getDate());
            long untilDay = ChronoUnit.DAYS.between(currentDate, dDay);
            v.setDDay(untilDay);

            int percent = (v.getVolunteerCount() * 100) / v.getTargetPeople();
            v.setPercent(percent);
        }

        Map<String, Object> map = new HashMap<String, Object>();
        map.put("pagination", pagination);
        map.put("parentCategoryList", parentCategoryList);
        map.put("volunteerList", volunteerList);

        return map;
    }

    @Override
    public VolunteerDetail getVolunteerDetail(int volunteerNo) {
        return dao.getVolunteerDetail(volunteerNo);
    }
}
