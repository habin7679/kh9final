package com.kh.final6.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data	@AllArgsConstructor @NoArgsConstructor @Builder
public class PaymentActionDetailsVO {

	private String aid;
	private String approved_at;
	private int amount;
	private int point_amount;
	private int discount_amount;
	private String payment_action_type;
	private String payload;
	
}
