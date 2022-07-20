package com.kh.final6.repository;

import com.kh.final6.entity.StoreLikeDto;

public interface StoreLikeDao {

	int insert(StoreLikeDto storelikeDto);	
	void delete(StoreLikeDto storeLikeDto);
	int findLike(StoreLikeDto storelikeDto);
	int likemax();
	
}
