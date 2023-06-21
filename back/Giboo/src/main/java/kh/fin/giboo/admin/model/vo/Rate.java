package kh.fin.giboo.admin.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Rate {
	private int rateNo;
	private String rateName;
	private int maxPoint;
	private int minPoint;
	private int point;
}
