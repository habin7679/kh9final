package com.kh.final6.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class KakaoPayRegularReadyResponseVO {

	private String tid; //결제 고유번호
	private String next_redirect_mobile_url, next_redirect_pc_url; //결제 페이지 주소
	private Date created_at;
}
