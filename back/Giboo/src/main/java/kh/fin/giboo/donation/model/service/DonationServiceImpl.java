package kh.fin.giboo.donation.model.service;

import kh.fin.giboo.admin.model.vo.ParentCategory;
import kh.fin.giboo.donation.model.dao.DonationDAO;
import kh.fin.giboo.donation.model.vo.Donation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DonationServiceImpl implements DonationService {

    private Logger logger = LoggerFactory.getLogger(DonationServiceImpl.class);


    @Autowired
    private DonationDAO dao;

    @Override
    public List<Donation> selectDonationList() {
        return dao.selectDonationList();
    }

    @Override
    public List<ParentCategory> selectParentCategoryList() {
        return dao.selectParentCategoryList();
    }

    @Override
    public List<Donation> selectCategoryDonationList(int category) {
        return dao.selectCategoryDonationList(category);
    }
}
