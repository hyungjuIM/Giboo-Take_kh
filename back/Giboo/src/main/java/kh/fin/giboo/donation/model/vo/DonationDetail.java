package kh.fin.giboo.donation.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DonationDetail {
    private int donationNo;
    private int targetAmount;
    private int locationX;
    private int locationY;
    private String donationAddr;
    private String enrollDate;
    private String startRecruitDate;
    private Date endRecruitDate;
    private String startProgressDate;
    private String endProgressDate;
    private String deleteStatus;
    private String dComStatus;
    private int donationAmount;
    private int viewCount;
    private String donationTitle;
    private String donationContent;
    private String donationAttachment;
    private String memberId;
    private String parentCategoryName;
    private String agencyName;
    private long dDay;
    private int percent;
}
