package com.kh.final6.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data @AllArgsConstructor @NoArgsConstructor @Builder @ToString
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
    private int storeLikeCount;
    private String storeContent;
    private String storeLunchTime;
    private String storeDinnerTime;
    private String storeStart;
    private String storeEnd;
    private int storeReservationPrice;
}
