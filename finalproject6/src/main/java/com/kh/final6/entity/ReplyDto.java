package com.kh.final6.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class ReplyDto {
	private int replyNo;
	private int replyTarget;
	private int memberNo;
	private String replyWriter;
	private String replyContent;
	private Date replyTime;
}
