package com.kh.final6.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class QnaDto {
	private long qnaNo;
	private long memberNo;
	private String qnaWriter;
	private String qnaHead;
	private String qnaTitle;
	private String qnaContent;
	private Date qnaTime;
	private int qnaReadcount;
	private int groupNo;
	private int superNo;
	private int depth;
}
