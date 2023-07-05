package kh.fin.giboo.donation.model.service;

import kh.fin.giboo.admin.model.vo.ParentCategory;
import kh.fin.giboo.donation.model.vo.DonationDetail;
import kh.fin.giboo.donation.model.vo.DonationStory;
import kh.fin.giboo.mypage.model.vo.Favorite;

import org.springframework.ui.Model;

import java.util.List;
import java.util.Map;

public interface DonationService {

    Map<String, Object> selectDonationList(int category, int cp, Model model);

    DonationDetail getDonationDetail(int donationNo);

    int sync(Map<String, Object> map);

    Map<String, Object> getStoryList(int cp, Model model);

    DonationStory selectDonationStory(int donationStoryNo);

    int updateViewCount(int donationStoryNo);

    int updateAmount(Map<String, Object> map);

    List<Favorite> getFavoriteList(int memberNo);
  
    int insertStory(DonationStory story);

    int updateStory(DonationStory story);

    int insertDonation(DonationDetail detail);

    int updateDonation(DonationDetail detail);

    void storyDelete(int storyNo);

    List<ParentCategory> getParentCategoryList();
}
