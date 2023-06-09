package kh.fin.giboo.event.model.vo;

import kh.fin.giboo.map.model.vo.MapDetailHome;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
// 이벤트 리스트
public class EventList {
	private int eventNo; // 이벤트no
	private String result;
	private String attachment; // 첨부파일
	private String eventTitle; // 이벤트 제목
	private String enrollDate; // 등록일
	private String endRecruitDate; // 마감일
	private int eventPersonCount; // 
	private int targetPeople; // 
	
}
