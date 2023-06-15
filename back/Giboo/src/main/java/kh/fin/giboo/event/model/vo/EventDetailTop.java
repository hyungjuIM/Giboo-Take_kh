package kh.fin.giboo.event.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
// 이벤트 디테일(맨위)
public class EventDetailTop {
	private String attachment; // 첨부파일
	private String eventTitle; // 이벤트 제목
	private int eventPersonNo; // 이벤트 참여자 no(이벤트 참여 인원)
	private int targetPeople; // 목표인원
	private String profileImg; // 프로필 이미지
	private String memberNick; // 사용자 별명
}
