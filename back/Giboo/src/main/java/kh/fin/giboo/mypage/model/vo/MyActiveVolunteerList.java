package kh.fin.giboo.mypage.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor


public class MyActiveVolunteerList {

	
	//봉사 목록
	private int myactiveVolunteerNo;
	
	private int ROWNUM_VAL; // 순번 값
	
	private String myactiveDate;
	private String volunteerCompleteStatus;	
	private int volunteerNo;
	private int memberNo;
		
	private String volunteerTitle;
	private String startProgressDate;
	private String volunteerAddr;
	private String enrollDate;
	
	
}
