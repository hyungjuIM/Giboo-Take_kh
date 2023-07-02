package kh.fin.giboo.donation.model.dao;

import kh.fin.giboo.admin.model.vo.ParentCategory;
import kh.fin.giboo.common.model.vo.Pagination;
import kh.fin.giboo.donation.model.vo.Donation;
import kh.fin.giboo.donation.model.vo.DonationDetail;
import kh.fin.giboo.donation.model.vo.DonationStory;
import kh.fin.giboo.mypage.model.vo.Favorite;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import java.util.List;
import java.util.Map;

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

    public int sync(Map<String, Object> map) {
        return sqlSession.insert("donationMapper.sync", map);
    }

    public int getStoryListCount() {
        return sqlSession.selectOne("donationMapper.getStoryListCount");
    }

    public List<DonationStory> getStoryList(Pagination pagination, Model model) {
        int offset = (pagination.getCurrentPage() -1) * pagination.getLimit();
        RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());

        return sqlSession.selectList("donationMapper.getStoryList", model, rowBounds);
    }

    public DonationStory selectDonationStory(int donationStoryNo) {
        return sqlSession.selectOne("donationMapper.selectDonationStory", donationStoryNo);
    }

    public int updateViewCount(int donationStoryNo) {
        return sqlSession.update("donationMapper.updateViewCount", donationStoryNo);
    }

    public int updateAmount(Map<String, Object> map) {
        return sqlSession.update("donationMapper.updateAmount", map);
    }

	public List<Favorite> getFavoriteList(int memberNo) {
		
		return sqlSession.selectList("volunteerMapper.getFavoriteList", memberNo);
	}

	
}
