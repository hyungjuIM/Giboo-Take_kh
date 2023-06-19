package kh.fin.giboo.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Manager {
    private int mgrNo;
    private String mgrId;
    private String memberId;
    private String mgrPw;
    private String mgrEmail;
    private String mgrName;
    private String mgrNickname;
    private String mgrTel;
    private String mgrPermission;
    private String mgrProfileImg;
    private String mgrSignUpStatus;
    private String mgrSignUpReason;
}
