package com.kh.final6.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class ReviewDto {
	private int reviewNo;
	private int storeNo;
	private int memberNo;
	private String reviewContent;
	private Date reviewTime;
	private int reviewScore;
	private String reviewWriter;
}
