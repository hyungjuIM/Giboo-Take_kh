package kh.fin.giboo.donation.model.dao;

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
}
