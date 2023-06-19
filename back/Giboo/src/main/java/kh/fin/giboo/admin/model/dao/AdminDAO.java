package kh.fin.giboo.admin.model.dao;

import kh.fin.giboo.admin.model.vo.Category;
import kh.fin.giboo.admin.model.vo.ParentCategory;
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

import java.util.List;

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
}
