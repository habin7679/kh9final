package com.kh.final6.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class TogetherDto {
	private int togetherNo;
	private int memberNo;
	private String togetherWriter;
	private String togetherTitle;
	private String togetherContent;
	private Date togetherTime;
	private int togetherReadcount;
	private int togetherReplycount;
}
