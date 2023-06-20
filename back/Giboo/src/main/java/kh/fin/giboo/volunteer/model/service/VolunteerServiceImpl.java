package kh.fin.giboo.volunteer.model.service;

import kh.fin.giboo.admin.model.vo.ParentCategory;
import kh.fin.giboo.volunteer.model.dao.VolunteerDAO;
import kh.fin.giboo.volunteer.model.vo.Volunteer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class VolunteerServiceImpl implements VolunteerService {

    private Logger logger = LoggerFactory.getLogger(VolunteerServiceImpl.class);

    @Autowired
    private VolunteerDAO dao;

    @Override
    public List<Volunteer> selectVolunteerList() {
        return dao.selectVolunteerList();
    }

    @Override
    public List<ParentCategory> selectParentCategoryList() {
        return dao.selectParentCategoryList();
    }

    @Override
    public List<Volunteer> selectCategoryVolunteerList(int category) {
        return dao.selectCategoryVolunteerList(category);
    }
}
