package kh.fin.giboo.alarm.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Alarm {
	private int alarmNo;
	private String alarmContent;
	private String alarmDate;
	private String readStatus;
	
	private int memberNo;
	private int volunteerNo;
	private int donationNo;
	private int reviewNo;
	private int pointNo;
	private int eventNo;
	private int noticeNo;
	private int askNo;	
	private String agencyName;
}
