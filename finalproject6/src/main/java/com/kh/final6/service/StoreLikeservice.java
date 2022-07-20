package com.kh.final6.service;

import com.kh.final6.entity.StoreLikeDto;

public interface StoreLikeservice {
	int save(StoreLikeDto storelikeDto);
	
	int save2(int store_no, int member_no);
	
}
