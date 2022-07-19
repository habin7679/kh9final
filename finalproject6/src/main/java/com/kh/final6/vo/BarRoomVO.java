package com.kh.final6.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class BarRoomVO {
	
	private int storeNo;
	private int barPrice;
	private int barCount;
	private int roomPrice;
	private int roomCount;
	private int roomFour;
	private int roomSix;
	private int roomEight;
	

}
