package kh.fin.giboo.donation.model.service;

import kh.fin.giboo.admin.model.vo.ParentCategory;
import kh.fin.giboo.common.model.vo.Pagination;
import kh.fin.giboo.donation.model.dao.DonationDAO;
import kh.fin.giboo.donation.model.vo.Donation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class DonationServiceImpl implements DonationService {

    private Logger logger = LoggerFactory.getLogger(DonationServiceImpl.class);


    @Autowired
    private DonationDAO dao;

    @Override
    public Map<String, Object> selectDonationList(int category, int cp, Model model) {
        List<ParentCategory> parentCategoryList = dao.getParentCategoryList();
        boolean categoryValidate = false;
        int listCount = 0;

        for (ParentCategory pc : parentCategoryList) {
            if (pc.getParentCategoryNo() == category) {
                categoryValidate = true;
            }
        }

        if (categoryValidate) {
            listCount = dao.getListCount(category);
        } else {
            listCount = dao.getListCount();
        }

        Pagination pagination = new Pagination(cp, listCount);
        pagination.setLimit(6);

        List<Donation> donationList =  null;
        if (categoryValidate) {
            donationList = dao.getDonationList(pagination, category, model);
        } else {
            donationList = dao.getDonationList(pagination, model);
        }

        for (Donation d : donationList) {
            LocalDate currentDate = LocalDate.now();
            LocalDate dDay = LocalDate.of(d.getEndRecruitDate().getYear() + 1900, d.getEndRecruitDate().getMonth() + 1, d.getEndRecruitDate().getDate());
            long untilDay = ChronoUnit.DAYS.between(currentDate, dDay);
            d.setDDay(untilDay);

            int percent = (d.getDonationAmount() * 100) / d.getTargetAmount();
            d.setPercent(percent);
        }

        Map<String, Object> map = new HashMap<String, Object>();
        map.put("pagination", pagination);
        map.put("parentCategoryList", parentCategoryList);
        map.put("donationList", donationList);

        return map;
    }
}
