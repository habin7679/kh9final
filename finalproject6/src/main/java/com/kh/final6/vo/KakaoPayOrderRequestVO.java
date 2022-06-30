package com.kh.final6.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data	@AllArgsConstructor @NoArgsConstructor @Builder
public class KakaoPayOrderRequestVO {
	private String cid;
	private String tid;
}
