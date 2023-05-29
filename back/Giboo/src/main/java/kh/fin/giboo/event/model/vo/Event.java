package kh.fin.giboo.event.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Event {
	
	private int eventNo;
	private String eventTitle;
	private String eventContent;
	private String enrollDt;
	private String modiDt;
	private int eventViews;
	private String deleteStatus;
	private String eventImg;
	private int mrgNo;
}
