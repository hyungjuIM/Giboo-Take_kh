package kh.fin.giboo.payment.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Payment {
    private int paymentNo;
    private String paymentType;
    private String paymentDate;
    private int paymentPrice;
}
