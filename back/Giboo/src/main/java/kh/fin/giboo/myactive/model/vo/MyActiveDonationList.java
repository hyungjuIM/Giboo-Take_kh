package kh.fin.giboo.myactive.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor


public class MyActiveDonationList {

	
	//기부 목록 
	private int donationNo;
	private String donationTitle;
	private String enrollDate;
	private int donationAmount;
	
	
}
