package com.kh.final6.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class RegularAmountVO {
	private int total; //전체 결제 금액
	private int tax_free; //비과세 금액
	private int vat; //부가세 금액
	private int green_deposit; //컵 보증금

}
