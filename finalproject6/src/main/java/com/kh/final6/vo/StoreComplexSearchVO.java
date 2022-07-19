package com.kh.final6.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class StoreComplexSearchVO {
	private String category;
	private String dong;
	private String gu;
    private String storeName;
    private String storeAddress;
}
