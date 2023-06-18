package kh.fin.giboo.mypage.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor


public class MyActiveEventList {

	
	//이벤트목록
	private int myactiveEventNo;
	private String myactiveDate;
	private String volunteerCompleteStatus;

	private int volunteerNo;
	private int managerNo;
	
	private String eventTitle;
	private String enrollDate;
	private String endRecruitDate;
	
}
