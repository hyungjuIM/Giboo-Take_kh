package kh.fin.giboo.volunteer.model.dao;

import kh.fin.giboo.admin.model.vo.ParentCategory;
import kh.fin.giboo.common.model.vo.Pagination;
import kh.fin.giboo.donation.model.vo.Donation;
import kh.fin.giboo.volunteer.model.vo.Volunteer;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import java.util.List;

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
}
