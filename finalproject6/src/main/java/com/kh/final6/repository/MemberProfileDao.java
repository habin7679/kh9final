package com.kh.final6.repository;

public interface MemberProfileDao {
	void insert(int memberNo, int attachmentNo);
	int oneNo(int memberNo);

}
