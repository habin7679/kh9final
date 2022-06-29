package com.kh.final6.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data	@AllArgsConstructor @NoArgsConstructor @Builder
public class PaymentVO {

	private int storeNo;
	private int reservationNo;
	private int memberNo;
}
