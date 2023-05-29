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
	private String alarmStatus;
	
	private int memberNo;
	private int donationNo;
	private int volunteerNo;
	private int reviewNo;
	private int usageNo;
	private int rateNo;
	private int eventNo;
	private int csNo;
	private int paymentNo;
	private int noticeNo;
	private int askNo;
	
	
}
