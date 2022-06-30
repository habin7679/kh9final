package com.kh.final6.repository;

import java.util.List;

import com.kh.final6.entity.NoticeDto;

public interface NoticeDao {

	List<NoticeDto> list(String type,String keyword, int p, int s);
	int count(String type, String keyword);
	
	NoticeDto one(int noticeNo);
	
	int getSequence();
	int insert(NoticeDto noticeDto);
	
	boolean delete(int noticeNo);
	
	boolean update(NoticeDto noticeDto);

}
