package kh.fin.giboo.admin.model.service;

import kh.fin.giboo.admin.model.dao.AdminDAO;
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

        List<Member> memberList = dao.selectMemberList();
        return null;
    }
}
