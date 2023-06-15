package kh.fin.giboo.event.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
// 이벤트 참여하기 팝업
public class EventPopup {
	private String attachment; // 첨부파일
	private String eventTitle; // 이벤트 제목

}
