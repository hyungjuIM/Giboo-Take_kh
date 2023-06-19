package kh.fin.giboo.donation.model.service;

import kh.fin.giboo.donation.model.vo.Donation;

import java.util.List;

public interface DonationService {

    List<Donation> selectDonationList();
}
