package kh.fin.giboo.event.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
// 이벤트 참여하기 팝업
public class EventPopup {
	private String eventCertificationAttachment; // 첨부파일
	private int memberNo;
	private int eventNo;
	private int eventPersonNo;
	private int stampNo;	
}
