package com.kh.final6.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class StoreDto {
	private int storeNo; 
	private String category;
	private String dong;
	private String gu;
    private int sellerNo;
    private String storeName;
    private String storeCall;
    private String storePost;
    private String storeAddress;
    private String storeDetailAddress;
    private String storeBossName ;
    private Date storeRegistDate;
    private int storeLikecount;
    private String storeContent;
    private String storeLunchTime;
    private String storeDinnerTime;
    private String storeStart;
    private String storeEnd;
    private int  storeReservationPrice;
}
