package kh.fin.giboo.map.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
// 맵 디테일 리뷰(봉사 소식(봉사이야기))
public class MapDetailReviewStory {
	private int reviewNo; // 리뷰no
	private String agencyAttachment;
	private String agencyName; // 기관명
	private String enrollDate; // 댓글 작성일
	private String enrollDay; // 댓글 작성일
	private String reviewTitle; // 리뷰 제목
	private String reviewContent; // 리뷰 내용
	private String reviewAttachement; // 첨부파일
}
