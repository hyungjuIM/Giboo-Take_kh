package kh.fin.giboo.map.model.vo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class Map {
	private int mapNo;
	private double latitude; //위도
	private double longtitude; //경도
	private String vagencyName; // 봉사장소명
	private String volunteerPlace; // 봉사주소명
	private String categoryName; // 카테고리이름
	private int categoryNo;
	private int volunteerNo;
}
