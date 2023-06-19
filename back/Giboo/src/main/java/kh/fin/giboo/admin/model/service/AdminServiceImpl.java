package kh.fin.giboo.admin.model.service;

import kh.fin.giboo.admin.model.dao.AdminDAO;
import kh.fin.giboo.member.model.vo.Manager;
import kh.fin.giboo.member.model.vo.Member;
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
    public List<Object> selectVolunteerDonationList() {
        return dao.selectVolunteerDonationList();
    }
}
