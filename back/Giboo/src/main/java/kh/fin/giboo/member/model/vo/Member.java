package kh.fin.giboo.member.model.vo;

import java.util.List;

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
	private String memberEmail;
	private String memberName;
	private String memberNick;
	private int memberTel;
	private String memberAddr;
	private String enrollDt;
	private String secessionFlag;
	private String profileImg;
	private String memberType;
	private int rateNo;
	private int pointNo;
	private String rateName;
	private int pointPrice;
	private String email;
	private String nickname;
	private String kakao;
	
	
	
}
