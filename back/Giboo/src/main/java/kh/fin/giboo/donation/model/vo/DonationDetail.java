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
    private String targetAmount;
    private int locationX;
    private int locationY;
    private String donationAddr;
    private String enrollDate;
    private Date startRecruitDate;
    private Date endRecruitDate;
    private Date startProgressDate;
    private Date endProgressDate;
    private String deleteStatus;
    private String dComStatus;
    private String donationAmount;
    private int viewCount;
    private String donationTitle;
    private String donationContent;
    private String donationAttachment;
    private int memberNo;
    private String memberId;
    private int parentCategoryNo;
    private String parentCategoryName;
    private String agencyName;
    private long dDay;
    private int percent;
    private int favCount;
}
