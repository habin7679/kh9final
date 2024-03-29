package com.kh.final6.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class KakaoPayCancelResponsetVO {
	private String aid; //요청 고유 번호
	private String tid; // 결제 고유 번호
	private String cid; // 가맹점 코드
	private String status; // 결제 상태
	private String partner_order_id; //가맹점 주문번호
	private String partner_user_id; // 가맹점 회원 아이디
	private String payment_method_type; //결제수단 (카드, 현금)
	private AmountVO amount; // 결제 금액 정보
	private AmountVO approved_cancel_amount; // 이번 요청으로 취소된 금액 정보
	private AmountVO canceled_amount; // 누적 취소 금액 정보
	private AmountVO cancel_available_amount; // 취소 가능한 남은 금액 정보
	private String item_name; // 상품 이름
	private String item_code; // 상품 코드
	private int quantity;
	private Date created_at;
	private Date approved_at;
	private Date canceled_at;
	private String payload;

	
}
