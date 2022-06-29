package com.kh.final6.entity;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class NoticeAttachDto {
	private int noticeNo;
	private long attachmentNo;
}
