package kh.fin.giboo.event.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class EventDetail {
	private int eventNo;
	private String eventTitle;
	private Date enrollDate;// 등록일
	private Date endRecruitDate;// 마감일
	private int targetPeople;
	private String eventContent;
	private String eventCertificationContent;
	private String eventAttachment;
	private int managerNo;
	
}
