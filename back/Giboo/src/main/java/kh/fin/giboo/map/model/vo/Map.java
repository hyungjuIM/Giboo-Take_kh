package kh.fin.giboo.map.model.vo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class Map {
	private int mapNo;
	private int volunteerNo;
	private int categoryNo;
	private double latitude; //위도
	private double longtiude; //경도
	
}
