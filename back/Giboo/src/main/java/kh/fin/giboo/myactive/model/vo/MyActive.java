package kh.fin.giboo.myactive.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor


public class MyActive {

	
	//나의 활동
	private int myactiveNo;
	private String volunteerCompleteStatus;
	private int donationNo;
	private int volunteerNo;
	private int memberNo;
	private int eventNo;
	
}
