package kh.fin.giboo.volunteer.model.dao;

import kh.fin.giboo.admin.model.vo.ParentCategory;
import kh.fin.giboo.common.model.vo.Pagination;
import kh.fin.giboo.mypage.model.vo.Favorite;
import kh.fin.giboo.volunteer.model.vo.Reply;
import kh.fin.giboo.volunteer.model.vo.Volunteer;
import kh.fin.giboo.volunteer.model.vo.VolunteerDetail;
import kh.fin.giboo.volunteer.model.vo.VolunteerStory;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class VolunteerDAO {

    @Autowired
    private SqlSessionTemplate sqlSession;

    public List<ParentCategory> getParentCategoryList() {
        return sqlSession.selectList("volunteerMapper.getParentCategoryList");
    }

    public int getListCount(int category) {
        return sqlSession.selectOne("volunteerMapper.getListCount", category);
    }

    public int getListCount() {
        return sqlSession.selectOne("volunteerMapper.getListCount");
    }

    public List<Volunteer> getVolunteerList(Pagination pagination, int category, Model model) {
        int offset = ( pagination.getCurrentPage() - 1 ) * pagination.getLimit();
        RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());

        return sqlSession.selectList("volunteerMapper.getVolunteerList", model, rowBounds);
    }

    public List<Volunteer> getVolunteerList(Pagination pagination, Model model) {
        int offset = ( pagination.getCurrentPage() - 1 ) * pagination.getLimit();
        RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());

        return sqlSession.selectList("volunteerMapper.getVolunteerListAll", model, rowBounds);
    }

    public VolunteerDetail getVolunteerDetail(int volunteerNo) {
        return sqlSession.selectOne("volunteerMapper.getVolunteerDetail", volunteerNo);
    }

    public int getVolunteerListCount(int category) {
        return sqlSession.selectOne("volunteerMapper.volunteerListCount", category);
    }

    public int getVolunteerListCount() {
        return sqlSession.selectOne("volunteerMapper.volunteerListCount");
    }

    public int getStoryListCount() {
        return sqlSession.selectOne("volunteerMapper.getStoryListCount");
    }

    public List<VolunteerStory> getStoryList(Pagination pagination, Model model) {
        int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();
        RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());

        return sqlSession.selectList("volunteerMapper.getStoryList", model, rowBounds);
    }

    public VolunteerStory selectVolunteerStory(int volunteerStoryNo) {
        return sqlSession.selectOne("volunteerMapper.selectVolunteerStory", volunteerStoryNo);
    }

    public int updateViewCount(int volunteerStoryNo) {
        return sqlSession.update("volunteerMapper.updateViewCount", volunteerStoryNo);
    }

    public List<Favorite> getFavoriteList(int memberNo) {
        return sqlSession.selectList("volunteerMapper.getFavoriteList", memberNo);
    }

    public int insertVolunteer(VolunteerDetail detail) {
        int result = sqlSession.insert("volunteerMapper.insertVolunteer", detail);

        if(result > 0) {
            result = detail.getVolunteerNo();
        }

        return result;
    }

    public int updateVolunteer(VolunteerDetail detail) {
        return sqlSession.update("volunteerMapper.updateVolunteer", detail);
    }

    public int insertStory(VolunteerStory story) {
        int result = sqlSession.insert("volunteerMapper.insertStory", story);

        if (result > 0) {
            result = story.getVolunteerStoryNo();
        }

        return result;
    }

    public int updateStory(VolunteerStory story) {
        return sqlSession.update("volunteerMapper.updateStory", story);
    }

    public void storyDelete(int storyNo) {
        sqlSession.delete("volunteerMapper.storyDelete", storyNo);
    }
  
	public int insertVolunteer(int volunteerNo, int memberNo) {
		Map<String, Integer> params = new HashMap<>();
		params.put("volunteerNo", volunteerNo);
		params.put("memberNo", memberNo);
		return sqlSession.insert("volunteerMapper.insertvolunteer",params);
	}

	public int selectVolunteer(int volunteerNo, int memberNo) {
		Map<String, Integer> params = new HashMap<>();
		params.put("volunteerNo", volunteerNo);
		params.put("memberNo", memberNo);
		return sqlSession.selectOne("volunteerMapper.selectvolunteer",params);
	}
	
	
	// 댓글 등록
	public int insertReply(Reply reply) {		
		return sqlSession.insert("volunteerMapper.insertReply", reply);
	}

	public Reply getReply(String replyContent) {
		
		return sqlSession.selectOne("volunteerMapper.getReply", replyContent);
	}

	// 댓글 조회
	public List<Reply> selectReplyList(int volunteerNo) {
		return sqlSession.selectList("volunteerMapper.selectReplyList", volunteerNo);
	}

	public List<Volunteer> selectVolunteer() {
		return sqlSession.selectList("volunteerMapper.selectmVolunteerList");
	}

	public VolunteerDetail getVolunteerDetail2(int volunteerNo2) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("volunteerMapper.getVolunteerDetail2", volunteerNo2);
	}

	public void updateVolunteerCount(int volunteerNo, int memberNo) {
		Map<String, Integer> params = new HashMap<>();
		params.put("volunteerNo", volunteerNo);
		params.put("memberNo", memberNo);
		sqlSession.update("volunteerMapper.updateVolunteerCount", params);
		
	}

	public int getCount() {
		return sqlSession.selectOne("volunteerMapper.getVolCount");
	}
}
