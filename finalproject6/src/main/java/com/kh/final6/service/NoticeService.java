package com.kh.final6.service;

import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

import com.kh.final6.entity.NoticeDto;

public interface NoticeService {
	int save(NoticeDto noticeDto, MultipartFile noticeImg) throws IllegalStateException, IOException;

	void edit(NoticeDto noticeDto, MultipartFile noticeImg) throws IllegalStateException, IOException;
}
 