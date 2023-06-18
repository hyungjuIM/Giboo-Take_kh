package kh.fin.giboo.event.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class EventDetailLeft {
	private int eventNo; // 이벤트no
	private String eventContent;
//	private String eventCertificationAttachment;
}
