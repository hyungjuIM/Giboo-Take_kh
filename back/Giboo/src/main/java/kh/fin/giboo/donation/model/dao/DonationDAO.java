package kh.fin.giboo.donation.model.dao;

import kh.fin.giboo.admin.model.vo.ParentCategory;
import kh.fin.giboo.donation.model.vo.Donation;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class DonationDAO {

    @Autowired
    private SqlSessionTemplate sqlSession;

    private Logger logger = LoggerFactory.getLogger(DonationDAO.class);

    public List<Donation> selectDonationList() {
        return sqlSession.selectList("donationMapper.selectDonationList");
    }

    public List<ParentCategory> selectParentCategoryList() {
        return sqlSession.selectList("donationMapper.selectParentCategoryList");
    }

    public List<Donation> selectCategoryDonationList(int category) {
        return sqlSession.selectList("donationMapper.selectCategoryDonationList", category);
    }
}
