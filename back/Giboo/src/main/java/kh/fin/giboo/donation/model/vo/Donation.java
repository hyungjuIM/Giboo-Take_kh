package kh.fin.giboo.donation.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Donation {
    private int donationNo;
    private String dAgencyName;
    private String dAgencyTel;
    private String dheadName;
    private String donationPeriod;
    private String donationPlace;
    private String donationEnrollDate;
    private String donationDeleteStatus;
    private String donationCompleteStatus;
    private int donationAmount;
    private String donationModiDate;
    private int donationCount;
    private int donationView;
    private String donationTitle;
    private String donationContent;
    private String donationAttachment;
}
