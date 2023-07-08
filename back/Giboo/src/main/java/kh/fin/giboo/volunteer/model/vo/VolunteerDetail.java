package kh.fin.giboo.volunteer.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class VolunteerDetail {
    private int volunteerNo;
    private int targetPeople;
    private int locationX;
    private int locationY;
    private String volunteerAddr;
    private String volunteerTime;
    private Date enrollDate;
    private Date startRecruitDate;
    private Date endRecruitDate;
    private Date startProgressDate;
    private Date endProgressDate;
    private String volunteerDeleteStatus;
    private String volunteerCompleteStatus;
    private int volunteerCount;
    private int viewCount;
    private String volunteerTitle;
    private String volunteerContent;
    private String volunteerAttachment;
    private int memberNo;
    private String memberId;
    private int parentCategoryNo;
    private String parentCategoryName;
    private String agencyName;
    private long dDay;
    private int percent;
    private int favCount;
}
