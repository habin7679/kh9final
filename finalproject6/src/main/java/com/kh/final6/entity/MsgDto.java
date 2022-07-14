package com.kh.final6.entity;

import java.sql.Date;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class MsgDto {
	private int sendNo;
	private int memberNo;
	private String sendNote;
	private Date sendDate;
	private String sendNick;
	private String recvNick;
}
