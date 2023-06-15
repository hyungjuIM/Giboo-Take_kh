package kh.fin.giboo.map.model.vo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
// 맵 리스트
public class MapList { 
	private int mapNo;
	private String volunteerAttachement; // 첨부파일
	private String parentCategoryName; // 중분류 카테고리 이름
	private int favariteNo; // 즐겨찾기 no
	private String agencyName; // 기관명
	private String volunteerAddr; // 봉사주소
	private int replyNo; // 댓글no
	private int volunteerCount; // 봉사참여인원
}
