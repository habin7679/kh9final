package com.kh.final6.vo;

import java.sql.Date;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class SendMsgVO {
	private int smemberNo;
	private int msgNo;
	private int rmemberNo;
	private String msgNote;
	private Date sendDate;
	private String memberNick;
}
