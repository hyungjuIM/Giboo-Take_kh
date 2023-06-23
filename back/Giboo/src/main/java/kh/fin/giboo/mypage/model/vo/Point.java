package kh.fin.giboo.mypage.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Point {
		
		// 포인트
		private int pointNo;

		private String pointContent;
		private int memberNo;
		private int rateNo;
		private int pointPrice;
		private int eventNo;
}
