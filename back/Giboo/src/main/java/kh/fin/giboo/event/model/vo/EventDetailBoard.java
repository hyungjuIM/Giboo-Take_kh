package kh.fin.giboo.event.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
// 이벤트 디테일(참여보드)
public class EventDetailBoard {
	private int eventPersonNo; // 이벤트 참여자 no(이벤트 참여 인원)
	private String eventCertificationAttachment; // 첨부파일
	private String memberNick; // 사용자 별명
	private String eventCertiEnrollDate; // 이벤트 인증 등록일
}
