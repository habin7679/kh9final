package com.kh.final6.entity;

import java.sql.Date;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class MsgDto {
	private int msgNo;
	private String msgNote;
	private Date sendDate;
	private int smemberNo;
	private int rmemberNo;
}
