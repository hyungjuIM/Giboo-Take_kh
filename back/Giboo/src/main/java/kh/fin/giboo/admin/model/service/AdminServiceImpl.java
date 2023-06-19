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

}
