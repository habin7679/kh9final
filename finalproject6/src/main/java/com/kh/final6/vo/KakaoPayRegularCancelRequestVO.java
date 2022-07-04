package com.kh.final6.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class KakaoPayRegularCancelRequestVO {

	private String sid;//요청 고유 번호
	private String cid;//가맹점 코드
}
