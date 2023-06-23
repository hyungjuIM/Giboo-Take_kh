package kh.fin.giboo.admin.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ParentCategory {
    private int parentCategoryNo;
    private String parentCategoryName;
    private String parentCategoryThumbnail;
    private String categoryName;
}
