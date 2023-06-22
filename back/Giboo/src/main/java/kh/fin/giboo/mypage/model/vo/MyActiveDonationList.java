package kh.fin.giboo.mypage.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor


public class MyActiveDonationList {

	
	//기부 목록 
	private int myactiveDonationNo;
	
	private int ROWNUM_VAL; // 순번 값
	
	
	private String myactiveDate;
	private String volunteerCompleteStatus;
	private int donationMoney;
	
	private int donationNo;
	private int memberNo;
	private String enrollDate;
	private String donationTitle;	
	private int donationAmount;
	
	
}
