package kh.fin.giboo.mypage.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class MyReview {

	//리뷰 목록
	
	private int reviewNo;
	private String donationTitle;
	private String volunteerTitle;
	private String reviewContent;
	private String enrollDate;
	
	private String title;
		
	private String memberNo;
	private String donationNo;
	private String volunteerNo;
	private String secessionFl;
	
	
	
}
