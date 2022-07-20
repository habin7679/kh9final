package com.kh.final6.repository;

import java.util.List;

import com.kh.final6.entity.StoreAttachDto;

public interface StoreAttachDao {

	void insert(int storeNo, int attachmentNo);
	
	// StoreAttachDto
	List<StoreAttachDto> infolist(int storeNo);
	int info(int storeNo);
	
}
