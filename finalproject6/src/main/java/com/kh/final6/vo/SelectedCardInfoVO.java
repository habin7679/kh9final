package com.kh.final6.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class SelectedCardInfoVO {
	
	private String card_bin;
	private int install_month;
	private String card_corp_name;
	private String interest_free_install;
}
