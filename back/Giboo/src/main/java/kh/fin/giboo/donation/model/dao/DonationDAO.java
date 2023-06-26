package kh.fin.giboo.donation.model.dao;

import kh.fin.giboo.admin.model.vo.ParentCategory;
import kh.fin.giboo.common.model.vo.Pagination;
import kh.fin.giboo.donation.model.vo.Donation;
import kh.fin.giboo.donation.model.vo.DonationDetail;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import java.util.List;

@Repository
public class DonationDAO {

    @Autowired
    private SqlSessionTemplate sqlSession;

    private Logger logger = LoggerFactory.getLogger(DonationDAO.class);

    public List<ParentCategory> getParentCategoryList() {
        return sqlSession.selectList("donationMapper.getParentCategoryList");
    }

    public int getListCount(int category) {
        return sqlSession.selectOne("donationMapper.getListCount", category);
    }

    public int getListCount() {
        return sqlSession.selectOne("donationMapper.getListCount");
    }

    public List<Donation> getDonationList(Pagination pagination, Model model) {
        int offset = ( pagination.getCurrentPage() - 1 ) * pagination.getLimit();
        RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());

        return sqlSession.selectList("donationMapper.getDonationList", model, rowBounds);
    }

    public List<Donation> getDonationListAll(Pagination pagination, Model model) {
        int offset = ( pagination.getCurrentPage() - 1 ) * pagination.getLimit();
        RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());

        return sqlSession.selectList("donationMapper.getDonationListAll", model, rowBounds);
    }

    public DonationDetail getDonationDetail(int donationNo) {
        return sqlSession.selectOne("donationMapper.getDonationDetail", donationNo);
    }

    public int getDonationListCount(int category) {
        return sqlSession.selectOne("donationMapper.getDonationListCount", category);
    }

    public int getDonationListCount() {
        return sqlSession.selectOne("donationMapper.getDonationListCount");
    }
}
