package com.kh.final6.entity;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class OffDayDto {

	private int storeNo;
	private Date offStart;
	private Date offEnd;
}
