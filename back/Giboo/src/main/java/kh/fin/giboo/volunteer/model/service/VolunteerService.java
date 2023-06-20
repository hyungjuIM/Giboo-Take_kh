package kh.fin.giboo.volunteer.model.service;

import kh.fin.giboo.admin.model.vo.ParentCategory;
import kh.fin.giboo.volunteer.model.vo.Volunteer;

import java.util.List;

public interface VolunteerService {

    List<Volunteer> selectVolunteerList();

    List<ParentCategory> selectParentCategoryList();

    List<Volunteer> selectCategoryVolunteerList(int category);
}
