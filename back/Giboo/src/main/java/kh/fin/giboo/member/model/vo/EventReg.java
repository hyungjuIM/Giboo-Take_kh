package kh.fin.giboo.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class EventReg {
	private int eventRegNo;
	private int memberNo;
	private int eventNo;
}
