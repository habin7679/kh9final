package com.kh.final6.entity;




import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class RegularPaymentDto {
	
	private int regularPaymentNo;
	private int storeNo;
	private int sellerNo;
	private String regularPaymentTid;
	private Date regularPaymentTime;
	private int regularPaymentPrice;
	private String regularPaymentSid;
	private String regularPaymentName;
	private String regularPaymentUserId;
	private String regularPaymentStatus;

}
