package com.kh.final6.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class ReplyDto {
	private long replyNo;
	private long replyTarget;
	private long memberNo;
	private String replyWriter;
	private String replyContent;
	private Date replyTime;
}
