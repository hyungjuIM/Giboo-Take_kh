package kh.fin.giboo.volunteer.model.dao;

import kh.fin.giboo.admin.model.vo.ParentCategory;
import kh.fin.giboo.volunteer.model.vo.Volunteer;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class VolunteerDAO {

    @Autowired
    private SqlSessionTemplate sqlSession;

    private Logger logger = LoggerFactory.getLogger(VolunteerDAO.class);

    public List<Volunteer> selectVolunteerList() {
        return sqlSession.selectList("volunteerMapper.selectVolunteerList");
    }

    public List<ParentCategory> selectParentCategoryList() {
        return sqlSession.selectList("volunteerMapper.selectParentCategoryList");
    }

    public List<Volunteer> selectCategoryVolunteerList(int category) {
        return sqlSession.selectList("volunteerMapper.selectCategoryVolunteerList", category);
    }
}
