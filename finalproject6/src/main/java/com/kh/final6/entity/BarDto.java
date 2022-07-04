package com.kh.final6.entity;

import lombok.Builder;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data 
@NoArgsConstructor 
@AllArgsConstructor 
@Builder
public class BarDto {
	private int storeNo;
	private int barPrice;
	private int barCount;

}
