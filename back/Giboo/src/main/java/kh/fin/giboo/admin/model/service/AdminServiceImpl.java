package kh.fin.giboo.admin.model.service;

import kh.fin.giboo.admin.model.dao.AdminDAO;
import kh.fin.giboo.admin.model.vo.Category;
import kh.fin.giboo.admin.model.vo.ParentCategory;
import kh.fin.giboo.cs.model.vo.Faq;
import kh.fin.giboo.donation.model.vo.Donation;
import kh.fin.giboo.event.model.vo.Event;
import kh.fin.giboo.member.model.vo.Manager;
import kh.fin.giboo.member.model.vo.Member;
import kh.fin.giboo.volunteer.model.vo.Volunteer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {

    private Logger logger = LoggerFactory.getLogger(AdminServiceImpl.class);

    @Autowired
    private AdminDAO dao;

    @Override
    public List<Member> selectMemberList() {

        return dao.selectMemberList();
    }

    @Override
    public List<Manager> selectManagerList() {
        return dao.selectManagerList();
    }

    @Override
    public List<Volunteer> selectVolunteerList() {
        return dao.selectVolunteerList();
    }

    @Override
    public List<Donation> selectDonationList() {
        return dao.selectDonationList();
    }

    @Override
    public List<Event> selectEventList() {
        return dao.selectEventList();
    }

    @Override
    public List<Category> selectCategoryList() {
        return dao.selectCategoryList();
    }

    @Override
    public List<ParentCategory> selectParentCategoryList() {
        return dao.selectParentCategoryList();
    }

    @Override
    public List<Faq> selectFaqList() {
        return dao.selectFaqList();
    }

	@Override
	public List<Member> selectmemberRateList() {
//		Rate rate = new Rate();
//		Point pointTb = new Point();
//		int pointNo = pointTb.getMemberNo();
//		String rateName = rate.getRateName();
//		int minPoint =dao.getMinPoint(rateName);
//		int maxPoint =dao.getMaxPoint(rateName);
//		int pointPrice = dao.getPointPrice(pointNo);
//		int point= dao.getPointByRate(rateName);
//		int updatedMemberCount = 0;
//		 List<Member> members = selectmemberRateList();
//		 for (Member member : members) {
//		      int volunteerCount = dao.getVolunteerCount(member.getMemberNo());
//		      int donationCount = dao.getDonationCount(member.getMemberNo());
//		      
//		      if ((volunteerCount + donationCount) >= minPoint && (volunteerCount + donationCount) <= maxPoint) {
//		        member.setRateName(rateName);
//		        member.setPointPrice(pointPrice);
//
//		        member.setPointPrice(member.getPointPrice() + point);
//
//		         dao.updateMemberRate(member);
//		         updatedMemberCount++; // 회원 업데이트가 수행되었으므로 카운트를 증가
//		      }
//		    }
//		    return updatedMemberCount;// 업데이트된 회원 수를 반환
	
		return dao.selectmemberRateList();
	}

	@Override
	public int updateMemberRatesByRate(String rateName, int pointPrice) {
	    List<Member> members = dao.selectmemberRateList();
//	    Rate rate = new Rate();
	    
	    int minPoint = dao.getMinPoint(rateName);
	    int maxPoint = dao.getMaxPoint(rateName);
	    int updatedMemberCount = 0;

	    for (Member member : members) {
	        int volunteerCount = dao.getVolunteerCount(member.getMemberNo());
	        int donationCount = dao.getDonationCount(member.getMemberNo());

	        if ((volunteerCount + donationCount) >= minPoint && (volunteerCount + donationCount) <= maxPoint) {
	        	String rateName2 = dao.getRateName(minPoint,maxPoint);
	            member.setRateName(rateName2);
//	            member.setPointPrice(pointPrice);
	            int point = dao.getPointByRate(rateName);
	            member.setPointPrice(member.getPointPrice() + point);

	            dao.updateMemberRate(member);
	            updatedMemberCount++; // 회원 업데이트가 수행되었으므로 카운트를 증가
	        }
	    }

	    return updatedMemberCount;
	}
	


    @Override
    public int removeCategory(int id) {
        return dao.removeCategory(id);
    }

    @Override
    public int removeParentCategory(int id) {
        return dao.removeParentCategory(id);
    }

    @Override
    public int removeFaq(int id) {
        return dao.removeFaq(id);
    }

}
