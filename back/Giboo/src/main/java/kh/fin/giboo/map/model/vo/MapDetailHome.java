package kh.fin.giboo.map.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
// 맵 디테일 홈
public class MapDetailHome {
	private String volunteerAddr; // 봉사주소
	private String memberTel; // 사용자 전화번호
	private String volunteerContent; // 봉사 내용

}
