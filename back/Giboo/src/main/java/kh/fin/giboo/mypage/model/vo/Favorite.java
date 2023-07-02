package kh.fin.giboo.mypage.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Favorite {
	
	private int favoriteNo;
	private char favoriteStatus;
	private int memberNo;
	private int donationNo;
	private int volunteerNo;
}
