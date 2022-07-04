package com.kh.final6.vo;


import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class KakaoPayRegularCancelResponseVO {

	private String cid;//가맹점 코드, 10자
	private String sid;//정기 결제 고유번호, 20자
	private String status;//정기 결제 상태, ACTIVE(활성) 또는 INACTIVE(비활성) 중 하나
	private Date created_at;	//SID 발급 시각
	private Date last_approved_at;//	마지막 결제승인 시각
	private Date inactivated_at;//	정기결제 비활성화 시각
}
