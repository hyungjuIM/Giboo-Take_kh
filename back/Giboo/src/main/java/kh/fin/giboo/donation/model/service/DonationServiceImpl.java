package kh.fin.giboo.donation.model.service;

import kh.fin.giboo.admin.model.vo.ParentCategory;
import kh.fin.giboo.common.model.vo.Pagination;
import kh.fin.giboo.donation.model.dao.DonationDAO;
import kh.fin.giboo.donation.model.vo.Donation;
import kh.fin.giboo.donation.model.vo.DonationDetail;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.text.DecimalFormat;
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
        int donationListCount = 0;
        if (categoryValidate) {
            donationList = dao.getDonationList(pagination, model);
            donationListCount = dao.getDonationListCount(category);
        } else {
            donationList = dao.getDonationListAll(pagination, model);
            donationListCount = dao.getDonationListCount();
        }

        for (Donation d : donationList) {
            LocalDate currentDate = LocalDate.now();
            LocalDate dDay = LocalDate.of(d.getEndRecruitDate().getYear() + 1900, d.getEndRecruitDate().getMonth() + 1, d.getEndRecruitDate().getDate());
            long untilDay = ChronoUnit.DAYS.between(currentDate, dDay);
            d.setDDay(untilDay);

            int percent = (Integer.parseInt(d.getDonationAmount()) * 100) / Integer.parseInt(d.getTargetAmount());
            d.setPercent(percent);

            DecimalFormat df = new DecimalFormat("###,###");
            d.setDonationAmount(df.format(Integer.parseInt(d.getDonationAmount())));
            d.setTargetAmount(df.format(Integer.parseInt(d.getTargetAmount())));
        }

        Map<String, Object> map = new HashMap<String, Object>();
        map.put("pagination", pagination);
        map.put("parentCategoryList", parentCategoryList);
        map.put("donationList", donationList);
        map.put("donationListCount", donationListCount);

        return map;
    }

    @Override
    public DonationDetail getDonationDetail(int donationNo) {
        return dao.getDonationDetail(donationNo);
    }
}
