//package kh.fin.giboo.admin.model.service;
//
//import kh.fin.giboo.admin.model.dao.AdminDAO;
//import kh.fin.giboo.admin.model.vo.Category;
//import kh.fin.giboo.admin.model.vo.ParentCategory;
//import kh.fin.giboo.admin.model.vo.Rate;
//import kh.fin.giboo.cs.model.vo.Faq;
//import kh.fin.giboo.donation.model.vo.Donation;
//import kh.fin.giboo.event.model.vo.Event;
//import kh.fin.giboo.member.model.vo.Manager;
//import kh.fin.giboo.member.model.vo.Member;
//import kh.fin.giboo.mypage.model.vo.Point;
//import kh.fin.giboo.volunteer.model.vo.Volunteer;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//
//import java.util.List;
//
//@Service
//public class AdminServiceImpl implements AdminService {
//
//    private Logger logger = LoggerFactory.getLogger(AdminServiceImpl.class);
//
//    @Autowired
//    private AdminDAO dao;
//
//    @Override
//    public List<Member> selectMemberList() {
//
//        return dao.selectMemberList();
//    }
//
//    @Override
//    public List<Manager> selectManagerList() {
//        return dao.selectManagerList();
//    }
//
//    @Override
//    public List<Volunteer> selectVolunteerList() {
//        return dao.selectVolunteerList();
//    }
//
//    @Override
//    public List<Donation> selectDonationList() {
//        return dao.selectDonationList();
//    }
//
//    @Override
//    public List<Event> selectEventList() {
//        return dao.selectEventList();
//    }
//
//    @Override
//    public List<Category> selectCategoryList() {
//        return dao.selectCategoryList();
//    }
//
//    @Override
//    public List<ParentCategory> selectParentCategoryList() {
//        return dao.selectParentCategoryList();
//    }
//
//    @Override
//    public List<Faq> selectFaqList() {
//        return dao.selectFaqList();
//    }
//
//	@Override
//	public List<Member> selectmemberRateList() {
//		return dao.selectmemberRateList();
//	}
//
//	@Override
//	public int memberRateUpdate(List<Member> updateMember) {
//	     int updatedCount = 0;
//	        for (Member member : updateMember) {
//	            int participationCount = dao.getParticipationCount(member.getMemberNo());
//	            Rate rate = calculateRate(participationCount);
//	            Rate rate2 = calculatePoint(participationCount);
//
//	            member.setRateName(rate.getRateName());
//	            member.setPointPrice(rate2.getPointPrice());
//
//	            dao.updateMemberRateAndPoint(member);
//	            updatedCount++;
//	        }
//	        return updatedCount;
//	    }
//
//	    private Rate calculateRate(int participationCount) {
//	        // 등급 계산 로직 구현
//	        // 예: 1에서 5까지는 "등급1", 6에서 10까지는 "등급2", 11 이상은 "등급3"
//	        if (participationCount >= 1 && participationCount <= 5) {
//	            return dao.getRateByRateNo(1); 
//	        } else if (participationCount >= 6 && participationCount <= 10) {
//	            return dao.getRateByRateNo(2);
//	        } else {
//	            return dao.getRateByRateNo(3);
//	        }
//	    }
//
//	    private Rate calculatePoint(int participationCount) {
//	        // 적립금 계산 로직 구현
//	        // 예: 1에서 5까지는 1000원, 6에서 10까지는 3000원, 11 이상은 5000원
//	        if (participationCount >= 1 && participationCount <= 5) {
//	            return dao.
//	        } else if (participationCount >= 6 && participationCount <= 10) {
//	            return 3000;
//	        } else {
//	            return 5000;
//	        }
//	    }
//
//}
