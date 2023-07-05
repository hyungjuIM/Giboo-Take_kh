package kh.fin.giboo.volunteer.model.service;

import kh.fin.giboo.admin.model.vo.ParentCategory;
import kh.fin.giboo.mypage.model.vo.Favorite;
import kh.fin.giboo.volunteer.model.vo.Volunteer;
import kh.fin.giboo.volunteer.model.vo.VolunteerDetail;
import kh.fin.giboo.volunteer.model.vo.VolunteerStory;
import org.springframework.ui.Model;

import java.util.List;
import java.util.Map;

public interface VolunteerService {

    Map<String, Object> selectVolunteerList(int category, int cp, Model model);

    VolunteerDetail getVolunteerDetail(int volunteerNo);

    Map<String, Object> getStoryList(int cp, Model model);

    VolunteerStory selectVolunteerStory(int volunteerStoryNo);

    int updateViewCount(int volunteerStoryNo);

    List<Favorite> getFavoriteList(int memberNo);

    int insertVolunteer(VolunteerDetail detail);

    int updateVolunteer(VolunteerDetail detail);

    int insertStory(VolunteerStory story);

    int updateStory(VolunteerStory story);

    void storyDelete(int storyNo);

    List<ParentCategory> getParentCategoryList();
  
	int insertVolunteer(int volunteerNo, int memberNo);

	int selectVolunteer(int volunteerNo, int memberNo);

	List<Volunteer> selectVolunteer();

	VolunteerDetail getVolunteerDetail2(int volunteerNo2);

}
