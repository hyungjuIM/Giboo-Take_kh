package kh.fin.giboo.admin.model.service;

import kh.fin.giboo.admin.model.vo.Category;
import kh.fin.giboo.admin.model.vo.ParentCategory;
import kh.fin.giboo.cs.model.vo.Faq;
import kh.fin.giboo.donation.model.vo.Donation;
import kh.fin.giboo.event.model.vo.Event;
import kh.fin.giboo.member.model.vo.Manager;
import kh.fin.giboo.member.model.vo.Member;
import kh.fin.giboo.volunteer.model.vo.Volunteer;

import java.util.List;

public interface AdminService {

    List<Member> selectMemberList();

    List<Manager> selectManagerList();

    List<Volunteer> selectVolunteerList();

    List<Donation> selectDonationList();

    List<Event> selectEventList();

    List<Category> selectCategoryList();

    List<ParentCategory> selectParentCategoryList();

    List<Faq> selectFaqList();

	  List<Member> selectmemberRateList();

	  int updateMemberRatesByRate(String rateName, int pointPrice);

	//int updateMemberRates(List<String> rateName, List<String> pointPrice);

    int removeCategory(int id);

    int removeParentCategory(int id);

    int removeFaq(int id);
}
