package kh.fin.giboo.donation.model.service;

import org.springframework.ui.Model;

import java.util.Map;

public interface DonationService {

    Map<String, Object> selectDonationList(int category, int cp, Model model);
}
