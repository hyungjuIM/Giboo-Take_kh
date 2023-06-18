package kh.fin.giboo.event.model.vo;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class EventDetailMember {
	private int eventNo;
	private String profileImg; // 프로필 이미지
	private String memberNick; // 사용자 별명
}
