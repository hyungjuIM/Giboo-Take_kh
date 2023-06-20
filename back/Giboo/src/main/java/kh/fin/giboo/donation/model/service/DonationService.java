package kh.fin.giboo.donation.model.service;

import kh.fin.giboo.admin.model.vo.ParentCategory;
import kh.fin.giboo.donation.model.vo.Donation;

import java.util.List;

public interface DonationService {

    List<Donation> selectDonationList();

    List<ParentCategory> selectParentCategoryList();

    List<Donation> selectCategoryDonationList(int category);
}
