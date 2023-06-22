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
	
	private int ROWNUM_VAL; // 순번 값
	
	
	private String myactiveDate;
	private String volunteerCompleteStatus;

	private int volunteerNo;
	private int managerNo;
	
	private String eventTitle;
	private String eventNo;
	private String enrollDate;
	private String endRecruitDate;
	private int memberNo;
	
}
