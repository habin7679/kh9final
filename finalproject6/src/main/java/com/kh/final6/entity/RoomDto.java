package com.kh.final6.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data 
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class RoomDto {
	private int storeNo;
	private int roomPrice;
	private int roomCount;
	private int roomFour;
	private int roomSix;
	private int roomEight;
	

}
