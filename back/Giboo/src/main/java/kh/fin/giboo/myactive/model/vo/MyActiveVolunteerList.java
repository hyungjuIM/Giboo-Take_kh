package kh.fin.giboo.myactive.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor


public class MyActiveVolunteerList {

	
	//봉사 목록
	private int volunteerNo;
	private String volunteerTitle;
	private String startProgressDate;
	private String volunteerAddr;
	private String enrollDate;
	
	
}
