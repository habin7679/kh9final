package com.kh.final6.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class RegularCardInfoVO {
	private String purchase_corp; //매입 카드사 한글명
	private String purchase_corp_code;//매입 카드사 코드
	private String issuer_crop;// 카드 발급사 한글명
	private String issuer_crop_code;// 카드 발급사 코드
	private String kakopay_purchase_corp;// 카카오페이 매입사명
	private String kakopay_purchase_corp_code;// 카카오페이 매입사 코드
	private String kakopay_issuer_corp;// 카카오페이 발급사명
	private String kakopay_issuer_corp_code;// 카카오페이 발급사 코드
	private String  bin;// 카드 BIN
	private String  card_type;// 카드 타입
	private String install_month;// 할부 개월 수 
	private String approved_id;// 카드사 승인번호
	private String card_mid;// 카드사 가맹점 번호


}
