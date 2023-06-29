package kh.fin.giboo.donation.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DonationStory {
    private int donationStoryNo;
    private String donationStoryTitle;
    private String donationStoryContent;
    private String attachment;
    private String enrollDt;
    private int viewCount;
    private String deleteStatus;
    private int memberNo;
}
