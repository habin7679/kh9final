package com.kh.final6.vo;

import java.sql.Date;

import com.kh.final6.entity.SellerDto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data @AllArgsConstructor @NoArgsConstructor @Builder

public class SellerMemberVO {
	private int sellerNo;
	private int memberNo;
	private Date sellerRegistDate;
	private String sellerBank;
	private long sellerAccount;
	private int sellerPoint;
	private String sellerType;
	private long sellerBusinessNum;
	private String memberName;
	private String memberId;
	private String memberKind;
}
