package kh.fin.giboo.event.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
// 이벤트 디테일(이벤트 소개)
public class EventDetailContent {
	private String eventContent; // 이벤트 내용
	private String eventCertiContent; // 이벤트 인증방법 소개 내용
}
