package com.kh.final6.vo;

import java.sql.Date;

import com.kh.final6.entity.SellerDto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class SellerInfoVO {

	private String sellerBank;
	private long sellerAccount;
	private int sellerPoint;
	private String memberName;
	private String memberPhone;
	private String memberPw;
	private String memberId;
}
