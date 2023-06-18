package kh.fin.giboo.mypage.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Rate {

	// 등급
			private int rateNo;
			private String rateName;
			private String renewalDate;
			private int memberNo;
			private int myactiveNo;

	
}


		
		