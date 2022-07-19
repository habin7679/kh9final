package com.kh.final6.repository;

import java.util.List;

import com.kh.final6.entity.OffDayDto;
import com.kh.final6.entity.StoreDto;
import com.kh.final6.vo.BarRoomVO;
import com.kh.final6.vo.StoreComplexSearchVO;

public interface StoreDao {
	
	List<StoreDto> list();
	StoreDto one(int storeNo);	
	void delete(int storeNo);
	int insert(StoreDto storeDto);	
	StoreDto update(StoreDto storeDto);
 

   int selectReservationPrice(int storeNo);
BarRoomVO barRoom(int storeNo);
OffDayDto offDayOne(int storeNo);
BarRoomVO cntBarRoom(String reservationDate, int storeNo);

List<StoreDto> complexSearch(String keyword);
List<StoreDto> categorySearch(String category);

}
