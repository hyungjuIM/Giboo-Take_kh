package kh.fin.giboo.manager.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Manager {
    private int managerNo;
    private String managerName;
    private String managerEmail;
    private String managerId;
    private String managerPw;
    private String managerNickname;
    private String managerTel;
    private String managerProfileImage;
    private String managerPermission;
}
