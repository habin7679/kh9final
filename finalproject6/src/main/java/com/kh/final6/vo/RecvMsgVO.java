package com.kh.final6.vo;

import java.sql.Date;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class RecvMsgVO {
	private int rmemberNo;
	private int msgNo;
	private int smemberNo;
	private String msgNote;
	private Date sendDate;
	private String memberNick;
	private String read;

}
