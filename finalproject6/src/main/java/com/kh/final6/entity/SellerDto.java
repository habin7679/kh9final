package com.kh.final6.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class SellerDto {

	private int sellerNo;
	private int memberNo;
	private Date sellerRegistDate;
	private String sellerBank;
	private long sellerAccount;
	private int sellerPoint;
	private String sellerType;
	private long sellerBusinessNum;
}
