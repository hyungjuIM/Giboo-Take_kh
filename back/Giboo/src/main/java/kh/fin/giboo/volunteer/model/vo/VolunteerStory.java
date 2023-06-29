package kh.fin.giboo.volunteer.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class VolunteerStory {
    private int volunteerStoryNo;
    private String volunteerStoryTitle;
    private String volunteerStoryContent;
    private String attachment;
    private String enrollDt;
    private int viewCount;
    private String deleteStatus;
    private String memberNick;
}
