package com.kh.final6.repository;

import java.util.List;

import com.kh.final6.entity.StoreDto;

public interface StoreDao {
	
	List<StoreDto> list(String type, String keyword, int p, int s);
	int count(String type, String keyword);
	StoreDto one(int storeNo);	
	void delete(int storeNo);
	void insert(StoreDto storeDto);	
	StoreDto update(StoreDto storeDto);
	

 
	int selectReservationPrice(int storeNo);


}
