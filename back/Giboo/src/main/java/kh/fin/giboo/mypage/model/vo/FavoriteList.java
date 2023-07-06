package kh.fin.giboo.mypage.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
// 즐겨찾기 목록 조회
public class FavoriteList {

	private int favoriteNo;
	private String categoryName;
	private String parentCategoryName;
	private String favoriteTitle;

}
