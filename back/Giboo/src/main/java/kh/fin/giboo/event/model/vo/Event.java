package kh.fin.giboo.event.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Event {
    private int eventNo;
    private String eventTitle;
    private String eventContent;
    private String eventCertificationContent;
    private int targetPeople;
    private String enrollDate;
    private String endRecruitDate;
    private String modiStatus;
    private String attachment;
    private String mgrId;
}
