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
	private String replyContent;
	private int memberNo;
	private Date enrollDate;
	private String secessionFl;
	private int donationNo;
	private int volunteerNo;
	
}
