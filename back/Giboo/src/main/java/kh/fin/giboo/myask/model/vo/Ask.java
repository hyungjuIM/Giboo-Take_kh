package kh.fin.giboo.myask.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class Ask {

	// 문의내역
	private int askNo;
	private String askTitle;
	private String askContent;
	private String enrollDate;
	private String askStatus;
	private String askAttachment;
	private int memberNo;
}

