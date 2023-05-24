package kh.fin.giboo.volunteer.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Volunteer {
    private int volunteerNo;
    private String volunteerName;
    private String volunteerTel;
    private String vHeadName;
    private String volunteerPeriod;
    private String volunteerPlace;
    private String volunteerEnrollDate;
    private String volunteerDeleteStatus;
    private String volunteerCompleteStatus;
    private String volunteerModiDate;
    private int volunteerCount;
    private int volunteerView;
    private String volunteerTitle;
    private String volunteerContent;
    private String volunteerAttachement;
}
