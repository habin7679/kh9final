package com.kh.final6.repository;

import com.kh.final6.entity.BarRoomStoreDto;

public interface BarRoomStoreDao {
	int save(BarRoomStoreDto barRoomStoreDto);
	
	int saveRoom(BarRoomStoreDto barRoomStoreDto);
	int saveBar(BarRoomStoreDto barRoomStoreDto);
	int saveOff(BarRoomStoreDto barRoomStoreDto);

	int edit(BarRoomStoreDto barRoomStoreDto);
	int editBar(BarRoomStoreDto barRoomStoreDto);
	int editRoom(BarRoomStoreDto barRoomStoreDto);
	int editOff(BarRoomStoreDto barRoomStoreDto);
	
}
