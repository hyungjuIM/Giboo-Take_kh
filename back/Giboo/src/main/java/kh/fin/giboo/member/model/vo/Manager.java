package kh.fin.giboo.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Manager {
    private int managerNo;
    private String managerId;
    private String managerEmail;
    private String managerName;
    private String managerNick;
    private String managerTel;
    private String managerPermission;
    private String managerProfileImg;
    private String managerSignUpStatus;
    private String managerSignUpReason;
}
