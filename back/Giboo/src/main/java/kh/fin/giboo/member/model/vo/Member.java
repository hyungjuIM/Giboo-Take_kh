package kh.fin.giboo.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Member {
	private int memberNo;
	private String memberId;
	private String memberPw;
	private String memberName;
	private String memberNick;
	private int memberTel;
	private String memberAddr;
	private String signupType;
	private String memberEnrollDT;
	private String memberSecessionFlag;
	private String profileImg;
	private String daType;
	private int savedMoney;
}
