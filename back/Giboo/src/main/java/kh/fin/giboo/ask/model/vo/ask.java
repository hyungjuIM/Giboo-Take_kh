package kh.fin.giboo.ask.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class ask {

	//나의 문의내역
	private int askNo;
	private String askTitle;
	private String askContent;
	private String aenrollDate;
	private String amodiDate;
	private String aslStatus;
	private String askFile;
	private int memberNo;
}
