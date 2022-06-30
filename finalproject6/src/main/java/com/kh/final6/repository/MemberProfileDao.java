package com.kh.final6.repository;

public interface MemberProfileDao {
	void insert(String memberId, int attachmentNo);
	int info(String memberId);
}
