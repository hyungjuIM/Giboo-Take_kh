package kh.fin.giboo.admin.model.dao;

import kh.fin.giboo.member.model.vo.Member;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class AdminDAO {

    @Autowired
    private SqlSessionTemplate sqlSession;

    private Logger logger = LoggerFactory.getLogger(AdminDAO.class);

    public List<Member> selectMemberList() {
        return sqlSession.selectList("adminMapper.selectMemberList");
    }
}
