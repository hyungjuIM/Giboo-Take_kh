package kh.fin.giboo.mypage.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Stamp {
	private int stampNo;
	private int eventNo;
	private String stampAttachment;
	private int memberNo;
//	private int stampCount;

}
