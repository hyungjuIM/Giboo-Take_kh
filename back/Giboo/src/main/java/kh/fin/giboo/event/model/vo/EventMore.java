package kh.fin.giboo.event.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
// 진행중인 이벤트 더보기
public class EventMore {
	private int eventNo; // 이벤트no
	private String attachment; // 첨부파일
	private String eventTitle; // 이벤트 제목
	private String enrollDate; // 등록일
	private String endRecruitDate; // 마감일
}
