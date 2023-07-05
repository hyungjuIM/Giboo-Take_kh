package kh.fin.giboo.volunteer.model.service;

import kh.fin.giboo.admin.model.vo.ParentCategory;
import kh.fin.giboo.common.Util;
import kh.fin.giboo.common.model.vo.Pagination;
import kh.fin.giboo.mypage.model.vo.Favorite;
import kh.fin.giboo.volunteer.model.dao.VolunteerDAO;
import kh.fin.giboo.volunteer.model.vo.Reply;
import kh.fin.giboo.volunteer.model.vo.Volunteer;
import kh.fin.giboo.volunteer.model.vo.VolunteerDetail;
import kh.fin.giboo.volunteer.model.vo.VolunteerStory;
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
        int volunteerListCount = 0;
        if (categoryValidate) {
            volunteerList = dao.getVolunteerList(pagination, category, model);
            volunteerListCount = dao.getVolunteerListCount(category);
        } else {
            volunteerList = dao.getVolunteerList(pagination, model);
            volunteerListCount = dao.getVolunteerListCount();
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
        map.put("volunteerListCount", volunteerListCount);

        return map;
    }

    @Override
    public List<Favorite> getFavoriteList(int memberNo) {
        return dao.getFavoriteList(memberNo);
    }

    @Override
    public int insertVolunteer(VolunteerDetail detail) {
        detail.setVolunteerTitle(Util.XSSHandling(detail.getVolunteerTitle()));
        detail.setVolunteerContent(Util.XSSHandling(detail.getVolunteerContent()));
        detail.setVolunteerContent(Util.newLineHandling(detail.getVolunteerContent()));

        return dao.insertVolunteer(detail);
    }

    @Override
    public int updateVolunteer(VolunteerDetail detail) {
        detail.setVolunteerTitle(Util.XSSHandling(detail.getVolunteerTitle()));
        detail.setVolunteerContent(Util.XSSHandling(detail.getVolunteerContent()));
        detail.setVolunteerContent(Util.newLineHandling(detail.getVolunteerContent()));

        return dao.updateVolunteer(detail);
    }

    @Override
    public int insertStory(VolunteerStory story) {
        story.setVolunteerStoryTitle(Util.XSSHandling(story.getVolunteerStoryTitle()));
        story.setVolunteerStoryContent(Util.XSSHandling(story.getVolunteerStoryContent()));
        story.setVolunteerStoryContent(Util.newLineHandling(story.getVolunteerStoryContent()));

        return dao.insertStory(story);
    }

    @Override
    public int updateStory(VolunteerStory story) {
        story.setVolunteerStoryTitle(Util.XSSHandling(story.getVolunteerStoryTitle()));
        story.setVolunteerStoryContent(Util.XSSHandling(story.getVolunteerStoryContent()));
        story.setVolunteerStoryContent(Util.newLineHandling(story.getVolunteerStoryContent()));

        return dao.updateStory(story);
    }

    @Override
    public void storyDelete(int storyNo) {
        dao.storyDelete(storyNo);
    }

    @Override
    public List<ParentCategory> getParentCategoryList() {
        return dao.getParentCategoryList();
    }

    @Override
    public VolunteerDetail getVolunteerDetail(int volunteerNo) {
        return dao.getVolunteerDetail(volunteerNo);
    }

    @Override
    public Map<String, Object> getStoryList(int cp, Model model) {
        int listCount = dao.getStoryListCount();
        Pagination pagination = new Pagination(cp, listCount);

        List<VolunteerStory> storyList = dao.getStoryList(pagination, model);

        Map<String, Object> map = new HashMap<String, Object>();
        map.put("pagination", pagination);
        map.put("storyList", storyList);

        return map;
    }

    @Override
    public VolunteerStory selectVolunteerStory(int volunteerStoryNo) {
        return dao.selectVolunteerStory(volunteerStoryNo);
    }

    @Override
    public int updateViewCount(int volunteerStoryNo) {
        return dao.updateViewCount(volunteerStoryNo);
    }

	@Override
	public int insertVolunteer(int volunteerNo, int memberNo) {
		return dao.insertVolunteer(volunteerNo,memberNo);
	}

	@Override
	public int selectVolunteer(int volunteerNo, int memberNo) {
		return dao.selectVolunteer(volunteerNo,memberNo);
	}

	@Override
	public int insertReply(Reply reply) {
		// XSS, 개행문자 처리
		reply.setReplyContent(  Util.XSSHandling( reply.getReplyContent() )  );
		reply.setReplyContent(  Util.newLineHandling( reply.getReplyContent() )  );
				
		return dao.insertReply(reply);
	}
	
	// 응원 등록 서비스 구현
	@Override
	public Reply getReply(String replyContent) {
		// TODO Auto-generated method stub
		return dao.getReply(replyContent);
	}
	
	// 응원 목록 조회 서비스 구현
	@Override
	public List<Reply> selectReplyList(int volunteerNo) {
		
		return dao.selectReplyList(volunteerNo);
	}
	
	
//	@Override
//	public Map<String, Object> selectVolunteerList() {
//		return dao.selectVolunteerList();
//	}
    
}
