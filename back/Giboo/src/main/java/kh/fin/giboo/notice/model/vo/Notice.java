package kh.fin.giboo.notice.model.vo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Notice {
	private int noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private String enrollDt;
	private int viewCount;
	private String deleteStatus;
	
	private String mgrNickname;
	private int managerNo;
}
