package com.kh.final6.entity;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class PaymentDto {
	
	private int paymentNo;
	private int storeNo;
	private int memberNo;
	private int paymentTid;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date paymentTime;
}
