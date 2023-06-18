package kh.fin.giboo.admin.model.service;

import kh.fin.giboo.member.model.vo.Manager;
import kh.fin.giboo.member.model.vo.Member;

import java.util.List;

public interface AdminService {

    List<Member> selectMemberList();

    List<Manager> selectManagerList();
}
