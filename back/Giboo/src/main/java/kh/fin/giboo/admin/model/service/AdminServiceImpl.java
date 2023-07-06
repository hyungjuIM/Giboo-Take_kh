package kh.fin.giboo.admin.model.service;

import kh.fin.giboo.admin.model.dao.AdminDAO;
import kh.fin.giboo.admin.model.vo.Category;
import kh.fin.giboo.admin.model.vo.ParentCategory;
import kh.fin.giboo.common.Util;
import kh.fin.giboo.cs.model.vo.Faq;
import kh.fin.giboo.donation.model.vo.Donation;
import kh.fin.giboo.event.model.vo.Event;
import kh.fin.giboo.event.model.vo.EventDetail;
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

		return dao.selectmemberRateList();
	}

	@Override
	public int updateMemberRatesByRate() {
	    List<Member> members = dao.selectmemberRateList();

	    int updatedMemberCount = 0;

	    for (Member member : members) {
	        int volunteerCount = dao.getVolunteerCount(member.getMemberNo());
	        int donationCount = dao.getDonationCount(member.getMemberNo());
	        System.out.println("회원의 봉사기부횟수 : " +(volunteerCount+donationCount));
	        String rateName2 = dao.getRateNameByCounts(volunteerCount, donationCount);
	        System.out.println("새로운 등급은 : "+rateName2);
	        if (rateName2 != null) {
	            member.setRateName(rateName2);
	            int point = dao.getPointByRate(rateName2);
	            member.setPointPrice(member.getPointPrice() + point);
	            System.out.println("적립금은 : "+ member.getPointPrice());
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

	@Override
	public EventDetail selectEventDetail(int eventNo) {
        return dao.selectEventDetail(eventNo);
	}

	
	@Override
	public int insertEvent(EventDetail eventDetail) {
		eventDetail.setEventTitle(Util.XSSHandling(eventDetail.getEventTitle()));
		eventDetail.setEventContent(Util.XSSHandling(eventDetail.getEventContent()));
		eventDetail.setEventContent(Util.newLineHandling(eventDetail.getEventContent()));
//		eventDetail.setEventCertificationContent(Util.XSSHandling(eventDetail.getEventCertificationContent()));
//		eventDetail.setEventCertificationContent(Util.newLineHandling(eventDetail.getEventCertificationContent()));

        return dao.insertEvent(eventDetail);
	}

	@Override
	public int updateEvent(EventDetail eventDetail) {
		eventDetail.setEventTitle(Util.XSSHandling(eventDetail.getEventTitle()));
		eventDetail.setEventContent(Util.XSSHandling(eventDetail.getEventContent()));
		eventDetail.setEventContent(Util.newLineHandling(eventDetail.getEventContent()));
//		eventDetail.setEventCertificationContent(Util.XSSHandling(eventDetail.getEventCertificationContent()));
//		eventDetail.setEventCertificationContent(Util.newLineHandling(eventDetail.getEventCertificationContent()));

        return dao.updateEvent(eventDetail);
	}

}
