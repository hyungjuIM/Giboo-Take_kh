package kh.fin.giboo.map.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
// 맵 디테일(마커눌렀을 때 나오는 팝업 눌렀을 때 상세페이지(맨위))
public class MapDetailTop {
	private int volunteerNo;
	 private String volunteerAttachement; // 봉사주소
	 private String agencyName; // 봉사주소	
	private String parentCategoryName; // 중분류 카테고리 이름
	private int volunteerFavCount;
	private int replyCount;
	private int volunteerCount; // 봉사참여인원	
}
