package kh.fin.giboo.map.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
// 맵 디테일 리뷰(봉사자 리뷰(댓글))
public class MapDetailReviewReply {
	private int replyNo; // 댓글no
	private String profileImg; // 프로필 이미지
	private String memberNick; // 사용자 별명
	private String replyContent; // 댓글 내용
	private String enrollDate; // 댓글 작성일
	
}
