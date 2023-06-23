package kh.fin.giboo.rate.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor


public class rate {
	//나의 등급
	private int rateNo;
	private String rateName;
	private String renewalDate;
	private String donationRate;
	private String volunteerRate;
	private int memberNo;
}
