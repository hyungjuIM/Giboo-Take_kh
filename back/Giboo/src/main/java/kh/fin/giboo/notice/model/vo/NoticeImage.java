package kh.fin.giboo.notice.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class NoticeImage {
	private int imgNo;
	private String imgRename;
	private String imgOriginal;
	private int imgLevel;
	private int noticeNo;
}
