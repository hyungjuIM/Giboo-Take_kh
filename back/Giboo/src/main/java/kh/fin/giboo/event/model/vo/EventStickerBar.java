package kh.fin.giboo.event.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
// 이벤트 스티커 바
public class EventStickerBar {
	private String eventCertificationAttachment; // 첨부파일
	private String eventTitle; // 이벤트 제목
	private int eventNo;
}
