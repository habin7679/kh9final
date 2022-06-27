package com.kh.final6.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class NoticeDto {
	private long noticeNo;
	private long memberNo;
	private String noticeWriter;
	private String noticeHead;
	private String noticeTitle;
	private String noticeContent;
	private Date noticeTime;
	private int noticeReadcount;
}
