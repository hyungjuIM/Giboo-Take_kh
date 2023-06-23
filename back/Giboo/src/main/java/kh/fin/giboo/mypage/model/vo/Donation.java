package kh.fin.giboo.mypage.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor


public class Donation {

	
	//기부
	private int donationNo;
	private int targetAmount;
	private String locationX;
	private String locationY;
	private String donationAddr;
	private String enrollDate;
	private String startRecruitDate;
	private String endRecruitDate;
	private String startProgressDate;
	private String endProgressDate;
	private String deleteStatus;
	private String dcomStatus;
	private int donationAmount;
	private int viewCount;
	private String donationTitle;
	private String donationContent;
	private int memberNo;
	private int parentCatogoryNo;
	private int agencyNo;	
}
