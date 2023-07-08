package kh.fin.giboo.volunteer.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Reply {
	private int replyNo;
	private String profileImg;
	private String memberNick;
	private String replyContent;
//	private String secessionFl;
	private int donationNo;
	private int memberNo;
	private int volunteerNo;
	private String volunteerTitle;
	private String enrollDate; // 댓글 작성일
	private String enrollDay; // 댓글 작성일
	
}
