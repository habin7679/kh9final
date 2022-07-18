package com.kh.final6.repository;

import java.util.List;

import com.kh.final6.entity.StoreDto;

public interface StoreDao {
	
	List<StoreDto> list();
	StoreDto one(int storeNo);	
	void delete(int storeNo);
	int insert(StoreDto storeDto);	
	StoreDto update(StoreDto storeDto);
	

 
	int selectReservationPrice(int storeNo);


}
