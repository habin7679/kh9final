package com.kh.final6.vo;


import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class ReservationMemberCheckVO {
	
	private String reservationTime;
	private String memberName;
	private String memberPhone;
	private String memberId;
	private Date reservationDate;
	private int reservationPrice;
	private int reservationPeople;
	private int reservationVisitState;
	private int storeNo;
	private int paymentNo;
	private int reservationNo;
	private int bar;
	private int roomFour;
	private int roomSix;
	private int roomEight;
}
