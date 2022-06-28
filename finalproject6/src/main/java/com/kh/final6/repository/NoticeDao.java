package com.kh.final6.repository;

import java.util.List;

import com.kh.final6.entity.NoticeDto;

public interface NoticeDao {

	List<NoticeDto> selectList();
	
	NoticeDto one(long noticeNo);

}
