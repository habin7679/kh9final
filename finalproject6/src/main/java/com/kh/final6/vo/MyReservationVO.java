package com.kh.final6.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder

public class MyReservationVO {

	private String memberName;
	private String memberNick;
	private String memberPhone;
	private String memberId;
	private String reservationTime;
	private Date reservationDate;
	private int reservationPrice;
	private int reservationPeople;
	private int reservationVisitState;
	private String reservationContent;
	private String storeName;
	private String storePost;
	private String storeAddress;
	private String storeDetailAddress;
	private int paymentNo;
}
