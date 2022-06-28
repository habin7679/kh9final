package com.kh.final6.entity;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class StoreLikeDto {
	private long likeNo;
	private long storeNo;
	private long memberNo;
	private int likeCheck;
}
