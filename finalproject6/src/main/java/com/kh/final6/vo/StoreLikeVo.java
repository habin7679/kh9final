package com.kh.final6.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class StoreLikeVo {
	private int like_no;
	private int store_no;
	private String member_no;
	private int like_check;
}
