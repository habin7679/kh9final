package com.kh.final6.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class BoardVO {
	private int qnaNo;
	private int memberNo;
	private String qnaTitle,qnaContent, qnaWriter;
	private Date qnaTime;
}
