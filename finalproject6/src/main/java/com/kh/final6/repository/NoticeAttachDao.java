package com.kh.final6.repository;

public interface NoticeAttachDao {

	void insert(int noticeNo, int attachmentNo);
	int info(int noticeNo);
}
