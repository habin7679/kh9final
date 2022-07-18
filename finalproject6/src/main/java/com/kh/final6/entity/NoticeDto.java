package com.kh.final6.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class NoticeDto {
	private int noticeNo;
	private int memberNo;
	private String noticeWriter;
	private String noticeHead;
	private String noticeTitle;
	private String noticeContent;
	private Date noticeTime;
	private int noticeReadcount;
	private int pin;
}
