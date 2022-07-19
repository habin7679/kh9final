package com.kh.final6.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class SendDto {
	private int smemberNo;
	private int msgNo;
	private int rmemberNo;
	
}
