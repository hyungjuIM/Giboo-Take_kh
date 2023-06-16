package kh.fin.giboo.myactive.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor


public class MyActiveEventList {

	
	//이벤트목록
	private int eventNo;
	private String eventTitle;
	private String enrollDate;
	private String endRecruitDate;
	
}
