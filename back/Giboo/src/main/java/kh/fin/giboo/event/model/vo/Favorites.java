package kh.fin.giboo.event.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Favorites {
	
	private int favNo;
	private String favStatus;
	private int memberNo;
	private int donationNo;
	private int volunteerNo;
}
