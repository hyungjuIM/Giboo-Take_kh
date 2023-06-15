package kh.fin.giboo.map.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
// 맵 마커 팝업(마커눌렀을 때 팝업안에 있는 리스트)
public class MapPopup {
	private String volunteerAttachement; // 첨부파일
	private String agencyName; // 기관명
	private String parentCategoryName; // 중분류 카테고리 이름
	private String volunteerAddr; // 봉사주소
	private int replyNo; // 댓글no
	private int volunteerCount; // 봉사참여인원

}
