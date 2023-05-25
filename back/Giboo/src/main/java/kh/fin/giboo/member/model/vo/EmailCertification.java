package kh.fin.giboo.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class EmailCertification {
	private int memberNo;
	private String cNumber;
	private String emailIssueDT;
}
