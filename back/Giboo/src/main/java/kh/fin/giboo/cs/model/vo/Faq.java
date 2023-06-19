package kh.fin.giboo.cs.model.vo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Faq {
	private int faqNo;
	private String faqTitle;
	private String faqContent;
	private String faqCategory;
	

}
