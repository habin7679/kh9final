package com.kh.final6.repository;

import java.util.List;

import com.kh.final6.entity.RoomDto;

public interface RoomDao {
	List<RoomDto>list();
	void delete(int storeNo);
	RoomDto insert(RoomDto roomDto);
	RoomDto update(RoomDto roomDto);

	
}
