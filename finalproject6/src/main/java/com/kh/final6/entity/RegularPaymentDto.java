package com.kh.final6.entity;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class RegularPaymentDto {
	
	private int RegularPaymentNo;
	private int storeNo;
	private int sellerNo;
	private int RegularPaymentTid;
	private Date RegularPaymentTime;
	private int RegularPaymentPrice;

}
