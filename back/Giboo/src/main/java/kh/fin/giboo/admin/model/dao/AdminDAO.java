package kh.fin.giboo.admin.model.dao;

import kh.fin.giboo.admin.model.vo.Category;
import kh.fin.giboo.admin.model.vo.ParentCategory;
import kh.fin.giboo.admin.model.vo.Rate;
import kh.fin.giboo.cs.model.vo.Faq;
import kh.fin.giboo.donation.model.vo.Donation;
import kh.fin.giboo.event.model.vo.Event;
import kh.fin.giboo.member.model.vo.Manager;
import kh.fin.giboo.member.model.vo.Member;
import kh.fin.giboo.volunteer.model.vo.Volunteer;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class AdminDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	private Logger logger = LoggerFactory.getLogger(AdminDAO.class);

	public List<Member> selectMemberList() {
		return sqlSession.selectList("adminMapper.selectMemberList");
	}

	public List<Manager> selectManagerList() {
		return sqlSession.selectList("adminMapper.selectManagerList");
	}

	public List<Volunteer> selectVolunteerList() {
		return sqlSession.selectList("adminMapper.selectVolunteerList");
	}

	public List<Donation> selectDonationList() {
		return sqlSession.selectList("adminMapper.selectDonationList");
	}

	public List<Event> selectEventList() {
		return sqlSession.selectList("adminMapper.selectEventList");
	}

	public List<Category> selectCategoryList() {
		return sqlSession.selectList("adminMapper.selectCategoryList");
	}

	public List<ParentCategory> selectParentCategoryList() {
		return sqlSession.selectList("adminMapper.selectParentCategoryList");
	}

	public List<Faq> selectFaqList() {
		return sqlSession.selectList("adminMapper.selectFaqList");
	}

	public List<Member> selectmemberRateList() {
		return sqlSession.selectList("adminMapper.selectmemberRateList");
	}


	// 봉사기부 참여횟수 조회
	public int getVolunteerCount(int memberNo) {
		return sqlSession.selectOne("adminMapper.getVolunteerCount", memberNo);
	}

	// 봉사기부 참여횟수 조회
	public int getDonationCount(int memberNo) {
		return sqlSession.selectOne("adminMapper.getDonationCount", memberNo);
	}

	// 등급별 적립금혜택 조회
	public int getPointByRate(String rateName2) {
		return sqlSession.selectOne("adminMapper.getPointByRate", rateName2);
	}

	// 등급name얻어오기
	public String getRateNameByCounts(int volunteerCount, int donationCount) {
		Map<String, Integer> params = new HashMap<>();
		params.put("volunteerCount", volunteerCount);
		params.put("donationCount", donationCount);
		return sqlSession.selectOne("adminMapper.getRateNameByCounts", params);
	}
	// 등급 업데이트
	public void updateMemberRate(Member member) {
		 sqlSession.update("adminMapper.updateMemberRate", member);
	}

  public int removeCategory(Map<String, String> map) {
        return sqlSession.delete("adminMapper.removeCategory", map);
  }

}
