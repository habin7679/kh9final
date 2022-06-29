package com.kh.final6.repository;

import java.util.List;

import com.kh.final6.entity.NoticeDto;

public interface NoticeDao {

	List<NoticeDto> list(String type,String keyword, int p, int s);
	int count(String type, String keyword);
	
	NoticeDto one(long noticeNo);
	
	long getSequence();
	long insert(NoticeDto noticeDto);

}
