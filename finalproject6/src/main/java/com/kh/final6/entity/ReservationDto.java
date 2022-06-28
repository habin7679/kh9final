package com.kh.final6.entity;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class ReservationDto {

	private int reservationNo;
	private int storeNo;
	private int memberNo;
	private int reservationPrice;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date reservationDate;
	private String reservationStatus;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date reservationPayment;
	private int reservationPeople;
	private int reservationVisitState;
	private String reservationTime;
	
}
